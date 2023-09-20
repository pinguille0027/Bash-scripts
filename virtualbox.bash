#! /bin/bash
apt update
apt install -y curl

apt get -y --purge virtualbox-6.1
curl -o /tmp/virtualbox7.deb https://download.virtualbox.org/virtualbox/7.0.10/virtualbox-7.0_7.0.10-158379~Ubuntu~focal_amd64.deb
apt install -y /tmp/virtualbox.deb

vboxmanage extpack install https://download.virtualbox.org/virtualbox/7.0.10/Oracle_VM_VirtualBox_Extension_Pack-7.0.10.vbox-extpack