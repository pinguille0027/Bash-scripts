#!/bin/bash
if [ $# -ge 1 ]; then
    for GRUPO in "$@"; do
        if getent group | cut -f 1 -d : | grep "$GRUPO" >/dev/null; then
            FILA=$(getent group | cut -f 1 -d : | grep -n "$GRUPO" | cut -f 1 -d :)
            IDG=$(getent group | cut -f 3 -d : | head -"$FILA" | tail -1)
            echo "el grupo con nombre $GRUPO y GID $IDG existe"
        else
            echo "el grupo con nombre $GRUPO no existe"
        fi
    done
else
    echo "se necesita al menos un parametro"
fi
