#!/bin/bash

clear
for i in *
do
if [ -f "$i" ]; then
    echo "$i es un fichero"
    ls -l "$i"
elif [ -d "$i" ]; then
    echo "$i es un directorio"
    ls -ld "$i"
else
    echo "$i no existe en este directorio"
fi
done