    .text
    .globl compare_float

compare_float:
    # Сигнатура: int compare_float(double x)
    # System V AMD64 ABI:
    #   x -> %xmm0 (64-битное число с плавающей запятой)
    #   возвращаемое значение -> %eax (32 бита)

    # Загружаем константу 12.0 в %xmm1
    movabs $0x4028000000000000, %rax  # 12.0 в IEEE 754
    movq %rax, %xmm1

    # Сравниваем x (xmm0) с 12.0 (xmm1)
    vcomisd %xmm1, %xmm0  # xmm0 сравнивается с xmm1
    
    # Устанавливаем флаги:
    # CF=1 если x < 12.0
    # ZF=1 если x == 12.0
    # PF=1 если unordered (NaN)
    
    # Устанавливаем результат:
    # al = 1 если x <= 12.0 (CF=1 или ZF=1) и не NaN (PF=0)
    setbe %al            # Беззнаковое сравнение (для упорядоченных чисел)
    movzbl %al, %eax     # Расширяем до 32 бит
    
    ret