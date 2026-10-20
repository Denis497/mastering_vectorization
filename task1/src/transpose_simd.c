/*
 * transpose_simd.c -- полуавтоматическая векторизация транспонирования:
 * директивы OpenMP SIMD и clang loop, restrict, подсказки о выравнивании,
 * блочный (тайловый) обход и небольшие правки кода.
 *
 * Сборка: clang -O3 -mcpu=native -fopenmp-simd -DBS=256 -DTS=8
 *         transpose_simd.c
 * Запуск: ./transpose_simd [N] [повторы] [pad]
 */
#include "common.h"

#ifndef BS
#define BS 256              /* размер внешнего блока (тайла) */
#endif
#ifndef TS
#define TS 8                /* размер микроблока: 8 double = 64 байта */
#endif

/* Этап 1: restrict + omp simd, внутренний цикл пишет B подряд */
void transpose_simd_rows(const double *restrict a, double *restrict b,
                         size_t n, size_t ld)
{
    for (size_t j = 0; j < n; j++) {
        #pragma omp simd
        for (size_t i = 0; i < n; i++)
            b[j * ld + i] = a[i * ld + j];
    }
}

/* Этап 2: блочный обход BS x BS, внутри блока omp simd */
void transpose_blocked(const double *restrict a, double *restrict b,
                       size_t n, size_t ld)
{
    for (size_t ii = 0; ii < n; ii += BS)
        for (size_t jj = 0; jj < n; jj += BS) {
            size_t ie = ii + BS < n ? ii + BS : n;
            size_t je = jj + BS < n ? jj + BS : n;
            for (size_t j = jj; j < je; j++) {
                #pragma omp simd
                for (size_t i = ii; i < ie; i++)
                    b[j * ld + i] = a[i * ld + j];
            }
        }
}

/*
 * Микроблок TS x TS с размерами-константами: оба цикла полностью
 * разворачиваются, после чего компилятор объединяет соседние обращения
 * к строкам A и B (clang делает из них парные команды ldp/stp).
 */
static inline void tile(const double *restrict a, double *restrict b,
                        size_t ld)
{
    #pragma clang loop unroll(full)
    for (int j = 0; j < TS; j++) {
        #pragma clang loop unroll(full)
        for (int i = 0; i < TS; i++)
            b[j * ld + i] = a[i * ld + j];
    }
}

/* Этап 3: двухуровневые блоки (BS x BS из микроблоков TS x TS) */
void transpose_tiled(const double *restrict a, double *restrict b,
                     size_t n, size_t ld)
{
    a = __builtin_assume_aligned(a, ALIGN);
    b = __builtin_assume_aligned(b, ALIGN);
    size_t nt = n / TS * TS;
    for (size_t ii = 0; ii < nt; ii += BS)
        for (size_t jj = 0; jj < nt; jj += BS) {
            size_t ie = ii + BS < nt ? ii + BS : nt;
            size_t je = jj + BS < nt ? jj + BS : nt;
            for (size_t i = ii; i < ie; i += TS)
                for (size_t j = jj; j < je; j += TS)
                    tile(a + i * ld + j, b + j * ld + i, ld);
        }
    /* хвосты, если n не кратно TS */
    for (size_t i = 0; i < n; i++)
        for (size_t j = (i < nt ? nt : 0); j < n; j++)
            b[j * ld + i] = a[i * ld + j];
}

int main(int argc, char **argv)
{
    size_t n = arg_n(argc, argv, 8192);
    int reps = arg_reps(argc, argv, 5);
    size_t ld = arg_ld(argc, argv, n);
    double *a = alloc_matrix(n, ld), *b = alloc_matrix(n, ld);
    fill_matrix(a, n, ld);
    printf("N = %zu, BS = %d, TS = %d\n", n, BS, TS);
    bench("simd_rows (restrict+simd)", transpose_simd_rows,
          a, b, n, ld, reps);
    bench("blocked (BSxBS + simd)", transpose_blocked, a, b, n, ld, reps);
    bench("tiled (BSxBS, TSxTS SLP)", transpose_tiled, a, b, n, ld, reps);
    free(a);
    free(b);
    return 0;
}
