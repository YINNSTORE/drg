#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
install unzip -y
# Getting
clear
IP=$(curl -sS ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
date=$(date +"%d-%b-%Y-%T")

clear
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/xray backup/xray
cp -r /var/www/html/ backup/html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1

source /media/cybervpn/var.txt && echo $BOT_TOKEN > .bot
azi=$(cat .bot)
source /media/cybervpn/var.txt && echo $ADMIN > .id
aji=$(cat .id)
curl -X POST https://api.telegram.org/bot$azi/sendDocument \
     -F "chat_id=$aji" \
     -F "document=@/root/$IP-$date.zip" \
     -F "caption=file backup mu" &> /dev/null

rm .bot
rm .id
rm -rf /root/backup
rm -r /root/$IP-$date.zip
