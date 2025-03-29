.section .rodata
group:      .string "ПИН-35"
number:     .string "9"
member1:    .string "Котькин Кирилл Васильевич"
member2:    .string "Голубовский Данила"

.section .text
.global main

main:
    push %rbp
    mov %rsp, %rbp
    
    # Выводим группу
    lea group(%rip), %rdi
    call puts
    
    # Выводим номер
    lea number(%rip), %rdi
    call puts
    
    # Выводим первого участника
    lea member1(%rip), %rdi
    call puts
    
    # Выводим второго участника
    lea member2(%rip), %rdi
    call puts
    
    # Возвращаем 0
    xor %eax, %eax
    leave
    ret