/*
 * transpose_simd.c -- полуавтоматическая векторизация транспонирования:
 * директивы OpenMP SIMD, restrict, подсказки о выравнивании,
 * блочный (тайловый) обход и небольшие правки кода.
 *
 * Сборка: gcc -O3 -march=native -fopenmp-simd transpose_simd.c
 * Запуск: ./transpose_simd [N] [повторы]
 */
#include "common.h"

#ifndef BS
#define BS 64               /* размер внешнего блока (тайла) */
#endif
#define TS 8                /* размер микроблока = 8 double = 512 бит */

/* Этап 1: restrict + omp simd, внутренний цикл пишет B подряд */
void transpose_simd_rows(const double *restrict a, double *restrict b, size_t n)
{
    for (size_t j = 0; j < n; j++) {
        #pragma omp simd
        for (size_t i = 0; i < n; i++)
            b[j * n + i] = a[i * n + j];
    }
}

/* Этап 2: блочный обход BS x BS, внутри блока omp simd */
void transpose_blocked(const double *restrict a, double *restrict b, size_t n)
{
    for (size_t ii = 0; ii < n; ii += BS)
        for (size_t jj = 0; jj < n; jj += BS) {
            size_t ie = ii + BS < n ? ii + BS : n;
            size_t je = jj + BS < n ? jj + BS : n;
            for (size_t j = jj; j < je; j++) {
                #pragma omp simd
                for (size_t i = ii; i < ie; i++)
                    b[j * n + i] = a[i * n + j];
            }
        }
}

/*
 * Микроблок 8x8 с размерами-константами: оба цикла полностью
 * разворачиваются, и SLP-векторизатор может собрать запись строки B
 * целым 512-битным вектором.
 */
static inline void tile8(const double *restrict a, double *restrict b, size_t n)
{
    #pragma GCC unroll 8
    for (int j = 0; j < TS; j++) {
        #pragma GCC unroll 8
        for (int i = 0; i < TS; i++)
            b[j * n + i] = a[i * n + j];
    }
}

/* Этап 3: двухуровневые блоки (BS x BS из микроблоков 8x8) */
void transpose_tiled8(const double *restrict a, double *restrict b, size_t n)
{
    a = __builtin_assume_aligned(a, ALIGN);
    b = __builtin_assume_aligned(b, ALIGN);
    size_t n8 = n / TS * TS;
    for (size_t ii = 0; ii < n8; ii += BS)
        for (size_t jj = 0; jj < n8; jj += BS) {
            size_t ie = ii + BS < n8 ? ii + BS : n8;
            size_t je = jj + BS < n8 ? jj + BS : n8;
            for (size_t i = ii; i < ie; i += TS)
                for (size_t j = jj; j < je; j += TS)
                    tile8(a + i * n + j, b + j * n + i, n);
        }
    /* хвосты, если n не кратно 8 */
    for (size_t i = 0; i < n; i++)
        for (size_t j = (i < n8 ? n8 : 0); j < n; j++) {
            b[j * n + i] = a[i * n + j];
        }
}

int main(int argc, char **argv)
{
    size_t n = arg_n(argc, argv, 8192);
    int reps = arg_reps(argc, argv, 5);
    if (n % TS)
        printf("внимание: N не кратно %d, строки не выровнены\n", TS);
    double *a = alloc_matrix(n), *b = alloc_matrix(n);
    fill_matrix(a, n);
    printf("N = %zu, BS = %d\n", n, BS);
    bench("simd_rows (restrict+simd)", transpose_simd_rows, a, b, n, reps);
    bench("blocked (BSxBS + simd)", transpose_blocked, a, b, n, reps);
    bench("tiled8 (BSxBS, 8x8 SLP)", transpose_tiled8, a, b, n, reps);
    free(a);
    free(b);
    return 0;
}
