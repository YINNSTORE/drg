export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
clear
echo -e "${PURPLE}=================================="
echo -e "${LIGHT} TRIAL GENERATOR BY YINN VVIP TUNELL"


echo -e "${PURPLE}=================================="
echo -e "${LIGHT}"
echo -e " Akumulasi Trial minimal 1 menit"
echo -e ""
echo -e " 1).TRIAL AKUN SSH & slowdns"
echo -e " 2).TRIAL AKUN SSH UDP"
echo -e " 3).TRIAL AKUN VMESS"
echo -e " 4).TRIAL AKUN VLESS"
echo -e " 5).TRIAL AKUN TROJAN"
echo -e "${PURPLE}==================================="

read -p "PILIH NOMOR: " bro
echo -e ""
case $bro in
1) clear ; trial ;;
2) clear ; trial-udp ;;
3) clear ; trial-vmess ;;
4) clear ; trial-vless ;;
5) clear ; trial-trojan ;;
100) clear ; $up2u ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac
