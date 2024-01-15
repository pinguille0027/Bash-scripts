#!/bin/bash
if [ -f variables.bash ]; then
    source variables.bash
    if [ -f "$LISTADO_USUARIOS" ] && [ -f "$LISTADO_GRUPOS" ]; then
        if [ -d "$ROOTUS" ]; then
            #añado esta comprobación porque es, de los fallos probables (que ya exista el directorio o que los padres no existan)
            #es el fallo que va a hacer que no se creen las carpetas.
            for i in $(cat ${LISTADO_GRUPOS}); do
                mkdir "${ROOTUS}/${i}" 2>/dev/null
            done
            for USER in $(cat ${LISTADO_USUARIOS}); do
                NAME=$(echo "$USER" | cut -f 1 -d :)
                GDIR=$(echo "$USER" | cut -f 2 -d :)
                mkdir "${ROOTUS}/${GDIR}/${NAME}" 2>/dev/null
            done
        else
            echo "para que o script funcione debe existir o directorio de usuarios
        -Para montalo automáticamente pode chamar a mount.bash
        -O directorio de usuarios por defecto se monta en /mnt/DATOSXILGARO/usuarios, pode cambiarse editando variables.bash"
        fi
    else
        echo "non se atopa o listado de usuarios ou o listado de grupos no directorio actual, pode redefinir o nome ou ruta en variables.bash"
    fi
else
    echo "non se atopa o ficheiro de variables. Estás executando o script dende a propia carpeta?"
fi
