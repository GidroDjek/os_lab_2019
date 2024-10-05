#!/bin/bash

mid=0
sr=0

for num in "$@"; do
    mid=$(($mid+$num))
done

sr=$(($mid/$#))

echo "Количество чисел: $#"
echo "Среднее арифметическое: $sr"