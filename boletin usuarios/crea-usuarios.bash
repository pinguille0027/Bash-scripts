#!/bin/bash
echo "introduzca nome de usuario"
read NOME
echo "introduzca contrasinal"
read PWD
if [ -n "$PWD" ]; then
    if ! cat /etc/passwd | cut -f 1 -d : | grep "$NOME" >/dev/null; then
        useradd -m "$NOME" -s /bin/bash
        echo -e "$PWD\n$PWD" | passwd "$NOME"
        cp -r ./copia-home /home/"$NOME"/
        for i in /home/"$NOME"/*; do
            chown "$NOME":"$NOME" "$i"
        done
    else
        echo "ese usuario xa existe"
    fi
else
    echo "o contrasinal non pode estar vacío"
fi
