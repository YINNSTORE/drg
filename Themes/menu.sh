#!/bin/bash
# =========================================
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '\''$3 >= 1000 && $1 != "nobody" {print $1}'\'' /etc/passwd | wc -l)"

trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2
COLOR1='\''\033[0;35m'\''
COLOR2='\''\033[0;39m'\''
clear
# // Exporting Language to UTF-8
export LC_ALL='\''en_US.UTF-8'\''
export LANG='\''en_US.UTF-8'\''
export LANGUAGE='\''en_US.UTF-8'\''
export LC_CTYPE='\''en_US.utf8'\''

# // Export Color & Information
export RED='\''\033[0;31m'\''
export GREEN='\''\033[0;32m'\''
export YELLOW='\''\033[0;33m'\''
export BLUE='\''\033[0;34m'\''
export PURPLE='\''\033[0;35m'\''
export CYAN='\''\033[0;36m'\''
export LIGHT='\''\033[0;37m'\''
export NC='\''\033[0m'\''

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

# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="XdrgVPN"

# status
rm -rf /root/status
wget -q -O /root/status "https://raw.githubusercontent.com/YINNSTORE/drg/main/statushariini"


# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "memeriksa vps anda"
sleep 0.5
CEKEXPIRED () {
        today=$(date -d +1day +%Y -%m -%d)
        Exp1=$(curl -sS https://raw.githubusercontent.com/YINNSTORE/izinvps/main/ip | grep $MYIP | awk '\''{print $3}'\'')
        if [[ $today < $Exp1 ]]; then
        echo "status script aktif.."
        else
        echo "SCRIPT ANDA EXPIRED";
        exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/YINNSTORE/izinvps/main/ip | awk '\''{print $4}'\'' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo "IZIN DI TERIMA!!"
CEKEXPIRED
else
echo "Akses di tolak!! Benget sia hurung!!";
exit 0
fi
# // Root Checking
if [ "${EUID}" -ne 0 ]; then
                echo -e "${EROR} Please Run This Script As Root User !"
                exit 1
fi
tomem="$(free | awk '\''{print $2}'\'' | head -2 | tail -n 1 )"
usmem="$(free | awk '\''{print $3}'\'' | head -2 | tail -n 1 )"
cpu1="$(mpstat | awk '\''{print $4}'\'' | head -4 |tail -n 1)"
cpu2="$(mpstat | awk '\''{print $6}'\'' | head -4 |tail -n 1)"

persenmemori="$(echo "scale=2; $usmem*100/$tomem" | bc)"
#persencpu=
persencpu="$(echo "scale=2; $cpu1+$cpu2" | bc)"
# // Exporting IP Address
export MYIP=$( curl -s https://ipinfo.io/ip/ )
Name=$(curl -sS https://raw.githubusercontent.com/YINNSTORE/izinvps/main/ip | grep $MYIP | awk '\''{print $2}'\'')
Exp=$(curl -sS https://raw.githubusercontent.com/YINNSTORE/izinvps/main/ip | grep $MYIP | awk '\''{print $3}'\'')

# // nginx
nginx=$( systemctl status nginx | grep Active | awk '\''{print $3}'\'' | sed '\''s/(//g'\'' | sed '\''s/)//g'\'' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi
# // 
xray=$( systemctl status xray | grep Active | awk '\''{print $3}'\'' | sed '\''s/(//g'\'' | sed '\''s/)//g'\'' )
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi

# // SSH Websocket Proxy
ssh=$(/etc/init.d/ssh status | grep Active | awk '\''{print $3}'\'' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
    status_ssh="${GREEN}ON${NC}"
else
    status_ssh="${RED}OFF${NC}"
fi
ttoday="$(vnstat | grep today | awk '\''{print $8" "substr ($9, 1, 3)}'\'' | head -1)"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '\''{print $8" "substr ($9, 1 ,3)}'\'' | head -1)"
bot
wget -q -O /usr/bin/lock "https://raw.githubusercontent.com/YINNSTORE/drg/main/limit/user-lock.sh" && chmod +x /usr/bin/lock
wget -q -O /usr/bin/unlock "https://raw.githubusercontent.com/YINNSTORE/drg/main/limit/user-unlock.sh" && chmod +x /usr/bin/unlock
clear

echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${GREEN}| \E[44;1;39m         °YINN VVIP TUNELING°        \E[0m|"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "□ Server Uptime       = $( uptime -p  | cut -d " " -f 2-10000 ) "
 
echo -e "• Current Time        = $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "• Current Domain      = $( cat /etc/xray/domain )"
echo -e "• Server IP           = $MYIP"
echo -e "• ISP                 = $(cat /root/.isp)${NC}"
echo -e "• Server Resource     = RAM = $persenmemori% | CPU = $persencpu%"

echo -e "• Status Hari ini     = $(cat /root/status)${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "$GREEN┌──────────────────────────────────────────────────┐${NC}"

echo -e " ${YELLOW}• Today${NC}  : [$ttoday] ${YELLOW}• Monthly${NC}: [$tmon]"

echo -e "$GREEN└──────────────────────────────────────────────────┘${NC}"



echo -e ""
echo -e "$GREEN┌────────────────────────────────┐${NC}"
echo -e " ${YELLOW}• SSH WebSocket${NC}: [${status_ssh}]"
echo -e " ${YELLOW}• XRAY${NC}         : [${status_xray}]"
echo -e " ${YELLOW}• NGINX ${NC}       : [${status_nginx}]"
echo -e "$GREEN└────────────────────────────────┘${NC}"
echo -e "${GREEN}┌──────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│  \033[0m ${BOLD}${YELLOW}SSH     VMESS       VLESS      TROJAN       SHADOWSOCKS$NC  $COLOR1"
echo -e "${GREEN}│  \033[0m ${Blue} $ssh1        $vma           $vla          $tra               $ssa   $NC"
echo -e "${GREEN}└──────────────────────────────────────────────────┘${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\E[39;1;92m                ⇱ MENU SERVICE ⇲                \E[0m"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

echo -e "${GREEN}┌──────────────────────────────────────────────────┐${NC}"

echo -e " ${CYAN}[${BIWhite}01${BICyan}]${RED} •${NC} ${CYAN}SSH & OVPN MENU $NC  ${CYAN}[${BIWhite}06${BICyan}]${RED} • ${NC}${CYAN}MENU L2TP & PPTP [ IPSEC ]$NC"
echo -e " ${CYAN}[${BIWhite}02${BICyan}]${RED} •${NC} ${CYAN}VMESS MENU      $NC  ${CYAN}[${BIWhite}07${BICyan}]${RED} • ${NC}${CYAN}INFO RUNNING $NC"
echo -e " ${CYAN}[${BIWhite}03${BICyan}]${RED} •${NC} ${CYAN}VLESS MENU      $NC  ${CYAN}[${BIWhite}08${BICyan}]${RED} • ${NC}${CYAN}SSH UDP MENU $NC"
echo -e " ${CYAN}[${BIWhite}04${BICyan}]${RED} •${NC} ${CYAN}TROJAN MENU     $NC  ${CYAN}[${BIWhite}09${BICyan}]${RED} • ${NC}${CYAN}FEATURS $NC"
echo -e " ${CYAN}[${BIWhite}05${BICyan}]${RED} •${NC} ${CYAN}S-SOCK MENU     $NC  ${CYAN}[${BIWhite}10${BICyan}]${RED} • ${NC}${CYAN}CEKING UPDATE  $NC" 

echo -e "${GREEN}└──────────────────────────────────────────────────┘${NC}"

echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

echo -e " ${GREEN}"
echo -e "${GREEN}┌──────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}│ ${BOLD}${LIGHT}Client    = $Name                           ${NC}"
echo -e "${GREEN}│ ${BOLD}${LIGHT}Expired   = $Exp                            ${NC}"
echo -e "${GREEN}│ ${BOLD}${LIGHT}Developer = RAIDER VPN TUNELL                         ${NC}"
echo -e "${GREEN}│ ${BOLD}${LIGHT}Version   = 7.0.2 LTS                         ${NC}"

echo -e "${GREEN}└──────────────────────────────────────────────────┘${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

echo
read -p " Select menu : " opt
echo -e ""
case $opt in
01 | 1) clear ; menu-ssh ;;
02 | 2) clear ; menu-vmess ;;
03 | 3) clear ; menu-vless ;;
04 | 4) clear ; menu-trojan ;;
05 | 5) clear ; menu-ss ;;
06 | 6) clear ; menu-ipsec ;;
07 | 7) clear ; running ;;
08 | 8) clear ;  udp ;;
09 | 9) clear ; setting ;;
10) clear ; updatsc ;;

100) clear ; $up2u ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac