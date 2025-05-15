    .text
    .globl compute_z

compute_z:

    leal (%edi, %edi, 4), %eax   # eax = edi + edi*4 = 5x

    # Сравниваем 5x с 7
    cmpl $7, %eax

    # Если 5x > 7, устанавливаем z = 32
    movl $32, %ecx               
    

    cmovbe %eax, %ecx            # ecx = (5x <= 7) ? 5x : 32
    
    movl %ecx, %eax

    ret