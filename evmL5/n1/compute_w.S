    .text
    .globl compute_w

compute_w:

    # z = x + y 
    add %esi, %edi  # edi = edi + esi

    # w = (z == 0) ? 1 : 0
    sete %al        # al = 1, если ZF=1 (z == 0)
    movzbl %al, %eax # Расширение al до eax 

    ret