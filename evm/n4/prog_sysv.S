.section .rodata
input_fmt:  .string "%hd %d %lld %f %lf"
output_fmt: .string "i16=%hd, i32=%d, i64=%lld, f32=%.2f, f64=%.2lf\n"
prompt:     .string "Введите i16, i32, i64, f32, f64: "

.section .text
.global main

main:
    push %rbp
    mov %rsp, %rbp
    sub $32, %rsp      # Выделяем место под переменные

    # Адреса переменных относительно rbp:
    # i16: rbp-2
    # i32: rbp-8
    # i64: rbp-16
    # f32: rbp-20
    # f64: rbp-32

    # Вывод приглашения
    lea prompt(%rip), %rdi
    call puts

    # Вызов scanf
    lea input_fmt(%rip), %rdi
    lea -2(%rbp), %rsi    # &i16
    lea -8(%rbp), %rdx    # &i32
    lea -16(%rbp), %rcx   # &i64
    lea -20(%rbp), %r8    # &f32
    lea -32(%rbp), %r9     # &f64
    xor %eax, %eax
    call scanf

    # Вызов printf
    lea output_fmt(%rip), %rdi
    mov -2(%rbp), %si      # i16
    mov -8(%rbp), %edx     # i32
    mov -16(%rbp), %rcx    # i64
    movss -20(%rbp), %xmm0 # f32
    cvtss2sd %xmm0, %xmm0  # float->double
    movsd -32(%rbp), %xmm1  # f64
    mov $2, %eax           # 2 FP args
    call printf

    # Эпилог
    mov %rbp, %rsp
    pop %rbp
    xor %eax, %eax
    ret