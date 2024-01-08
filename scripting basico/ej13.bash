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
for i in *
do
if [ -f "$i" ]; then
    echo "$i es un fichero"
    permisos "$i"
elif [ -d "$i" ]; then
    echo "$i es un directorio"
    permisos "$i"
else
    echo "$i no existe en este directorio"
fi
done