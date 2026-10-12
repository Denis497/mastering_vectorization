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

#define ALIGN 128           /* выравнивание под строку кэша Apple M4 (128 байт) */

static double wtime(void)
{
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec + ts.tv_nsec * 1e-9;
}

/*
 * Матрица n x n хранится по строкам с ведущей размерностью ld >= n:
 * элемент (i, j) лежит в p[i * ld + j]. При ld = n это обычное плотное
 * хранение; ld = n + pad добавляет в конец каждой строки pad пустых
 * элементов, чтобы шаг между строками не был степенью двойки.
 */
static double *alloc_matrix(size_t n, size_t ld)
{
    size_t bytes = n * ld * sizeof(double);
    bytes = (bytes + ALIGN - 1) / ALIGN * ALIGN;
    double *p = aligned_alloc(ALIGN, bytes);
    if (!p) {
        fprintf(stderr, "не удалось выделить %zu байт\n", bytes);
        exit(1);
    }
    return p;
}

static void fill_matrix(double *a, size_t n, size_t ld)
{
    for (size_t i = 0; i < n; i++)
        for (size_t j = 0; j < n; j++)
            a[i * ld + j] = (double)(i * n + j);
}

/* возвращает число неверных элементов */
static size_t check_transpose(const double *a, const double *b,
                              size_t n, size_t ld)
{
    size_t bad = 0;
    for (size_t i = 0; i < n; i++)
        for (size_t j = 0; j < n; j++)
            if (b[j * ld + i] != a[i * ld + j])
                bad++;
    return bad;
}

typedef void (*transpose_fn)(const double *a, double *b, size_t n, size_t ld);

/*
 * Запускает fn reps раз и печатает минимальное и среднее время.
 * Перед замером матрица b заполняется нулями (чтобы страницы были
 * уже выделены ОС и не влияли на время).
 */
static double bench(const char *name, transpose_fn fn,
                    const double *a, double *b, size_t n, size_t ld, int reps)
{
    double tmin = 1e30, tsum = 0;
    memset(b, 0, n * ld * sizeof(double));
    for (int r = 0; r < reps; r++) {
        double t0 = wtime();
        fn(a, b, n, ld);
        double t = wtime() - t0;
        if (t < tmin) tmin = t;
        tsum += t;
    }
    size_t bad = check_transpose(a, b, n, ld);
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

/* третий аргумент -- дополнение строки pad (ld = n + pad), по умолчанию 0 */
static size_t arg_ld(int argc, char **argv, size_t n)
{
    return n + (argc > 3 ? (size_t)strtoull(argv[3], NULL, 10) : 0);
}

#endif
