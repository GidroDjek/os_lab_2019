.global f2

f2:
    // x в %xmm0, y в %xmm1 (System V AMD64)
    subsd %xmm1, %xmm0  // xmm0 = x - y
    ret