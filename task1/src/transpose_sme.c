/*
 * transpose_sme.c -- транспонирование на расширении SME (Scalable Matrix
 * Extension), самом новом векторном расширении, которое есть у Apple M4.
 *
 * В режиме streaming SVE у M4 длина вектора 512 бит (8 double), а
 * матричный регистр ZA делится на 8 тайлов ZA0.D..ZA7.D по 8x8 double.
 * Строку тайла можно загрузить "горизонтально" (svld1_hor_za64), а
 * сохранить "вертикально" (svst1_ver_za64) -- то есть столбец. Загрузив
 * строки A и выгрузив столбцы тайла, получаем транспонированный блок
 * без каких-либо перестановок в регистрах.
 *
 * Сборка: clang -O3 -mcpu=apple-m4 -DBS=256 transpose_sme.c
 * (-mcpu=native в Apple clang 17 SME не включает)
 * Запуск: ./transpose_sme [N] [повторы] [pad]
 */
#include "common.h"
#include <arm_sme.h>

#ifndef BS
#define BS 256              /* размер внешнего блока (тайла) */
#endif

static void tail(const double *a, double *b, size_t n, size_t ld, size_t k)
{
    size_t nk = n / k * k;
    for (size_t i = 0; i < n; i++)
        for (size_t j = (i < nk ? nk : 0); j < n; j++)
            b[j * ld + i] = a[i * ld + j];
}

/* длина вектора в режиме streaming SVE, в элементах double */
__arm_locally_streaming
static uint64_t sme_vl(void)
{
    return svcntd();
}

/*
 * Этап 1: блок 8x8 через один тайл ZA0: 8 горизонтальных загрузок
 * строк A, 8 вертикальных записей столбцов в строки B.
 */
__arm_locally_streaming __arm_new("za")
static void sme8_core(const double *a, double *b, size_t n8, size_t ld)
{
    svbool_t pg = svptrue_b64();
    for (size_t ii = 0; ii < n8; ii += BS)
        for (size_t jj = 0; jj < n8; jj += BS) {
            size_t ie = ii + BS < n8 ? ii + BS : n8;
            size_t je = jj + BS < n8 ? jj + BS : n8;
            for (size_t i = ii; i < ie; i += 8)
                for (size_t j = jj; j < je; j += 8) {
                    const double *pa = a + i * ld + j;
                    double *pb = b + j * ld + i;
                    for (uint32_t r = 0; r < 8; r++)
                        svld1_hor_za64(0, r, pg, pa + r * ld);
                    for (uint32_t c = 0; c < 8; c++)
                        svst1_ver_za64(0, c, pg, pb + c * ld);
                }
        }
}

void transpose_sme8(const double *restrict a, double *restrict b,
                    size_t n, size_t ld)
{
    size_t n8 = n / 8 * 8;
    sme8_core(a, b, n8, ld);
    tail(a, b, n, ld, 8);
}

/*
 * Этап 2: блок 16x16 через четыре тайла ZA0..ZA3:
 *   ZA0 = A[0..7][0..7],  ZA1 = A[0..7][8..15],
 *   ZA2 = A[8..15][0..7], ZA3 = A[8..15][8..15].
 * Столбец c блока выгружается из ZA0/ZA2 (или ZA1/ZA3) двумя записями
 * подряд, то есть в B пишется сразу 16 double = 128 байт = целая строка
 * кэша M4, а из A читается тоже по 128 байт на строку.
 * Номер тайла в intrinsics должен быть константой, поэтому цикл по
 * тайлам расписан вручную.
 */
__arm_locally_streaming __arm_new("za")
static void sme16_core(const double *a, double *b, size_t n16, size_t ld)
{
    svbool_t pg = svptrue_b64();
    for (size_t ii = 0; ii < n16; ii += BS)
        for (size_t jj = 0; jj < n16; jj += BS) {
            size_t ie = ii + BS < n16 ? ii + BS : n16;
            size_t je = jj + BS < n16 ? jj + BS : n16;
            for (size_t i = ii; i < ie; i += 16)
                for (size_t j = jj; j < je; j += 16) {
                    const double *pa = a + i * ld + j;
                    double *pb = b + j * ld + i;
                    for (uint32_t r = 0; r < 8; r++) {
                        svld1_hor_za64(0, r, pg, pa + r * ld);
                        svld1_hor_za64(1, r, pg, pa + r * ld + 8);
                        svld1_hor_za64(2, r, pg, pa + (r + 8) * ld);
                        svld1_hor_za64(3, r, pg, pa + (r + 8) * ld + 8);
                    }
                    for (uint32_t c = 0; c < 8; c++) {
                        svst1_ver_za64(0, c, pg, pb + c * ld);
                        svst1_ver_za64(2, c, pg, pb + c * ld + 8);
                        svst1_ver_za64(1, c, pg, pb + (c + 8) * ld);
                        svst1_ver_za64(3, c, pg, pb + (c + 8) * ld + 8);
                    }
                }
        }
}

void transpose_sme16(const double *restrict a, double *restrict b,
                     size_t n, size_t ld)
{
    size_t n16 = n / 16 * 16;
    sme16_core(a, b, n16, ld);
    tail(a, b, n, ld, 16);
}

int main(int argc, char **argv)
{
    size_t n = arg_n(argc, argv, 8192);
    int reps = arg_reps(argc, argv, 5);
    size_t ld = arg_ld(argc, argv, n);
    if (sme_vl() != 8) {
        /* ядра написаны под тайл 8x8 double (SVL = 512 бит) */
        printf("длина вектора SME %llu double, ожидалось 8\n",
               (unsigned long long)sme_vl());
        return 1;
    }
    double *a = alloc_matrix(n, ld), *b = alloc_matrix(n, ld);
    fill_matrix(a, n, ld);
    printf("N = %zu, BS = %d, SVL = %llu бит\n", n, BS,
           (unsigned long long)sme_vl() * 64);
    bench("sme8 (ZA 8x8+BS)", transpose_sme8, a, b, n, ld, reps);
    bench("sme16 (4 tiles ZA 16x16+BS)", transpose_sme16, a, b, n, ld, reps);
    free(a);
    free(b);
    return 0;
}
