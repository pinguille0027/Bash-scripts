#!/bin/bash
if ! ls /home | grep "$1" >/dev/null; then
    useradd "$1" -s /bin/bash
    echo "$2" >./pwdus
    echo "$2" >>./pwdus
    passwd "$1" <./pwdus
    rm ./pwdus
    cp -r ./copia-home /home/"$1"/
    for i in /home/"$1"/*; do
        chown "$1" "$i"
    done
    else
    echo "ese usuario xa existe"
fi
