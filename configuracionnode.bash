#! /bin/bash
sudo apt update
sudo apt install -y git
sudo apt install -y curl
sudo curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o install_nvm.sh
sudo nvm install --lts