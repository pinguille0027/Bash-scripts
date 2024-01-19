#!/bin/bash
if [ $# -ge 1 ] && [ -d "$1" ] && [ -r "$1" ]; then
    FILES=$(ls -a -1 "$1")
    i=0
    for FILE in $FILES; do
        if [ -f "$1/$FILE" ]; then
            i=$(($i + 1))
        fi
    done
    echo "hay un total de $i ficheros"
else
    echo "se debe pasar la ruta de un directorio como parametro. se deben tener permisos de lectura sobre el directorio"
fi
