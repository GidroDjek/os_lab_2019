    .text
    .globl compare_x

compare_x:

    # x сompare 12
    cmpl $12, %edi
    
    setbe %al         # al = 1, если x <= 12 (беззнаковое)
    
    movzbl %al, %eax  # eax = 0 или 1
    
    ret