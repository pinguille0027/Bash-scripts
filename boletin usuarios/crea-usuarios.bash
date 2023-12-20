#!/bin/bash
echo "introduzca nome de usuario"
read NOME
echo "introduzca contrasinal"
read PWD
if ! cat /etc/passwd | grep "$NOME" > /dev/null; then
    useradd "$NOME" -s /bin/bash
    echo "$PWD" >./pwdus
    echo "$PWD" >>./pwdus
    rm ./pwdus
    passwd "$NOME" <./pwdus
    cp -r ./copia-home /home/"$NOME"/
    for i in /home/"$NOME"/*; do
        chown "$NOME" "$i"
    done
    else
    echo "ese usuario xa existe"
fi
