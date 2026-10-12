/*
 * common.h -- общая часть для всех вариантов программы транспонирования:
 * выделение памяти, заполнение, проверка результата, замер времени.
 */
#ifndef COMMON_H
#define COMMON_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define ALIGN 64            /* выравнивание под строку кэша / вектор AVX-512 */

static double wtime(void)
{
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec + ts.tv_nsec * 1e-9;
}

static double *alloc_matrix(size_t n)
{
    size_t bytes = n * n * sizeof(double);
    bytes = (bytes + ALIGN - 1) / ALIGN * ALIGN;
    double *p = aligned_alloc(ALIGN, bytes);
    if (!p) {
        fprintf(stderr, "не удалось выделить %zu байт\n", bytes);
        exit(1);
    }
    return p;
}

static void fill_matrix(double *a, size_t n)
{
    for (size_t i = 0; i < n; i++)
        for (size_t j = 0; j < n; j++)
            a[i * n + j] = (double)(i * n + j);
}

/* возвращает число неверных элементов */
static size_t check_transpose(const double *a, const double *b, size_t n)
{
    size_t bad = 0;
    for (size_t i = 0; i < n; i++)
        for (size_t j = 0; j < n; j++)
            if (b[j * n + i] != a[i * n + j])
                bad++;
    return bad;
}

typedef void (*transpose_fn)(const double *a, double *b, size_t n);

/*
 * Запускает fn reps раз и печатает минимальное и среднее время.
 * Перед замером матрица b заполняется нулями (чтобы страницы были
 * уже выделены ОС и не влияли на время).
 */
static double bench(const char *name, transpose_fn fn,
                    const double *a, double *b, size_t n, int reps)
{
    double tmin = 1e30, tsum = 0;
    memset(b, 0, n * n * sizeof(double));
    for (int r = 0; r < reps; r++) {
        double t0 = wtime();
        fn(a, b, n);
        double t = wtime() - t0;
        if (t < tmin) tmin = t;
        tsum += t;
    }
    size_t bad = check_transpose(a, b, n);
    /* через память проходит 2 * n^2 * 8 байт (чтение A + запись B) */
    double gbs = 2.0 * n * n * sizeof(double) / tmin / 1e9;
    printf("%-28s  min %8.4f s  avg %8.4f s  %6.2f GB/s  %s\n",
           name, tmin, tsum / reps, gbs, bad ? "ОШИБКА" : "ok");
    fflush(stdout);
    return tmin;
}

static size_t arg_n(int argc, char **argv, size_t def)
{
    return argc > 1 ? (size_t)strtoull(argv[1], NULL, 10) : def;
}

static int arg_reps(int argc, char **argv, int def)
{
    return argc > 2 ? atoi(argv[2]) : def;
}

#endif
