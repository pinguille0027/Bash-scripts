#!/bin/bash

clear
if [ -f "$1" ]; then
    echo "$1 es un fichero"
    ls -l "$1"
elif [ -d "$1" ]; then
    echo "$1 es un directorio"
    ls -ld "$1"
else
    echo "$1 no existe en este directorio"
fi
