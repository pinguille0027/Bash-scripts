#! /bin/bash
sudo apt update
sudo apt install -y git
sudo apt install -y curl
sudo curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o install_nvm.sh
bash install_nvm.sh
gnome-terminal -- bash -ic "nvm install --lts"
gnome-terminal -- bash -ic "node"
echo "fin"