#!/bin/bash
echo "introduce termino"
read INPUT
clear
if [ -f $INPUT ]; then
cat "$INPUT"
else
echo "no existe el fichero"
fi