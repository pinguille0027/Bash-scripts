#!/bin/bash
function permisos {
    LECTURA=""
    ESCRITURA=""
    EJECUCION=""
    if [ -r "$1" ] ; then
        LECTURA="- Lectura"
    fi
    if [ -w "$1" ] ; then
        ESCRITURA="- Escritura"
    fi
    if [ -x "$1" ] ; then
        EJECUCION="- Ejecución"
    fi
    echo "$1 tiene permisos de:
    ${LECTURA} 
    ${ESCRITURA} 
    ${EJECUCION}"
}
clear
if [ -f "$1" ]; then
    echo "$1 es un fichero"
    permisos "$1"
elif [ -d "$1" ]; then
    echo "$1 es un directorio"
    permisos "$1"
else
    echo "$1 no existe en este directorio"
fi
