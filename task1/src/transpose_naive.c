/*
 * transpose_naive.c -- исходная программа: транспонирование плотной
 * квадратной матрицы B = A^T "в лоб". Никаких правок под векторизацию.
 *
 * Запуск: ./transpose_naive [N] [повторы]
 */
#include "common.h"

void transpose_naive(const double *a, double *b, size_t n)
{
    for (size_t i = 0; i < n; i++)
        for (size_t j = 0; j < n; j++)
            b[j * n + i] = a[i * n + j];
}

int main(int argc, char **argv)
{
    size_t n = arg_n(argc, argv, 8192);
    int reps = arg_reps(argc, argv, 5);
    double *a = alloc_matrix(n), *b = alloc_matrix(n);
    fill_matrix(a, n);
    printf("N = %zu, матрица %.0f МБ\n", n, n * n * 8.0 / (1 << 20));
    bench("naive", transpose_naive, a, b, n, reps);
    free(a);
    free(b);
    return 0;
}
