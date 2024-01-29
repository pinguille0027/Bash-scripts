#!/bin/bash
apt update
apt install apt-transport-https ca-certificates gnupg curl git
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
apt update && apt install google-cloud-cli kubectl google-cloud-sdk-gke-gcloud-auth-plugin
curl -sS https://webinstall.dev/k9s | bashsource ~/.config/envman/PATH.env