    .text
    .globl generate_sequence


generate_sequence:
    testl   %esi, %esi       # Проверяем N == 0
    je      .Lend            # Если N == 0, завершаем

    movl    $2, %edx         # Начальное значение: 2 (k=0)
    xorl    %ecx, %ecx       # Счетчик i = 0

.Lloop:
    movl    %edx, (%rdi,%rcx,4)  # array[i] = текущее значение
    addl    $3, %edx             # Следующее значение: +3
    incl    %ecx                 # i++
    cmpl    %esi, %ecx           # Сравниваем i с N
    jne     .Lloop               # Продолжаем если i < N

.Lend:
    ret