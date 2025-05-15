    .text
    .globl compare_x

compare_x:

    # Сравниваем x с 12
    cmpl $12, %edi

    setle %al    # LE (Less or Equal) для знаковых чисел
    
    movzbl %al, %eax
    
    ret