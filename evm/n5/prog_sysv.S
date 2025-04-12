.intel_syntax noprefix
.section .rodata
input_fmt:  .string "%hd %d %lld %f %lf"
output_fmt: .string "i16=%hd, i32=%d, i64=%lld, f32=%.2f, f64=%.2lf\n"
prompt:     .string "Введите i16, i32, i64, f32, f64: "

.section .text
.global main

main:
    push rbp
    mov rbp, rsp
    sub rsp, 48      # Место под переменные + выравнивание

    # Адреса переменных относительно RBP:
    # i16: [rbp-2]
    # i32: [rbp-8]
    # i64: [rbp-16]
    # f32: [rbp-20]
    # f64: [rbp-28]

    # Вывод приглашения
    lea rdi, [rip+prompt]
    call puts

    # Вызов scanf
    lea rdi, [rip+input_fmt]
    lea rsi, [rbp-2]    # &i16
    lea rdx, [rbp-8]     # &i32
    lea rcx, [rbp-16]    # &i64
    lea r8, [rbp-20]     # &f32
    lea r9, [rbp-28]     # &f64
    xor eax, eax
    call scanf

    # Вызов printf
    lea rdi, [rip+output_fmt]
    mov si, [rbp-2]      # i16
    mov edx, [rbp-8]     # i32
    mov rcx, [rbp-16]    # i64
    movss xmm0, [rbp-20] # f32
    cvtss2sd xmm0, xmm0
    movsd xmm1, [rbp-28] # f64
    mov eax, 2
    call printf

    # Эпилог
    mov rsp, rbp
    pop rbp
    xor eax, eax
    ret