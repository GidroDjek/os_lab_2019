    .text
    .globl compare_float

compare_float:

    movabs $0x4028000000000000, %rax  # 12.0 в IEEE 754
    movq %rax, %xmm1

    # Сравниваем x (xmm0) с 12.0 (xmm1)
    vcomisd %xmm1, %xmm0
    
    # флаги:
    # CF=1 если x < 12.0
    # ZF=1 если x == 12.0
    # PF=1 если unordered (NaN)
    
    # al = 1 если x <= 12.0 (CF=1 или ZF=1) и не NaN (PF=0)
    setbe %al            # Беззнаковое сравнение
    movzbl %al, %eax
    
    ret