#!/bin/bash
if [ $# -eq 2 ]; then
    if ! cat /etc/passwd | cut -f 1 -d : | grep "$1" >/dev/null; then
        useradd -m "$1" -s /bin/bash
        echo "$2" >./pwdus
        echo "$2" >>./pwdus
        passwd "$1" <./pwdus
        rm ./pwdus
        cp -r ./copia-home /home/"$1"/
        for i in /home/"$1"/*; do
            chown "$1":"$1" "$i"
        done
    else
        echo "ese usuario xa existe"
    fi
else
    echo "debe introducir 2 parámetros, el primero usuario y el segundo contraseña"
fi
