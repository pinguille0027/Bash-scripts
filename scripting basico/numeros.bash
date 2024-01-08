#!/bin/bash
MESES=(enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre)
if [ $1 -lt 13 ] && [ $1 -gt 0 ]; then
    echo "${MESES[$1 - 1]}"
else
    echo "el parametro debe ser un numero entre 1 y 12"
fi
