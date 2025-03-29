.global f1

f1:
    // f1(x, y) = -7 + x + 8*y
    // x в %edi, y в %esi (соглашение System V AMD64)
    lea -7(%rdi, %rsi, 8), %eax  // eax = -7 + x + 8*y
    ret