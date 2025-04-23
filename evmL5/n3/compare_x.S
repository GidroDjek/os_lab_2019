    .text
    .globl compare_x

compare_x:
    # Сигнатура: unsigned int compare_x(unsigned int x)
    # System V AMD64 ABI:
    #   x -> %edi (32-битный беззнаковый аргумент)
    #   возвращаемое значение -> %eax (32 бита)

    # Сравниваем x с 12 (беззнаковое сравнение)
    cmpl $12, %edi
    
    # Устанавливаем z = 1, если x <= 12 (для беззнаковых JBE)
    setle %al    # LE (Less or Equal) для знаковых чисел
    
    # Расширяем результат до 32 бит
    movzbl %al, %eax
    
    ret