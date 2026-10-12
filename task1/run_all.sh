#!/bin/sh
# run_all.sh -- сборка всех вариантов транспонирования и замеры времени.
# Результаты пишутся в task1/results.txt, ассемблер -- в task1/asm/.
#
# Запуск из любой папки:  sh task1/run_all.sh
# Перед запуском: подключить питание, закрыть тяжёлые приложения.

set -e
cd "$(dirname "$0")"
SRC=src
BIN=build
ASM=asm
OUT=results.txt
REPS=${REPS:-7}               # повторов внутри одного запуска
RUNS=${RUNS:-5}               # запусков программы на каждую конфигурацию

# если не принята лицензия Xcode, используем отдельные Command Line Tools
if ! clang --version >/dev/null 2>&1 &&
   [ -d /Library/Developer/CommandLineTools ]; then
    export DEVELOPER_DIR=/Library/Developer/CommandLineTools
fi
CC=${CC:-clang}

BEST="-O3 -mcpu=native"         # ключи для векторизованных версий (см. раздел 1)
BS_BEST=256                     # лучший размер блока (см. раздел 4)
TS_BEST=8                       # лучший микроблок полуавтоматической версии

# Запускает программу RUNS раз и для каждого варианта оставляет строку
# с наименьшим временем (время между запусками заметно плавает из-за
# разного физического размещения страниц памяти).
run() {
    k=0
    while [ $k -lt $RUNS ]; do "$@"; k=$((k + 1)); done | awk '
        / min / {
            name = substr($0, 1, 30)
            for (i = 1; i <= NF; i++) if ($i == "min") t = $(i + 1) + 0
            if (!(name in bt)) { names[++cnt] = name; bt[name] = 1e30 }
            if (t < bt[name]) { bt[name] = t; best[name] = $0 }
            next
        }
        !seen[$0]++ { print }
        END { for (i = 1; i <= cnt; i++) print best[names[i]] }'
}

mkdir -p $BIN $ASM
exec >$OUT 2>&1

echo "===== Система ====="
date "+%Y-%m-%d %H:%M"
sw_vers
sysctl -n machdep.cpu.brand_string
sysctl hw.ncpu hw.memsize hw.cachelinesize hw.pagesize \
       hw.perflevel0.physicalcpu hw.perflevel0.l1dcachesize hw.perflevel0.l2cachesize \
       hw.perflevel1.physicalcpu hw.perflevel1.l1dcachesize hw.perflevel1.l2cachesize
echo "AdvSIMD (NEON): $(sysctl -n hw.optional.neon 2>/dev/null || echo 0)," \
     "SVE: $(sysctl -n hw.optional.arm.FEAT_SVE 2>/dev/null || echo 0)," \
     "SME: $(sysctl -n hw.optional.arm.FEAT_SME 2>/dev/null || echo 0)"
pmset -g batt | head -1
$CC --version | head -2
echo "на каждую конфигурацию $RUNS запуска по $REPS повторов, min -- наименьшее время"
echo

echo "===== 1. Исходная программа, разные ключи компилятора ====="
for N in 8192 8000; do
    i=0
    for FL in "-O0" "-O1" "-O2" "-O3" "-O3 -mcpu=native" "-O3 -mcpu=apple-m4" \
              "-O3 -ffast-math -mcpu=native -funroll-loops"; do
        i=$((i + 1))
        $CC $FL $SRC/transpose_naive.c -o $BIN/naive_$i
        printf "[%s] " "$FL"
        run $BIN/naive_$i $N $REPS | tail -1
    done
done
echo

echo "===== 2. Полуавтоматическая векторизация ($BEST -fopenmp-simd, BS=$BS_BEST, TS=$TS_BEST) ====="
$CC $BEST -fopenmp-simd -DBS=$BS_BEST -DTS=$TS_BEST \
    $SRC/transpose_simd.c -o $BIN/simd
for ARGS in "8192 $REPS 0" "8192 $REPS 8" "8000 $REPS 0"; do
    set -- $ARGS
    echo "--- N=$1, pad=$3"
    run $BIN/simd $ARGS
done
echo

echo "===== 3. Ручная векторизация NEON ($BEST, BS=$BS_BEST) ====="
$CC $BEST -DBS=$BS_BEST $SRC/transpose_neon.c -o $BIN/neon
for ARGS in "8192 $REPS 0" "8192 $REPS 8" "8000 $REPS 0"; do
    set -- $ARGS
    echo "--- N=$1, pad=$3"
    run $BIN/neon $ARGS
done
echo

echo "===== 3a. Векторизация на SME (-O3 -mcpu=apple-m4, BS=$BS_BEST) ====="
$CC -O3 -mcpu=apple-m4 -DBS=$BS_BEST $SRC/transpose_sme.c -o $BIN/sme
for ARGS in "8192 $REPS 0" "8192 $REPS 8" "8000 $REPS 0"; do
    set -- $ARGS
    echo "--- N=$1, pad=$3"
    run $BIN/sme $ARGS
done
echo

echo "===== 3b. Исходная программа с дополнением строк (pad=8) ====="
run $BIN/naive_5 8192 $REPS 8 | tail -1    # naive_5 = -O3 -mcpu=native
echo

echo "===== 4. Подбор размера блока BS (N=8192, pad=8) ====="
for BS in 16 32 64 128 256; do
    $CC $BEST -fopenmp-simd -DBS=$BS -DTS=$TS_BEST \
        $SRC/transpose_simd.c -o $BIN/simd_bs
    $CC $BEST -DBS=$BS $SRC/transpose_neon.c -o $BIN/neon_bs
    printf "BS=%-4s " $BS; run $BIN/simd_bs 8192 $REPS 8 | grep tiled
    printf "BS=%-4s " $BS; run $BIN/neon_bs 8192 $REPS 8 | grep neon8
    $CC -O3 -mcpu=apple-m4 -DBS=$BS $SRC/transpose_sme.c -o $BIN/sme_bs
    printf "BS=%-4s " $BS; run $BIN/sme_bs 8192 $REPS 8 | grep sme8
done
echo

echo "===== 5. Подбор микроблока TS полуавтоматической версии (N=8192, pad=8, BS=$BS_BEST) ====="
for TS in 2 4 8; do
    $CC $BEST -fopenmp-simd -DBS=$BS_BEST -DTS=$TS \
        $SRC/transpose_simd.c -o $BIN/simd_ts
    printf "TS=%-2s " $TS; run $BIN/simd_ts 8192 $REPS 8 | grep tiled
done
echo

echo "===== 6. Отчёт векторизатора clang ====="
for F in naive simd; do
    echo "--- transpose_$F.c"
    $CC $BEST -fopenmp-simd -DBS=$BS_BEST -DTS=$TS_BEST -c $SRC/transpose_$F.c \
        -o /dev/null -Rpass='loop-vectorize|slp-vectorizer' \
        -Rpass-missed=loop-vectorize -Rpass-analysis=loop-vectorize 2>&1 |
        grep "transpose_$F.c:.*remark" | sed 's/^.*src\///' || true
done

# ассемблер для отчёта
$CC $BEST -S $SRC/transpose_naive.c -o $ASM/transpose_naive.s
$CC $BEST -fopenmp-simd -DBS=$BS_BEST -DTS=$TS_BEST -S $SRC/transpose_simd.c \
    -o $ASM/transpose_simd.s
$CC $BEST -DBS=$BS_BEST -S $SRC/transpose_neon.c -o $ASM/transpose_neon.s
$CC -O3 -mcpu=apple-m4 -DBS=$BS_BEST -S $SRC/transpose_sme.c -o $ASM/transpose_sme.s
