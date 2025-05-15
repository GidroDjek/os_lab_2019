.section .text
.global mce_sd
.type mce_sd, @function
mce_sd:
    # Вход:
    #   rdi = void* p (указатель на массив)
    #   rsi = size_t N (количество элементов)
    # Выход:
    #   xmm0 = произведение элементов

    # Проверка на NULL или N=0
    testq   %rdi, %rdi
    jz      .Lerror
    testq   %rsi, %rsi
    jz      .Lerror

    # Инициализация
    movq    %rdi, %rcx        # rcx = указатель на массив
    movq    %rsi, %rdx        # rdx = счетчик элементов
    movsd   .Lone(%rip), %xmm0 # xmm0 = 1.0 (начальное значение)

.Lloop:
    # Загрузка элемента массива
    movsd   (%rcx), %xmm1
    # Умножение на текущее произведение
    mulsd   %xmm1, %xmm0
    # Переход к следующему элементу
    addq    $8, %rcx
    # Уменьшение счетчика
    decq    %rdx
    jnz     .Lloop

    # Возврат результата
    ret

.Lerror:
    # Возвращаем 0.0 в случае ошибки
    pxor    %xmm0, %xmm0
    ret

.section .rodata
.align 8
.Lone: .double 1.0