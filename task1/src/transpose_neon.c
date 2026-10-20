/*
 * transpose_neon.c -- ручная векторизация транспонирования на intrinsics
 * NEON (ARMv8, 128 бит = 2 double). Каждый этап оптимизации оформлен
 * отдельной функцией, все они замеряются в одном запуске вместе с
 * эталонным memcpy того же объёма.
 *
 * Сборка: clang -O3 -mcpu=native -DBS=256 transpose_neon.c
 * Запуск: ./transpose_neon [N] [повторы] [pad]
 */
#include "common.h"
#include <arm_neon.h>

#ifndef BS
#define BS 256              /* размер внешнего блока (тайла) */
#endif
#ifndef PF
#define PF 8                /* на сколько микроблоков вперёд prefetch */
#endif

/* хвосты: элементы, не попавшие в блоки по k (n не кратно k) */
static void tail(const double *a, double *b, size_t n, size_t ld, size_t k)
{
    size_t nk = n / k * k;
    for (size_t i = 0; i < n; i++)
        for (size_t j = (i < nk ? nk : 0); j < n; j++)
            b[j * ld + i] = a[i * ld + j];
}

/*
 * Ядро 2x2: две строки A читаются двумя векторами, перестановками
 * trn1/trn2 получаются два столбца, которые записываются строками B.
 *   r0 = (a00 a01), r1 = (a10 a11)
 *   trn1 -> (a00 a10), trn2 -> (a01 a11)
 */
static inline void kernel2(const double *a, double *b, size_t ld)
{
    float64x2_t r0 = vld1q_f64(a);
    float64x2_t r1 = vld1q_f64(a + ld);
    vst1q_f64(b,     vtrn1q_f64(r0, r1));
    vst1q_f64(b + ld, vtrn2q_f64(r0, r1));
}

/* Этап 1: ядро 2x2, простой обход всей матрицы */
void transpose_neon2(const double *restrict a, double *restrict b,
                     size_t n, size_t ld)
{
    size_t n2 = n / 2 * 2;
    for (size_t i = 0; i < n2; i += 2)
        for (size_t j = 0; j < n2; j += 2)
            kernel2(a + i * ld + j, b + j * ld + i, ld);
    tail(a, b, n, ld, 2);
}

/* Этап 2: ядро 2x2 + блочный обход BS x BS */
void transpose_neon2_blocked(const double *restrict a, double *restrict b,
                             size_t n, size_t ld)
{
    size_t n2 = n / 2 * 2;
    for (size_t ii = 0; ii < n2; ii += BS)
        for (size_t jj = 0; jj < n2; jj += BS) {
            size_t ie = ii + BS < n2 ? ii + BS : n2;
            size_t je = jj + BS < n2 ? jj + BS : n2;
            for (size_t i = ii; i < ie; i += 2)
                for (size_t j = jj; j < je; j += 2)
                    kernel2(a + i * ld + j, b + j * ld + i, ld);
        }
    tail(a, b, n, ld, 2);
}

/*
 * Ядро 4x4 из четырёх 2x2: читается 4 строки по 4 double (8 векторов),
 * все перестановки делаются в регистрах, записывается 4 строки B.
 * Каждая строка кэша A и B за одно обращение используется на 32 байта
 * вместо 16, обращений к памяти на элемент вдвое меньше, чем при
 * последовательном вызове 2x2 по одной паре строк.
 */
static inline void kernel4(const double *a, double *b, size_t ld)
{
    float64x2_t a0l = vld1q_f64(a),         a0h = vld1q_f64(a + 2);
    float64x2_t a1l = vld1q_f64(a + ld),     a1h = vld1q_f64(a + ld + 2);
    float64x2_t a2l = vld1q_f64(a + 2 * ld), a2h = vld1q_f64(a + 2 * ld + 2);
    float64x2_t a3l = vld1q_f64(a + 3 * ld), a3h = vld1q_f64(a + 3 * ld + 2);

    vst1q_f64(b,             vtrn1q_f64(a0l, a1l));
    vst1q_f64(b + 2,         vtrn1q_f64(a2l, a3l));
    vst1q_f64(b + ld,         vtrn2q_f64(a0l, a1l));
    vst1q_f64(b + ld + 2,     vtrn2q_f64(a2l, a3l));
    vst1q_f64(b + 2 * ld,     vtrn1q_f64(a0h, a1h));
    vst1q_f64(b + 2 * ld + 2, vtrn1q_f64(a2h, a3h));
    vst1q_f64(b + 3 * ld,     vtrn2q_f64(a0h, a1h));
    vst1q_f64(b + 3 * ld + 2, vtrn2q_f64(a2h, a3h));
}

/* Этап 3: ядро 4x4 + блочный обход BS x BS */
void transpose_neon4_blocked(const double *restrict a, double *restrict b,
                             size_t n, size_t ld)
{
    size_t n4 = n / 4 * 4;
    for (size_t ii = 0; ii < n4; ii += BS)
        for (size_t jj = 0; jj < n4; jj += BS) {
            size_t ie = ii + BS < n4 ? ii + BS : n4;
            size_t je = jj + BS < n4 ? jj + BS : n4;
            for (size_t i = ii; i < ie; i += 4)
                for (size_t j = jj; j < je; j += 4)
                    kernel4(a + i * ld + j, b + j * ld + i, ld);
        }
    tail(a, b, n, ld, 4);
}

/*
 * Ядро 4x4 с загрузкой/записью парами векторов (vld1q_f64_x2 /
 * vst1q_f64_x2 -> ldp q / stp q): 4 загрузки и 4 записи по 32 байта.
 */
static inline void kernel4x2(const double *a, double *b, size_t ld)
{
    float64x2x2_t r0 = vld1q_f64_x2(a);
    float64x2x2_t r1 = vld1q_f64_x2(a + ld);
    float64x2x2_t r2 = vld1q_f64_x2(a + 2 * ld);
    float64x2x2_t r3 = vld1q_f64_x2(a + 3 * ld);
    float64x2x2_t c;

    c.val[0] = vtrn1q_f64(r0.val[0], r1.val[0]);
    c.val[1] = vtrn1q_f64(r2.val[0], r3.val[0]);
    vst1q_f64_x2(b, c);
    c.val[0] = vtrn2q_f64(r0.val[0], r1.val[0]);
    c.val[1] = vtrn2q_f64(r2.val[0], r3.val[0]);
    vst1q_f64_x2(b + ld, c);
    c.val[0] = vtrn1q_f64(r0.val[1], r1.val[1]);
    c.val[1] = vtrn1q_f64(r2.val[1], r3.val[1]);
    vst1q_f64_x2(b + 2 * ld, c);
    c.val[0] = vtrn2q_f64(r0.val[1], r1.val[1]);
    c.val[1] = vtrn2q_f64(r2.val[1], r3.val[1]);
    vst1q_f64_x2(b + 3 * ld, c);
}

/* Этап 4: ядро 4x4 с парными загрузками + блочный обход + prefetch */
void transpose_neon4_pf(const double *restrict a, double *restrict b,
                        size_t n, size_t ld)
{
    size_t n4 = n / 4 * 4;
    for (size_t ii = 0; ii < n4; ii += BS)
        for (size_t jj = 0; jj < n4; jj += BS) {
            size_t ie = ii + BS < n4 ? ii + BS : n4;
            size_t je = jj + BS < n4 ? jj + BS : n4;
            for (size_t i = ii; i < ie; i += 4) {
                const double *ar = a + i * ld;
                for (size_t j = jj; j < je; j += 4) {
                    /* подкачиваем строки A на PF микроблоков вперёд */
                    __builtin_prefetch(ar + j + 4 * PF, 0, 0);
                    __builtin_prefetch(ar + ld + j + 4 * PF, 0, 0);
                    __builtin_prefetch(ar + 2 * ld + j + 4 * PF, 0, 0);
                    __builtin_prefetch(ar + 3 * ld + j + 4 * PF, 0, 0);
                    kernel4x2(ar + j, b + j * ld + i, ld);
                }
            }
        }
    tail(a, b, n, ld, 4);
}

/*
 * Ядро 8x8 из четырёх ядер 4x4: из каждой строки кэша A и B за один
 * заход используется 64 байта (половина 128-байтной строки M4).
 */
static inline void kernel8(const double *a, double *b, size_t ld)
{
    kernel4x2(a,             b,             ld);
    kernel4x2(a + 4,         b + 4 * ld,     ld);
    kernel4x2(a + 4 * ld,     b + 4,         ld);
    kernel4x2(a + 4 * ld + 4, b + 4 * ld + 4, ld);
}

/* Этап 5: ядро 8x8 + блочный обход BS x BS */
void transpose_neon8_blocked(const double *restrict a, double *restrict b,
                             size_t n, size_t ld)
{
    size_t n8 = n / 8 * 8;
    for (size_t ii = 0; ii < n8; ii += BS)
        for (size_t jj = 0; jj < n8; jj += BS) {
            size_t ie = ii + BS < n8 ? ii + BS : n8;
            size_t je = jj + BS < n8 ? jj + BS : n8;
            for (size_t i = ii; i < ie; i += 8)
                for (size_t j = jj; j < je; j += 8)
                    kernel8(a + i * ld + j, b + j * ld + i, ld);
        }
    tail(a, b, n, ld, 8);
}

/* эталон: копирование того же объёма (практический предел памяти) */
void copy_ref(const double *restrict a, double *restrict b,
              size_t n, size_t ld)
{
    memcpy(b, a, n * ld * sizeof(double));
}

static size_t check_copy(const double *a, const double *b,
                         size_t n, size_t ld)
{
    return memcmp(a, b, n * ld * sizeof(double)) != 0;
}

int main(int argc, char **argv)
{
    size_t n = arg_n(argc, argv, 8192);
    int reps = arg_reps(argc, argv, 5);
    size_t ld = arg_ld(argc, argv, n);
    double *a = alloc_matrix(n, ld), *b = alloc_matrix(n, ld);
    fill_matrix(a, n, ld);
    printf("N = %zu, BS = %d\n", n, BS);

    /* memcpy замеряем отдельно: bench() проверяет именно транспонирование */
    double tmin = 1e30;
    memset(b, 0, n * ld * sizeof(double));
    for (int r = 0; r < reps; r++) {
        double t0 = wtime();
        copy_ref(a, b, n, ld);
        double t = wtime() - t0;
        if (t < tmin) tmin = t;
    }
    printf("%-28s  min %8.4f s  %24.2f GB/s  %s\n", "memcpy (эталон)", tmin,
           2.0 * n * n * sizeof(double) / tmin / 1e9,
           check_copy(a, b, n, ld) ? "ОШИБКА" : "ok");

    bench("neon2 (2x2)", transpose_neon2, a, b, n, ld, reps);
    bench("neon2_blocked (2x2+BS)", transpose_neon2_blocked,
          a, b, n, ld, reps);
    bench("neon4_blocked (4x4+BS)", transpose_neon4_blocked,
          a, b, n, ld, reps);
    bench("neon4_pf (4x4 ldp/stp+pf)", transpose_neon4_pf,
          a, b, n, ld, reps);
    bench("neon8_blocked (8x8+BS)", transpose_neon8_blocked,
          a, b, n, ld, reps);
    free(a);
    free(b);
    return 0;
}
