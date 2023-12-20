#!/bin/bash
IFS=$'\n'
LISTADO="listado_usuarios.txt"


# Creamos un snapshot por cada plantilla para poder facer clons enlazados só no caso que non exista previamente.
for USER in $( cat ${LISTADO});
do
echo "$USER"
NAME=$(echo "$USER" | cut -f 1 -d :)
echo $NAME
ALIAS=$(echo "$USER" | cut -f 2 -d :)
echo $ALIAS
PWD=$(echo "$USER" | cut -f 3 -d :)
SHELL=$(echo "$SHELL" | cut -f 4 -d :)
if ! cat /etc/passwd | grep "$NAME" >/dev/null; then
    useradd "$NAME" -c "$ALIAS" -s "$SHELL"
    echo "$PWD" >./pwdus
    echo "$PWD" >>./pwdus
    passwd "$NAME" <./pwdus
    rm ./pwdus
    else
    echo "ese usuario xa existe"
    userdel -rf "$NAME"
fi
done