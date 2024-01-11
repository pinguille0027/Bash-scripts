#!/bin/bash
IFS=$'\n'
LISTADO="listado_usuarios.txt"

for USER in $(cat ${LISTADO}); do
    echo "$USER"
    NAME=$(echo "$USER" | cut -f 1 -d :)
    echo "$NAME"
    ALIAS=$(echo "$USER" | cut -f 2 -d :)
    echo "$ALIAS"
    PWD=$(echo "$USER" | cut -f 3 -d :)
    SHELL=$(echo "$SHELL" | cut -f 4 -d :)
    if ! cat /etc/passwd | cut -f 1 -d : | grep "$NAME" >/dev/null; then
        useradd -m "$NAME" -c "$ALIAS" -s "$SHELL"
        echo -e "$PWD\n$PWD" | passwd "$NAME"
    else
        echo "ese usuario xa existe"
        #el userdel está para ir testeando, que pueda correr varias veces el script mientras trabajo sin molestarme por tener que ponerme a borrar usuarios.
        #userdel -rf "$NAME"
    fi
done
