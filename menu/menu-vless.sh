#!/bin/bash

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
RED='\033[0;31m'

NC='\033[0m'

GREEN='\033[0;32m'

ORANGE='\033[0;33m'

BLUE='\033[0;34m'

PURPLE='\033[0;35m'

CYAN='\033[0;36m'

LIGHT='\033[0;37m'
###########- END COLOR CODE -##########

BURIQ () {
    curl -sS https://raw.githubusercontent.com/YINNSTORE/izinvps/main/ip > /root/tmp
data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
for user in "${data[@]}"
do
exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
d1=(`date -d "$exp" +%s`)
d2=(`date -d "$biji" +%s`)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
echo $user > /etc/.$user.ini
else
rm -f /etc/.$user.ini > /dev/null 2>&1
fi
done
rm -f /root/tmp
}
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS  https://raw.githubusercontent.com/YINNSTORE/izinvps/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)
Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
if [ "$CekOne" = "$CekTwo" ]; then
res="Expired"
fi
else
res="Permission Accepted..."
fi
}
PERMISSION () {
MYIP=$(curl -sS ipv4.icanhazip.com)
IZIN=$(curl -sS  https://raw.githubusercontent.com/YINNSTORE/izinvps/main/ip | awk '{print $4}' | grep $MYIP)
if [ "$MYIP" = "$IZIN" ]; then
Bloman
else
res="Permission Denied!"
fi
BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
function con() {
local -i bytes=$1;
if [[ $bytes -lt 1024 ]]; then
echo "${bytes}B"
elif [[ $bytes -lt 1048576 ]]; then
echo "$(( (bytes + 1023)/1024 ))KB"
elif [[ $bytes -lt 1073741824 ]]; then
echo "$(( (bytes + 1048575)/1048576 ))MB"
else
echo "$(( (bytes + 1073741823)/1073741824 ))GB"
fi
}
function cekvless(){
clear
echo -n > /tmp/other.txt
data=( `cat /etc/xray/config.json | grep '#&' | cut -d ' ' -f 2 | sort | uniq`);
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • ONLINE VLESS USER •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e " ────────────────────────────────────────────────"
echo -e "   user  | usage | quota | limit | login | waktu "
echo -e " ────────────────────────────────────────────────"
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipvless.txt
data2=( `cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvless.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvless.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvless.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
iplimit=$(cat /etc/cybervpn/limit/vless/ip/${akun})
jum2=$(cat /tmp/ipvless.txt | wc -l)
byte=$(cat /etc/vless/${akun})
lim=$(con ${byte})
wey=$(cat /etc/limit/vless/${akun})
gb=$(con ${wey})
lastlogin=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 2 | tail -1)
printf "  %-13s %-7s %-8s %2s\n"  " ${akun}     ${gb}    ${lim}      $iplimit       $jum2    $lastlogin"
fi
rm -rf /tmp/ipvless.txt
done
rm -rf /tmp/other.txt
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • YINN VVIP TUNELL •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-vless
}
function renewvless(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • RENEW VLESS USER •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
NUMBER_OF_CLIENTS=$(grep -c -E "^#& " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "$COLOR1│${NC}  • You have no existing clients!"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • YINN VVIP TUNELL •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-vless
fi
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • RENEW VLESS USER •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
grep -E "^#& " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
echo -e "$COLOR1│${NC}"
echo -e "$COLOR1│${NC}  • [NOTE] Press any key to back on menu"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • YINN VVIP TUNELL •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1───────────────────────────────────────────────────${NC}"
read -rp "Input Username : " user
if [ -z $user ]; then
menu
else
rm -f /etc/cybervpn/limit/vless/ip/${user}
rm -f /etc/vless/$user
read -p "Expired (days): " masaaktif
read -p "Limit User (GB): " Quota
read -p "Limit User (IP): " iplim
exp=$(grep -wE "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
mkdir -p /etc/cybervpn/limit/vless/ip
echo $iplim > /etc/cybervpn/limit/vless/ip/${user}
if [ ! -e /etc/vless/ ]; then
mkdir -p /etc/vless/
fi
if [ -z ${Quota} ]; then
Quota="0"
fi
c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))
if [[ ${c} != "0" ]]; then
echo "${d}" >/etc/vless/${user}
fi
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "/#& $user/c\#& $user $exp4" /etc/xray/config.json
systemctl restart xray > /dev/null 2>&1
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • RENEW VLESS USER •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}   [INFO]  $user Account Renewed Successfully"
echo -e "$COLOR1│${NC}   "
echo -e "$COLOR1│${NC}   Client Name : $user"
echo -e "$COLOR1│${NC}   limit IP    : $iplim"
echo -e "$COLOR1│${NC}   limit quota : $Quota"
echo -e "$COLOR1│${NC}   Days Added  : $masaaktif Days"
echo -e "$COLOR1│${NC}   Expired On  : $exp4"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • YINN VVIP TUNELL •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-vless
fi
}
function delvless(){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#& " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}            • DELETE VLESS USER •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}  • You Dont have any existing clients!"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • YINN VVIP TUNELL •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-vless
fi
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}            • DELETE VLESS USER •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
grep -E "^#& " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
echo -e "$COLOR1│${NC}"
echo -e "$COLOR1│${NC}  • [NOTE] Press any key to back on menu"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1───────────────────────────────────────────────────${NC}"
read -rp "   Input Username : " user
if [ -z $user ]; then
menu-vless
else
exp=$(grep -wE "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
sed -i "/^#& $user $exp/,/^},{/d" /etc/xray/config.json
sed -i "/$user/d" /etc/vless/.vless.db
systemctl restart xray > /dev/null 2>&1
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}            • DELETE VLESS USE •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}   • Accound Delete Successfully"
echo -e "$COLOR1│${NC}"
echo -e "$COLOR1│${NC}   • Client Name : $user"
echo -e "$COLOR1│${NC}   • Expired On  : $exp"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • YINN VVIP TUNELL •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-vless
fi
}
function unlock(){
sed -i 's/ UNLOCKED//g' /etc/vless/.vless.db
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • UNLOCK VLESS USER •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
read -rp "   Input Username for unlock: " user
if [ -z $user ]; then
menu-vless
else
uuid=$(cat /etc/vless/.vless.db | grep $user | awk '{print $4}')
exp=$(cat /etc/vless/.vless.db | grep $user | awk '{print $3}')
if [ -z "$uuid" ]; then
echo "Oh tidak, UUID-mu terhapus."
echo "Membuat UUID baru..."
uuid=$(cat /proc/sys/kernel/random/uuid)
else
echo "UUID tersedia: $uuid"
fi
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
systemctl restart xray > /dev/null 2>&1
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • UNLOCKED VLESS USER •          ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}   • Accound unlocked Successfully"
echo -e "$COLOR1│${NC}"
echo -e "$COLOR1│${NC}   • Client Name : $user"
echo -e "$COLOR1│${NC}   • Expired On  : $exp"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • YINN VVIP TUNELL •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-trojan
fi
}
function recovery(){
sed -i 's/ UNLOCKED//g' /etc/vless/.vless.db
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • RECOVERY VLESS USER •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$NC LIST USER EXPIRED"
echo ""
current_date=$(date +%s)
data=( $(grep -E "^#& " "/etc/vless/.vless.db" | cut -d ' ' -f 2 | column -t | sort | uniq ) )
for user in "${data[@]}"
do
expiration_date=$(grep -E "^#& " "/etc/vless/.vless.db" | cut -d ' ' -f 3 | column -t | sort | uniq)
expiration_date=$(echo "$expiration_date" | sed -E 's/Jan/01/;s/Feb/02/;s/Mar/03/;s/Apr/04/;s/May/05/;s/Jun/06/;s/Jul/07/;s/Aug/08/;s/Sep/09/;s/Oct/10/;s/Nov/11/;s/Dec/12/')
expiration_timestamp=$(date -d "$expiration_date" +%s 2>/dev/null)
if [ -n "$expiration_timestamp" ] && [ "$current_date" -le "$expiration_timestamp" ]; then
echo "$user masih aktif"
else
echo "• $user expired"
fi
done
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
read -rp "   Input Username for recovery: " user
if [ -z $user ]; then
menu-vless
else
echo "reset Quota usage"
rm /etc/limit/vless/$user
uuid=$(cat /etc/vless/.vless.db | grep $user | awk '{print $4}')
exp=$(cat /etc/vless/.vless.db | grep $user | awk '{print $3}')
if [ -z "$uuid" ]; then
echo "Oh tidak, UUID-mu terhapus."
sleep 1
echo "Membuat UUID baru..."
uuid=$(cat /proc/sys/kernel/random/uuid)
else
echo "UUID tersedia: $uuid"
fi
sed -i "/$user/d" /etc/vless/.vless.db
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
echo "#& ${user} ${exp} ${uuid}" >>/etc/vless/.vless.db
systemctl restart xray > /dev/null 2>&1
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • RECOVERY VLESS USER •          ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}   • Accound recovery Successfully"
echo -e "$COLOR1│${NC}"
echo -e "$COLOR1│${NC}   • Client Name : $user"
echo -e "$COLOR1│${NC}   • Expired On  : $exp"
echo -e "$COLOR1│${NC}   • uuid  : $uuid"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • YINN VVIP TUNELL •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-vless
fi
}
function con() {
local -i bytes=$1;
if [[ $bytes -lt 1024 ]]; then
echo "${bytes}B"
elif [[ $bytes -lt 1048576 ]]; then
echo "$(( (bytes + 1023)/1024 ))KB"
elif [[ $bytes -lt 1073741824 ]]; then
echo "$(( (bytes + 1048575)/1048576 ))MB"
else
echo "$(( (bytes + 1073741823)/1073741824 ))GB"
fi
}
function cekmember (){
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#& " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • LIST XRAY USER •                      ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}  • You Dont have any existing clients!"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • YINN VVIP TUNELL •                  $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-vless
fi
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • LIST XRAY USER •                 ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " ─────────────────────────────────────────────────"
echo -e "  user  | usage  |   quota  | limit ip | expired"
echo -e " ─────────────────────────────────────────────────"
data=( `cat /etc/xray/config.json | grep '#&' | cut -d ' ' -f 2 | sort | uniq`);
for akun in "${data[@]}"
do
exp=$(grep -wE "^#& $akun" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
iplimit=$(cat /etc/cybervpn/limit/vless/ip/${akun})
byte=$(cat /etc/vless/${akun})
lim=$(con ${byte})
wey=$(cat /etc/limit/vless/${akun})
gb=$(con ${wey})
printf "%-10s %-10s %-10s %-20s\n"  " ${akun}"   " ${gb}" "${lim}" "$iplimit     $exp"
done
echo -e "$COLOR1│${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • YINN VVIP TUNELL •                  $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
read -n 1 -s -r -p "  • [NOTE] Press any key to back on menu"
menu-vless
}
function addvless(){
domain=$(cat /etc/xray/domain)
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}            • CREATE VLESS USER •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
read -rp "  Input Username : " -e user
if [ -z $user ]; then
echo -e "$COLOR1│${NC} [Error] Username cannot be empty "
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • YINN VVIP TUNELL •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-vless
fi
CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
echo -e "$COLOR1│${NC} Please choose another name."
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • YINN VVIP TUNELL •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-vless
fi
done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "  Expired (days): " masaaktif
read -p "  Limit Quota (GB):" Quota
read -p "  Limit ip:" iplim
folder="/etc/cybervpn/limit/vless/ip/"
if [ ! -d "$folder" ]; then
mkdir -p "$folder"
else
echo ""
fi
echo $iplim > /etc/cybervpn/limit/vless/ip/${user}
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:$tls?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=bug.com#${user}"
if [ ! -e /etc/vless ]; then
mkdir -p /etc/vless
fi
if [ -z ${iplim} ]; then
iplim="0"
fi
if [ -z ${Quota} ]; then
Quota="0"
fi
c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))
if [[ ${c} != "0" ]]; then
echo "${d}" >/etc/vless/${user}
fi
DATADB=$(cat /etc/vless/.vless.db | grep "^#&" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
sed -i "/\b${user}\b/d" /etc/vless/.vless.db
fi
echo "#& ${user} ${exp} ${uuid}" >>/etc/vless/.vless.db
cat >/home/vps/public_html/vless-$user.yaml <<-END
- name: Vless-$user-WS TLS
server: ${domain}
port: 443
type: vless
uuid: ${uuid}
cipher: auto
tls: true
skip-cert-verify: true
servername: ${domain}
network: ws
ws-opts:
path: /vless
headers:
Host: ${domain}
- name: Vless-$user-WS (CDN) Non TLS
server: ${domain}
port: 80
type: vless
uuid: ${uuid}
cipher: auto
tls: false
skip-cert-verify: false
servername: ${domain}
network: ws
ws-opts:
path: /vless
headers:
Host: ${domain}
udp: true
- name: Vless-$user-gRPC (SNI)
server: ${domain}
port: 443
type: vless
uuid: ${uuid}
cipher: auto
tls: true
skip-cert-verify: true
servername: ${domain}
network: grpc
grpc-opts:
grpc-mode: gun
grpc-service-name: vless-grpc
udp: true
END
systemctl restart xray
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}            • CREATE VLESS USER •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} Remarks       : ${user}"
echo -e "$COLOR1 ${NC} Expired On    : $exp"
echo -e "$COLOR1 ${NC} Domain        : ${domain}"
echo -e "$COLOR1 ${NC} port TLS      : $tls"
echo -e "$COLOR1 ${NC} port none TLS : $none"
echo -e "$COLOR1 ${NC} id            : ${uuid}"
echo -e "$COLOR1 ${NC} limit  Quota  : $Quota GB"
echo -e "$COLOR1 ${NC} limit  ip     : $iplim IP"
echo -e "$COLOR1 ${NC} Network       : ws"
echo -e "$COLOR1 ${NC} Path          : /vless"
echo -e "$COLOR1 ${NC} Path WSS      : wss://bug.com/vless"
echo -e "$COLOR1 ${NC} Path          : vless-grpc"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} Link TLS :"
echo -e "$COLOR1 ${NC} ${vlesslink1}"
echo -e "$COLOR1 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$ ${NC}"
echo -e "$COLOR1 ${NC} Link none TLS : "
echo -e "$COLOR1 ${NC} ${vlesslink2}"
echo -e "$COLOR1  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$${NC}"
echo -e "$COLOR1 ${NC} Link GRPC : "
echo -e "$COLOR1 ${NC} ${vlesslink3}"
echo -e "$COLOR1 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC} "
echo -e "Format OpenClash : http://${domain}:81/vless-$user.yaml"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • YINN VVIP TUNELL •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
cat >/tmp/vless/$user.txt << EOF
-------------------------------------------
Remarks       : ${user}
Expired On    : $exp
Domain        : ${domain}
Port TLS      : ${tls}
Port none TLS : ${none}
id            : ${uuid}
Limit (GB)    : $Quota GB
------------------------------------------
Link TLS :
${vlesslink1}
-------------------------------------------
Link none TLS :
${vlesslink2}
-------------------------------------------
Link GRPC :
${vlesslink3}
--------------------------------------------
EOF
read -n 1 -s -r -p "   Press any key to back on menu"
menu-vless
}
function cek(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}           • RESULT VLESS USER •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
grep -E "^#& " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
echo -e "$COLOR1│${NC}"
echo -e "$COLOR1│${NC}Notice!! Result akan terhapus otomatis setelah Reboot"
echo -e "$COLOR1│${NC}  • [NOTE] Press any key to back on menu "
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1───────────────────────────────────────────────────${NC}"
read -rp "   Input Username : " user
if [ -z $user ]; then
menu-vless
else
cat /tmp/vless/$user.txt
fi
}
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}             • VLESS PANEL MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1│$NC   ${COLOR1}[01]${NC} • ADD VLESS"
echo -e " $COLOR1│$NC   ${COLOR1}[02]${NC} • RENEW VLESS${NC}"
echo -e " $COLOR1|$NC   ${COLOR1}[03]${NC} • DELETE VLESS${NC}"
echo -e " $COLOR1|$NC   ${COLOR1}[04]${NC} • USER ONLINE    "
echo -e " $COLOR1│$NC   ${COLOR1}[05]${NC} • CEK MEMBER${NC}"
echo -e " $COLOR1│$NC   ${COLOR1}[06]${NC} • RIWAYAT AKUN${NC} "
echo -e " $COLOR1│$NC   ${COLOR1}[07]${NC} • UNLOCK AKUN${NC} "
echo -e " $COLOR1│$NC   ${COLOR1}[08]${NC} • RECOVERY AKUN EXPIRED${NC} "
echo -e " $COLOR1│$NC                                              ${NC} $COLOR1│$NC"
echo -e " $COLOR1│$NC   ${COLOR1}[00]${NC} • GO BACK${NC}                              $COLOR1│$NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}                 • YINN VVIP TUNELL •                 $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
01 | 1) clear ; addvless ;;
02 | 2) clear ; renewvless ;;
03 | 3) clear ; delvless ;;
04 | 4) clear ; cekvless ;;
05 | 5) clear ; cekmember ;;
06 | 6) clear ; cek ;;
07 | 7) clear ; unlock ;;
08 | 8) clear ; recovery ;;
00 | 0) clear ; menu ;;
*) clear ; menu-vless ;;
esac