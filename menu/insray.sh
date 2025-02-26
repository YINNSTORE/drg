#!/bin/bash
# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"
mkdir /user/curent > /dev/null 2>&1
touch /user/current
clear
echo "IP=$domain" > /var/lib/scrz-prem/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi

echo -e "[ ${GREEN}INFO${NC} ] Checking... "
sleep 1
echo -e "[ ${GREEN}INFO$NC ] Setting ntpdate"
sleep 1
domain=$(cat /etc/xray/domain)
apt install iptables iptables-persistent -y
apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y
apt install socat cron bash-completion ntpdate -y
#ntpdate pool.ntp.org
ntpdate -u pool.ntp.org
apt -y install chrony
timedatectl set-ntp true
#systemctl enable chronyd && systemctl restart chronyd
systemctl enable chrony && systemctl restart chrony
timedatectl set-timezone Asia/Jakarta
#chronyc sourcestats -v
#chronyc tracking -v
apt install curl pwgen openssl netcat cron -y

# Make Folder & Log XRay & Log Trojan
rm -fr /var/log/xray
rm -fr /var/log/trojan
rm -fr /home/vps/public_html
mkdir -p /var/log/xray
mkdir -p /var/log/trojan
mkdir -p /home/vps/public_html
chown www-data.www-data /var/log/xray
chown www-data.www-data /etc/xray
chmod +x /var/log/xray
chmod +x /var/log/trojan
touch /var/log/xray/access.log
touch /var/log/xray/error.log
touch /var/log/xray/access2.log
touch /var/log/xray/error2.log
# Make Log Autokill & Log Autoreboot
rm -fr /root/log-limit.txt
rm -fr /root/log-reboot.txt
touch /root/log-limit.txt
touch /root/log-reboot.txt
touch /home/limit
echo "" > /root/log-limit.txt
echo "" > /root/log-reboot.txt

# Install Wondershaper
cd /root/
apt install wondershaper -y
git clone https://github.com/magnific0/wondershaper.git >/dev/null 2>&1
cd wondershaper
make install
cd
rm -fr /root/wondershaper
echo > /home/limit

# nginx for debian & ubuntu
install_ssl(){
    if [ -f "/usr/bin/apt-get" ];then
            isDebian=`cat /etc/issue|grep Debian`
            if [ "$isDebian" != "" ];then
                    apt-get install -y nginx certbot
                    apt install -y nginx certbot
                    sleep 3s
            else
                    apt-get install -y nginx certbot
                    apt install -y nginx certbot
                    sleep 3s
            fi
    else
        yum install -y nginx certbot
        sleep 3s
    fi

    systemctl stop nginx.service

    if [ -f "/usr/bin/apt-get" ];then
            isDebian=`cat /etc/issue|grep Debian`
            if [ "$isDebian" != "" ];then
                    echo "A" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
                    sleep 3s
            else
                    echo "A" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
                    sleep 3s
            fi
    else
        echo "Y" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
        sleep 3s
    fi
}

# install nginx
mkdir -p /home/vps/public_html
wget -q -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/vps.conf.txt"
sleep 1
wget -q -O xraymode.sh https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/xraymode.sh && chmod +x xraymode.sh && ./xraymode.sh
sleep 1 
wget -q -O /etc/xray/config.json "https://raw.githubusercontent.com/YINNSTORE/drg/main/configuration/config.json"
chmod +x /etc/xray/config.json
sleep 1 
rm -f /etc/nginx/conf.d/xray.conf
wget -q -O /etc/nginx/conf.d/xray.conf "https://raw.githubusercontent.com/YINNSTORE/drg/main/configuration/xray.conf"
chmod +x /etc/nginx/conf.d/xray.conf

# Installing Xray Service
rm -fr /etc/systemd/system/xray.service.d
rm -fr /etc/systemd/system/xray.service
cat <<EOF> /etc/systemd/system/xray.service
Description=Xray Service
Documentation=https://github.com/xtls
After=network.target nss-lookup.target

[Service]
User=www-data
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE                            
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /etc/xray/config.json
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target
EOF

echo -e "[ ${GREEN}ok${NC} ] Enable & Start & Restart & Xray"
systemctl daemon-reload >/dev/null 2>&1
systemctl enable xray >/dev/null 2>&1
systemctl start xray >/dev/null 2>&1
systemctl restart xray >/dev/null 2>&1
echo -e "[ ${GREEN}ok${NC} ] Enable & Start & Restart & Nginx"
systemctl daemon-reload >/dev/null 2>&1
systemctl enable nginx >/dev/null 2>&1
systemctl start nginx >/dev/null 2>&1
systemctl restart nginx >/dev/null 2>&1
# Restart All Service
echo -e "$yell[SERVICE]$NC Restart All Service"
sleep 1
chown -R www-data:www-data /home/vps/public_html
# Enable & Restart & Xray & Trojan & Nginx
sleep 1
echo -e "[ ${GREEN}ok${NC} ] Restart & Xray & Nginx"
systemctl daemon-reload >/dev/null 2>&1
systemctl restart xray >/dev/null 2>&1
systemctl restart nginx >/dev/null 2>&1

#LIMIT QUOTA
wget -q -O /usr/local/sbin/quota "https://raw.githubusercontent.com/YINNSTORE/drg/main/limit/quota.sh"
chmod +x /usr/local/sbin/quota
chmod +x /usr/local/sbin/quota
cd /usr/local/sbin/
sed -i 's/\r//' quota 



#SERVICE QUOTA VMESS
cat >/etc/systemd/system/qmv.service << EOF
[Unit]
Description=My
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/local/sbin/quota vmess
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart qmv
systemctl enable qmv

#SERVICE QUOTAVLESS
cat >/etc/systemd/system/qmvl.service << EOF
[Unit]
Description=My 
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/local/sbin/quota vless
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart qmvl
systemctl enable qmvl

#SERVICE TROJAN
cat >/etc/systemd/system/qmtr.service << EOF
[Unit]
Description=My 
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/local/sbin/quota trojan
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart qmtr
systemctl enable qmtr





ETH=$(ip -o $ETH -4 route show to default | awk '{print $5}');
# Generated by iptables-save v1.8.4 on Thu Dec 29 03:14:18 2022
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]

# INPUT IP SERVER MANAGEMEN TCP CONNECT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 10015 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 10012 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 10011 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 10008 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 10007 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 10006 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 10005 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 10004 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 10003 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 10002 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 10001 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 10000 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 8080 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 3128 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 1194 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 109 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 169 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 88 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
iptables -A  INPUT -p tcp -m state --state NEW -m tcp --dport 68 -j ACCEPT

# INPUT IP SERVER MANAGEMEN UDP CONNECT
iptables -A  INPUT -m state --state NEW -m udp -p udp --dport 53 -j ACCEPT
iptables -A  INPUT -m state --state NEW -m udp -p udp --dport 2200 -j ACCEPT
iptables -A  INPUT -m state --state NEW -m udp -p udp --dport 5300 -j ACCEPT
iptables -A  INPUT -m state --state NEW -m udp -p udp --dport 2100 -j ACCEPT
iptables -A  INPUT -m state --state NEW -m udp -p udp --dport 5300 -j ACCEPT
iptables -A  INPUT -m state --state NEW -m udp -p udp --dport 7100 -j ACCEPT
iptables -A  INPUT -m state --state NEW -m udp -p udp --dport 7200 -j ACCEPT
iptables -A  INPUT -m state --state NEW -m udp -p udp --dport 7300 -j ACCEPT

# INPUT IP SERVER MANAGEMEN TORRENT DISCONNECT
iptables -A  INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m state --state NEW -j DROP
iptables -A  INPUT -p tcp -m tcp --tcp-flags RST RST -m limit --limit 2/sec --limit-burst 2 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -m state --state NEW -m recent --set
iptables -A INPUT -p tcp --dport 80 -m state --state NEW -m recent --update --seconds 1 --hitcount 5 -j DROP
iptables -A  FORWARD -m string --string "BitTorrent" --algo bm --to 65535 -j DROP
iptables -A  FORWARD -m string --string "BitTorrent protocol" --algo bm --to 65535 -j DROP
iptables -A  FORWARD -m string --string "peer_id=" --algo bm --to 65535 -j DROP
iptables -A  FORWARD -m string --string ".torrent" --algo bm --to 65535 -j DROP
iptables -A  FORWARD -m string --string "announce.php?passkey=" --algo bm --to 65535 -j DROP
iptables -A  FORWARD -m string --string "torrent" --algo bm --to 65535 -j DROP
iptables -A  FORWARD -m string --string "announce" --algo bm --to 65535 -j DROP
iptables -A  FORWARD -m string --string "info_hash" --algo bm --to 65535 -j DROP
iptables -A  FORWARD -m string --string "/default.ida?" --algo bm --to 65535 -j DROP
iptables -A  FORWARD -m string --string ".exe?/c+dir" --algo bm --to 65535 -j DROP
iptables -A  FORWARD -m string --string ".exe?/c_tftp" --algo bm --to 65535 -j DROP
iptables -A  FORWARD -m string --string "peer_id" --algo kmp --to 65535 -j DROP
iptables -A  FORWARD -m string --string "BitTorrent" --algo kmp --to 65535 -j DROP
iptables -A  FORWARD -m string --string "BitTorrent protocol" --algo kmp --to 65535 -j DROP
iptables -A  FORWARD -m string --string "bittorrent-announce" --algo kmp --to 65535 -j DROP
iptables -A  FORWARD -m string --string "announce.php?passkey=" --algo kmp --to 65535 -j DROP
iptables -A  FORWARD -m string --string "find_node" --algo kmp --to 65535 -j DROP
iptables -A  FORWARD -m string --string "info_hash" --algo kmp --to 65535 -j DROP
iptables -A  FORWARD -m string --string "get_peers" --algo kmp --to 65535 -j DROP
iptables -A  FORWARD -m string --string "announce" --algo kmp --to 65535 -j DROP
iptables -A  FORWARD -m string --string "announce_peers" -iptables -A lgo kmp --to 65535 -j DROP
iptables -A  f2b-sshd -s 101.33.205.230/32 -j REJECT --reject-with icmp-port-unreachable
iptables -A  f2b-sshd -s 92.15.182.166/32 -j REJECT --reject-with icmp-port-unreachable
iptables -A  f2b-sshd -s 112.164.236.13/32 -j REJECT --reject-with icmp-port-unreachable
iptables -A  f2b-sshd -s 159.65.34.202/32 -j REJECT --reject-with icmp-port-unreachable
iptables -A  f2b-sshd -j RETURN
iptables -A  f2b-sshd -j RETURN
iptables -A  port-scanning -j DROP

Exists=$(iptables -L | grep -w "fail2ban_dump")
if [[ "${Exists}" == "" ]]; then
    iptables -F fail2ban_dump
    iptables -N fail2ban_dump
    iptables -I INPUT -p tcp -j fail2ban_dump
    iptables -I OUTPUT -p tcp -j fail2ban_dump
    fi
    
Exists=$(iptables -L | grep -w "fail2ban_rest")
if [[ "${Exists}" == "" ]]; then
    iptables -F fail2ban_rest
    iptables -N fail2ban_rest
    iptables -I INPUT -p tcp -j fail2ban_rest
    iptables -I OUTPUT -p tcp -j fail2ban_rest
    fi
COMMIT
# Completed on Thu Dec 29 03:14:18 2022
# Generated by iptables-save v1.8.4 on Thu Dec 29 03:14:18 2022
*nat
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
iptables -A PREROUTING -i $ETH -p udp -m udp --dport 53 -j REDIRECT --to-ports 5300
iptables -A POSTROUTING -s 10.8.0.0/24 -o $ETH -j MASQUERADE
iptables -A POSTROUTING -s 20.8.0.0/24 -o $ETH -j MASQUERADE


COMMIT
# Completed on Thu Dec 29 03:14:18 2022
iptables-save > /etc/iptables/rules.v4
iptables-save > /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
systemctl restart netfilter-persistent




