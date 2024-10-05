#!/bin/bash

file="numbers.txt"

for i in {1..150}; do
    num=$(($RANDOM%100+1))
    echo $num>>"$file"
done 
