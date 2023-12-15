#!/bin/bash

clear
if [ -f $1 ]; then
cat "$1"
else
echo "no existe el fichero"
fi