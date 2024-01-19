#!/bin/bash
if [ $# -eq 1 ] && [ $1 -le 10 ] && [ $1 -ge 1 ]; then
    i=$1
else
    i=1
fi
echo $i
while [ $i -le 10 ]; do
    echo "tabla de multiplicación de $i"
    j=1
    while [ $j -le 10 ]; do
        echo "$i x $j = $(($i * $j))"
        j=$(($j + 1))
    done
    i=$(($i + 1))
done
