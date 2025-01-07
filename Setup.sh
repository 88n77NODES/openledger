#!/bin/bash

echo "===================================================="
wget https://raw.githubusercontent.com/88n77/Logo-88n77/main/logo.sh
chmod +x logo.sh
./logo.sh

echo "Оновлюємо систему..."
sudo apt update && sudo apt upgrade -y

echo "Встановлюємо графічний інтерфейс Ubuntu..."
sudo apt install ubuntu-desktop -y
sudo apt update

echo "Запускаємо дисплейний менеджер..."
sudo systemctl start gdm

echo "Встановлюємо XRDP..."
sudo apt install xrdp -y
sudo adduser xrdp ssl-cert
sudo systemctl restart xrdp

echo "Встановлюємо Docker..."
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

echo "Завантажуємо та встановлюємо OpenLedger Node..."
wget https://cdn.openledger.xyz/openledger-node-1.0.0-linux.zip
unzip openledger-node-1.0.0-linux.zip
sudo dpkg -i openledger-node-1.0.0.deb
sudo apt update

echo "Запускаємо OpenLedger Node..."
openledger-node --no-sandbox

