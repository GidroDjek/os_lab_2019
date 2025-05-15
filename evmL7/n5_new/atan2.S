.section .rodata
.align 8
.LC0: .string "Введите x: "
.LC1: .string "%lf"
.LC2: .string "Введите y: "
.LC3: .string "z = atan2(x, y) = %.10f радиан\n"
.LC4: .string "z в градусах = %.10f°\n"
.LC5: .double 180.0
.LC6: .double 3.14159265358979323846  # M_PI

.section .text
.global main
.type main, @function
main:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $32, %rsp

    # Ввод x
    leaq    .LC0(%rip), %rdi
    call    printf@PLT
    leaq    -8(%rbp), %rsi
    leaq    .LC1(%rip), %rdi
    call    scanf@PLT

    # Ввод y
    leaq    .LC2(%rip), %rdi
    call    printf@PLT
    leaq    -16(%rbp), %rsi
    leaq    .LC1(%rip), %rdi
    call    scanf@PLT

    # Вызов atan2(x, y)
    movsd   -8(%rbp), %xmm0
    movsd   -16(%rbp), %xmm1
    call    atan2@PLT

    # Сохраняем результат atan2 в стеке
    movsd   %xmm0, -24(%rbp)

    # Вывод результата (в радианах)
    movsd   -24(%rbp), %xmm0
    leaq    .LC3(%rip), %rdi
    movl    $1, %eax
    call    printf@PLT

    # Преобразование в градусы (z * 180.0 / M_PI)
    movsd   -24(%rbp), %xmm0    # Восстанавливаем значение
    movsd   .LC5(%rip), %xmm1   # 180.0
    mulsd   %xmm1, %xmm0
    movsd   .LC6(%rip), %xmm1   # M_PI
    divsd   %xmm1, %xmm0

    # Вывод результата (в градусах)
    leaq    .LC4(%rip), %rdi
    movl    $1, %eax
    call    printf@PLT

    # Завершение программы
    xorl    %eax, %eax
    leave
    ret