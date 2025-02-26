# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

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

# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="XdrgVPN"

# status
rm -rf /root/status
wget -q -O /root/status "https://raw.githubusercontent.com/YINNSTORE/drg/main/statushariini"


clear
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${GREEN}| \E[44;1;39m         °MENU SERVICE°            \E[0m|"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"


echo -e "${LIGHT}"
echo -e "01.MENU SSH WEBSOCKET"
echo -e "02.MENU SSH UDP"
echo -e "03.MENU XRAY VMESS"
echo -e "04.MENU XRAY VLESS"
echo -e "05.MENU SHADOWSOCKS"
echo -e "06.MENU TROJAN"
echo -e "07.MENU NOOBZVPNS"

echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${GREEN}| \E[44;1;39m            °FEATURE°              \E[0m|"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${LIGHT}"
echo -e "08.INFO RUNNING"
echo -e "09.TRIAL GENERATOR"
echo -e "10.SETTINGS"
echo -e "11.Bot panel setting"
echo -e "12.FIX UDP CUSTOM"
echo -e "13.MENU IPSEC (L2TP & PPTP)"
echo -e "14.Back to terminal"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${GREEN}| \E[44;1;39m    °YINN VPN PREMIUIM°      \E[0m|"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo
read -p " Select menu : " opt
echo -e ""
case $opt in
01 | 1) clear ; menu-ssh ;;
02 | 2) clear ; udp ;;
03 | 3) clear ; menu-vmess ;;
04 | 4) clear ; menu-vless ;;
05 | 5) clear ; menu-ss ;;
06 | 6) clear ; menu-trojan ;;
07 | 7) clear ; menu-noobzvpns ;;
08 | 8) clear ; running ;;
09 | 9) clear ; menu-trial ;;
10) clear ; setting ;;
11) clear ; panelbot ;;
12) clear ; curl "https://raw.githubusercontent.com/Azigaming404/Autoscript-by-azi/main/udp/udp-custom.sh" | bash ;;
13) clear ; menu-ipsec ;;
14) clear ; menu1 ;;
100) clear ; $up2u ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac

