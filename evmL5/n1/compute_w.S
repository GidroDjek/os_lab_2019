    .text
    .globl compute_w

compute_w:
    # Сигнатура: int compute_w(int x, int y)
    # System V ABI:
    #   x -> %edi (младшие 32 бита %rdi)
    #   y -> %esi (младшие 32 бита %rsi)
    #   возвращаемое значение -> %eax

    # 1. Вычисляем z = x + y (в 32-битном режиме)
    add %esi, %edi  # edi = edi + esi (результат в edi, флаги обновляются)

    # 2. Устанавливаем w = (z == 0) ? 1 : 0
    sete %al        # al = 1, если ZF=1 (z == 0)
    movzbl %al, %eax # Расширяем al до eax (32 бита)

    # 3. Возвращаем eax (w = 0 или 1)
    ret