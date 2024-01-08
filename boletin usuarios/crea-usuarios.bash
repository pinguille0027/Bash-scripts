#!/bin/bash
echo "introduzca nome de usuario"
read NOME
echo "introduzca contrasinal"
read PWD
if ! cat /etc/passwd | grep "$NOME" > /dev/null; then
    useradd -m "$NOME" -s /bin/bash
    echo -e "$PWD\n$PWD" | passwd "$NOME"
    cp -r ./copia-home /home/"$NOME"/
    for i in /home/"$NOME"/*; do
        chown "$NOME":"$NOME" "$i"
    done
    else
    echo "ese usuario xa existe"
fi
