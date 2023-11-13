#!/bin/bash
#0-actualizamos
sudo apt update
#1-añadimos grupos
echo -e "\e[33m 1-añadimos grupos \e[0m"
sudo addgroup alumnos
sudo addgroup profesores
#2-configurar grupo por defecto
echo -e "\e[33m 2-configurar grupo por defecto \e[0m"
sudo echo "GROUP=users" >> /etc/default/useradd
#3-creando carpetas predefinidas
echo -e "\e[33m 3-creando carpetas predefinidas \e[0m"
mkdir /etc/skel/modulos /etc/skel/contactos
#4-añadimos usuarios en sus grupos
echo -e "\e[33m 4-añadimos usuarios en sus grupos \e[0m"
sudo adduser alan --group alumnos
sudo adduser bea --group alumnos
sudo adduser carla --group profesores
sudo adduser daniel --group profesores
#5-añadimos bea a sudo
echo -e "\e[33m 5-añadimos bea a sudo \e[0m"
sudo gpasswd -a bea sudo
#6-bloqueamos y desbloqueamos a alan
echo -e "\e[33m 6-bloqueamos y desbloqueamos a alan \e[0m"
sudo usermod -L -e 1 alan
sudo usermod -U -e 30 alan
#7-politica de contraseña de daniel
echo -e "\e[33m 7-politica de contraseña de daniel \e[0m"
sudo chage -m 4 -M 60 -W 5 daniel
#8-configuración global de contraseñas
echo -e "\e[33m 8-configuración global de contraseñas \e[0m"
echo -e "\e[32m modificando login.defs \e[0m"
sudo cat configlogin.txt > /etc/login.defs
sudo apt install libpam-cracklib -y
echo -e "\e[32m modificando pam.d/common-password \e[0m"
sudo cat configpamd.txt > /etc/pam.d/common-password
#9-prueba de mala contraseña
echo -e "\e[33m 9-prueba de mala contraseña \e[0m"
sudo adduser badpasswd
sudo passwd badpasswd || echo -e "\e[31m No se creó el usuario con esa contraseña \e[0m"