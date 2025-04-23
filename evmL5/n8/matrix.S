    .text
    .globl modify_secondary_diagonal

# Сигнатура: void modify_secondary_diagonal(int* matrix, size_t N)
# System V AMD64 ABI:
#   matrix -> %rdi (указатель на матрицу)
#   N -> %rsi (размер матрицы)

modify_secondary_diagonal:
    testq   %rsi, %rsi
    je      .Lend
    
    movq    %rsi, %rcx       # rcx = N (счетчик строк)
    leaq    -1(%rsi), %rdx   # rdx = N-1 (начальный столбец)
    movl    $-1, %eax        # Значение для записи

.Lloop:
    # Рассчитываем адрес: matrix + i*N + (N-1-i)
    # где i = (N - rcx), j = rdx
    movq    %rsi, %r8
    subq    %rcx, %r8        # r8 = i = (N - rcx)
    
    imulq   %rsi, %r8        # r8 = i*N
    addq    %rdx, %r8        # r8 = i*N + j
    
    movl    %eax, (%rdi,%r8,4) # matrix[i][j] = -1
    
    decq    %rdx             # Уменьшаем столбец
    loop    .Lloop           # Уменьшаем строку

.Lend:
    ret