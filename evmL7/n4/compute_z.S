# Функция compute_z_avx: вычисляет z = 1 - 5/x - y²/7
# Сигнатура: double compute_z_avx(double x, double y)
# Использует AVX (или SSE2, если AVX недоступен)

.global compute_z_avx
compute_z_avx:
    # Вход:
    #   xmm0 = x (double)
    #   xmm1 = y (double)
    # Выход:
    #   xmm0 = z (результат)

    # Константы:
    movsd   .LC0(%rip), %xmm2    # xmm2 = 1.0
    movsd   .LC1(%rip), %xmm3    # xmm3 = 5.0
    movsd   .LC2(%rip), %xmm4    # xmm4 = 7.0

    # Вычисление 5/x:
    divsd   %xmm0, %xmm3         # xmm3 = 5 / x

    # Вычисление y²/7:
    mulsd   %xmm1, %xmm1        # xmm1 = y²
    divsd   %xmm4, %xmm1        # xmm1 = y² / 7

    # Вычисление 1 - (5/x) - (y²/7):
    subsd   %xmm3, %xmm2        # xmm2 = 1 - (5/x)
    subsd   %xmm1, %xmm2        # xmm2 = (1 - 5/x) - y²/7

    # Возврат результата:
    movapd  %xmm2, %xmm0        # xmm0 = z
    ret

# Константы в секции .rodata:
.section .rodata
.LC0: .double 1.0
.LC1: .double 5.0
.LC2: .double 7.0