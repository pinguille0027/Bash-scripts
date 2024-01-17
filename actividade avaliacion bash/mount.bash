#!/bin/bash
#este script existe para resetear e/ou preparar o escenario rápidamente o cambiar de máquina, podese ignorar na corrección se se desexa. con -d se elimina completamente o escenario
if [ -f variables.bash ]; then
    source variables.bash
    if [ ! -d ${MNTROOT} ]; then
        mkdir "$MNTROOT" 2>/dev/null
        if [ ! -d ${ROOTUS} ]; then
            mkdir "$ROOTUS" 2>/dev/null
        fi
        if [ ! -d ${ROOTMOD} ]; then
            mkdir "$ROOTMOD" 2>/dev/null
        fi
    elif [ "$1" = "-d" ]; then
        rm -r "$MNTROOT"
    else
        rm -r "$MNTROOT"
        mkdir "$MNTROOT" 2>/dev/null
        mkdir "$ROOTUS" 2>/dev/null
        mkdir "$ROOTMOD" 2>/dev/null
    fi
else
    echo "non se atopa o ficheiro de variables. Estás executando o script dende a propia carpeta?"
fi