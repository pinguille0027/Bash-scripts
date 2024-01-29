#!/bin/bash
if [ $# -eq 1 ]; then
    if ps -o "%p:%c" | cut -f 2 -d : | grep $1 >/dev/null; then
        IDP=$(ps -e -o "%p:%c" | grep $1 | cut -f 1 -d :)
        kill -9 $IDP >/dev/null
        echo "fulminando el proceso $1 con PID $IDP"
    else
        echo "no se está ejecutando ningun proceso con ese comando"
    fi
else
    echo "se necesita un unico parametro"
fi
