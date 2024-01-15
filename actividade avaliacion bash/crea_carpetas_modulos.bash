#!/bin/bash
if [ -f variables.bash ]; then
    source variables.bash
    if [ -f "$LISTADO_GRUPOS" ]; then
        if [ -d "$ROOTMOD" ]; then
            #añado esta comprobación porque es, de los fallos probables (que ya exista el directorio o que los padres no existan)
            #es el fallo que va a hacer que no se creen las carpetas.

            for i in $(cat ${LISTADO_GRUPOS}); do
                mkdir "${ROOTMOD}/${i}" 2>/dev/null
                if [ -f ${i}.txt ]; then
                    for j in $(cat ${i}.txt); do
                        mkdir "${ROOTMOD}/${i}/${j}" 2>/dev/null
                    done
                else
                    echo "non existe o listado de carpetas para ${i} no directorio actual"
                fi
            done
        else
            echo "para que o script funcione debe existir o directorio de recursos
        -Para montalo automáticamente pode chamar a mount.bash
        -O directorio de recursos por defecto se monta en /mnt/DATOSXILGARO/recursos, pode cambiarse editando variables.bash"
        fi
    else
        echo "non se atopa o listado de grupos no directorio actual, pode redefinir o nome ou ruta en variables.bash"
    fi
else
    echo "non se atopa o ficheiro de variables. Estás executando o script dende a propia carpeta?"
fi
