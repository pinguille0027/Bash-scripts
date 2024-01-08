#!/bin/bash
useradd -m paco -c "Paco Martinez Soria" -s /bin/bash
passwd paco < ./pwd
cp -r ./copia-home /home/paco/
for i in /home/paco/*; do
    chown paco:paco "$i"
done
