#!/bin/bash
# // config Data
clear
mkdir -p /root/folder

echo -e "${GREEN}Harap Bersabar Tuan${NC}"
wget -q -O /root/status "https://raw.githubusercontent.com/YINNSTORE/drg/main/statushariini"

wget -q -O /etc/version "https://raw.githubusercontent.com/YINNSTORE/drg/main/versiupdate" && chmod +x /etc/version

#wget -q -O /usr/bin/menu "myrid.digital/drg/menu/menu.sh"
wget -q -O /usr/bin/menu1 "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/menu1.sh"
wget -q -O /usr/bin/delv2ray "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/delv2ray.sh"
#wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/add-ws.sh"
#wget -q -O /usr/bin/add-ssws "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/add-ssws.sh"
#wget -q -O /usr/bin/add-socks "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/add-socks.sh"
#wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/add-vless.sh"
#wget -q -O /usr/bin/add-tr "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/add-tr.sh"
#wget -q -O /usr/bin/add-trgo "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/add-trgo.sh"
wget -q -O /usr/bin/autoreboot "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/autoreboot.sh"
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/restart.sh"
wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/YINNSTORE/drg/main/limit/tendang.sh"
wget -q -O /usr/bin/clearlog "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/clearlog.sh"
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/running.sh"
wget -q -O /usr/bin/cek-trafik "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/cek-trafik.sh"
wget -q -O /usr/bin/cek-speed "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/speedtes_cli.py"
wget -q -O /usr/bin/cek-bandwidth "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/cek-bandwidth.sh"
wget -q -O /usr/bin/cek-ram "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/ram.sh"
wget -q -O /usr/bin/limit-speed "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/limit-speed.sh"

#wget -q -O /usr/bin/menu-socks "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/menu-socks.sh"
wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/menu-ss.sh"
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/menu-vless.sh"
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/menu-vmess.sh"
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/menu-trojan.sh"
#wget -q -O /usr/bin/menu-trgo "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/menu-trgo.sh"
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/menu-ssh.sh"
#wget -q -O /usr/bin/menu-bckp "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/menu-bckp-telegram.sh"
wget -q -O /usr/bin/menu-bckp "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/menu-bckp-github.sh"
#wget -q -O /usr/bin/bckp "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/bckpbot.sh"
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/usernew.sh"
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/menu.sh"
wget -q -O /usr/bin/wbm "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/webmin.sh"
wget -q -O /usr/bin/changer "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/changer.sh"
#wget -q -O /usr/bin/xp "myrid.digital/drg/xp.sh"
wget -q -O /usr/bin/addhost  "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/addhost.sh"
wget -q -O /usr/bin/genssl  "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/genssl.sh"
wget -q -O /usr/bin/fix "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/cf.sh"
#wget -q -O /usr/bin/update "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/minacantik/update.sh"
wget -q -O /etc/cyber.site "https://raw.githubusercontent.com/YINNSTORE/drg/main/cyber.site"
wget -q -O /root/versi "https://raw.githubusercontent.com/YINNSTORE/drg/main/versiupdate"
wget -q -O /usr/bin/updatsc "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/update.sh"
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/menu-backup.sh"
wget -q -O /usr/bin/fix "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/cf.sh"
wget -q -O /usr/bin/setting "https://raw.githubusercontent.com/YINNSTORE/drg/main/Themes/setting.sh"
wget -q -O /usr/bin/menu-ipsec "https://raw.githubusercontent.com/YINNSTORE/drg/main/ipsec/menu-ipsec.sh"
wget https://raw.githubusercontent.com/YINNSTORE/drg/main/SLDNS/wslow.sh
wget https://raw.githubusercontent.com/YINNSTORE/drg/main/backup/set-br.sh
bash set-br.sh
wget https://raw.githubusercontent.com/YINNSTORE/drg/main/Themes/thema.sh
wget -q -O /usr/bin/trial "https://raw.githubusercontent.com/YINNSTORE/drg/main/trial/trial.sh"
wget -q -O /usr/bin/trial "https://raw.githubusercontent.com/YINNSTORE/main/drg/main/trial/trial.sh" && chmod +x /usr/bin/trial
wget -q -O /usr/bin/trial-vmess "https://raw.githubusercontent.com/YINNSTORE/drg/main/trial/trial-vmess.sh" && chmod +x /usr/bin/trial-vmess
wget -q -O /usr/bin/trial-trojan "https://raw.githubusercontent.com/YINNSTORE/drg/main/trial/trial-trojan.sh" && chmod +x /usr/bin/trial-trojan
wget -q -O /usr/bin/trial-udp "https://raw.githubusercontent.com/YINNSTORE/drg/main/trial/trial-udp.sh" && chmod +x /usr/bin/trial-udp
wget -q -O /usr/bin/trial-vless "https://raw.githubusercontent.com/YINNSTORE/drg/main/trial/trial-vless.sh" && chmod +x /usr/bin/trial-vless
wget -q -O /usr/bin/menu-trial "https://raw.githubusercontent.com/YINNSTORE/drg/main/trial/trial-generator.sh" && chmod +x /usr/bin/menu-trial
wget https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/3d.flf
mv 3d.flf /usr/share/figlet/

sudo apt-get install curl -y

curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash

sudo apt-get install speedtest
sudo apt-get install python3-pip -y
pip3 install speedtest-cli
sudo apt install wondershaper -y
cd bin
git clone https://github.com/magnific0/wondershaper.git
cd wondershaper
sudo make install

wget -q -O /usr/bin/addudp "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/addssh.sh"
wget -q -O /usr/bin/udp "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/menush.sh"

sudo apt install squid -y
mkdir /var/lib/ssnvpn-pro/
rm -f /usr/bin/menu-ssh
wget -q -O /var/lib/ssnvpn-pro/ipvps.conf "https://raw.githubusercontent.com/YINNSTORE/drg/main/ipvps.conf"
wget -q -O /usr/bin/autokill "https://raw.githubusercontent.com/YINNSTORE/drg/main/limit/autokill.sh"
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/menu-ssh.sh"
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/restart.sh"
chmod +x /usr/bin/restart
wget -q -O /usr/bin/bot "https://raw.githubusercontent.com/YINNSTORE/drg/main/Finaleuy/bot.sh"
wget -q -O /root/chat "https://raw.githubusercontent.com/YINNSTORE/drg/main/Finaleuy/chatid.sh"

wget -q -O /usr/bin/limitvmess "https://raw.githubusercontent.com/YINNSTORE/drg/main/limit/limitvmess.sh" && chmod +x /usr/bin/limitvmess

wget -q -O /usr/bin/limitvless "https://raw.githubusercontent.com/YINNSTORE/drg/main/limit/limitvless.sh" && chmod +x /usr/bin/limitvless

wget -q -O /usr/bin/limittrojan "https://raw.githubusercontent.com/YINNSTORE/drg/main/main/limit/limittrojan.sh" && chmod +x /usr/bin/limittrojan
wget -q -O /usr/bin/sistem "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/sistem.sh" && chmod +x /usr/bin/sistem
wget -q -O /etc/crontab "https://raw.githubusercontent.com/YINNSTORE/drg/main/crontab" && chmod 644 /etc/crontab

wget -q -O /usr/bin/cftn "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/cftn.sh" && chmod +x /usr/bin/cftn

wget -q -O /usr/bin/infosc "https://raw.githubusercontent.com/YINNSTORE/drg/main/limit/info.sh" && chmod +x /usr/bin/infosc
echo "*/2 * * * * root sistem" >> /etc/crontab

rm /etc/rsyslog.d/50-default.conf

wget https://raw.githubusercontent.com/YINNSTORE/drg/main/50-default.conf


cp 50-default.conf /etc/rsyslog.d/50-default.conf
service rsyslog restart

wget -q -O /etc/default/dropbear "https://raw.githubusercontent.com/YINNSTORE/drg/main/dropbear" && chmod +x /etc/default/dropbear


wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/xp.sh" && chmod +x /usr/bin/xp

#SERVICE xp
cat >/etc/systemd/system/xp.service << EOF
[Unit]
Description=My 
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/xp
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart xp
systemctl enable xp
systemctl restart xp


#service tendang


cat >/etc/systemd/system/tendang.service << EOF
[Unit]
Description=PT.cybervpn ltd.
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/tendang
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart tendang
systemctl enable tendang
systemctl restart tendang


wget -q -O /usr/bin/limitipxray "https://raw.githubusercontent.com/YINNSTORE/drg/main/limit/limitipxray.py" && chmod +x /usr/bin/limitipxray


cat >/etc/systemd/system/iplimit.service << EOF
[Unit]
Description=PT.cybervpn ltd.
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 /usr/bin/limitipxray
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart iplimit
systemctl enable iplimit
systemctl restart iplimit


wget -q -O /usr/bin/menu-noobzvpns "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/menu-noobzvpns.sh" && chmod +x /usr/bin/menu-noobzvpns

wget https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/noobzvpns.zip
unzip noobzvpns.zip
bash install.sh
rm noobzvpns.zip
systemctl restart noobzvpns




touch /etc/trialxray.txt


wget -q -O /usr/bin/service-trial "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/service-trial.sh" && chmod +x /usr/bin/service-trial


cat >/etc/systemd/system/trial.service << EOF
[Unit]
Description=PT.cybervpn ltd.
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/service-trial
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart trial
systemctl enable trial
systemctl restart trial



mkdir /tmp/vmess
mkdir /tmp/vless
mkdir /tmp/trojan

mkdir -p /etc/cybervpn/limit/vmess/ip/
mkdir -p /etc/cybervpn/limit/vless/ip/
mkdir -p /etc/cybervpn/limit/trojan/ip/
mkdir -p /etc/cybervpn/limit/ssh/ip/

chmod 777 /root/chat
chmod 777 /usr/bin/bot

chmod +x /usr/bin/tendang
chmod +x /usr/bin/autokill
chmod +x /usr/bin/menu-ssh

chmod 777 /usr/bin/addudp
chmod 777 /usr/bin/udp
chmod +x /usr/bin/menu
#chmod +x /usr/bin/add-ws
#chmod +x /usr/bin/add-ssws
#chmod +x /usr/bin/add-socks
#chmod +x /usr/bin/add-vless
#chmod +x /usr/bin/add-tr
#chmod +x /usr/bin/add-trgo
chmod +x /usr/bin/usernew
chmod +x /usr/bin/autoreboot
chmod +x /usr/bin/addhost
chmod +x /usr/bin/genssl
chmod +x /usr/bin/restart
chmod +x /usr/bin/tendang
chmod +x /usr/bin/clearlog
chmod +x /usr/bin/running
chmod +x /usr/bin/cek-trafik
chmod +x /usr/bin/cek-speed
chmod +x /usr/bin/cek-bandwidth
chmod +x /usr/bin/cek-ram
chmod +x /usr/bin/limit-speed
chmod +x /usr/bin/menu-vless
chmod +x /usr/bin/menu-vmess
chmod +x /usr/bin/delvray
chmod +x /usr/bin/menu-ss
chmod +x /usr/bin/updatsc
#chmod +x /usr/bin/menu-socks
chmod +x /usr/bin/menu-trojan
#chmod +x /usr/bin/menu-trgo
chmod +x /usr/bin/menu-ssh
chmod +x /usr/bin/menu-bckp
chmod +x /usr/bin/menu
chmod +x /usr/bin/menu1
chmod +x /usr/bin/menu-backup
chmod +x /usr/bin/wbm
chmod +x /usr/bin/xp
chmod +x /usr/bin/changer
chmod +x /usr/bin/fix
chmod +x /usr/bin/setting
chmod +x /usr/bin/menu-ipsec
chmod +x /usr/bin/trial
mkdir -p /etc/ssnvpn/theme/
touch /etc/ssnvpn/theme/color.conf
touch /root/limit/rulesxray.txt

#chmod +x /usr/bin/update
rm -rf set-br.sh
