    .text
    .globl compute_z

compute_z:
    # Сигнатура: unsigned int compute_z(unsigned int x)
    # System V AMD64 ABI:
    #   x -> %edi (32-битное беззнаковое)
    #   возвращаемое значение -> %eax (32 бита)

    # Вычисляем 5x
    leal (%edi, %edi, 4), %eax   # eax = edi + edi*4 = 5x

    # Сравниваем 5x с 7
    cmpl $7, %eax

    # Если 5x > 7, устанавливаем z = 32
    movl $32, %ecx               # ecx = 32 (значение для случая 5x > 7)
    
    # Условное перемещение: если 5x <= 7 (CF=1 или ZF=1), то оставляем eax (5x)
    cmovbe %eax, %ecx            # ecx = (5x <= 7) ? 5x : 32
    
    # Переносим результат в eax
    movl %ecx, %eax

    ret