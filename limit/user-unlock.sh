#!/bin/bash
# Uban User.
red='\e[31m'
green='\e[32m'
blue='\e[34m'
NC='\e[0m'
clear
echo -e "${green}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${green}| \E[44;1;39m                °UNLOCK ACCOUNT°             \E[0m|"
echo -e "${green}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"

echo -e "\e[36m------------------------------------------\e[0m"
read -p "※ Enter Username To Be Unlock : " username
egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
# proses mengganti passwordnya
passwd -u $username
clear
  echo " ";
        echo " ";
        echo " ";
        echo " ";
        echo -e " \e[36m※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※
 ※                                 ※
 ※\e[0m   WELCOME MY SYSTEM YINN VPN PREMIUM \e[36m※
 ※                                 ※
 ※\e[0m   \e[35mWhatsApp\e[0m    \e[36m:\e[0m \e[33m+6287769315399\e[0m    \e[36m※
 ※\e[0m   \e[35mTelegram\e[0m    \e[36m:\e[0m \e[33m@Kytxz\e[0m      \e[36m※
 ※\e[0m   \e[35mInstagram\e[0m    \e[36m:\e[0m \e[33m@myridtunnel[0m      \e[36m※
  ※                                 ※
 ※\e[0m        \e[31m©\e[0m YINN™ \e[31m®\e[0m         \e[36m※
 ※                                 ※
 ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※ ※\e[0m";
        echo "
 ◎ Your Account Status ◎";
  echo " "
  echo -e "  \e[34m※\e[0m Username : ${blue}$username${NC}";
  echo -e "  \e[32m※\e[0m Status   : ${green}UNLOCKED${NC}";
  echo " ";
  echo " ★ POWER BY YINN™ SERVER ★";
  echo " ";
        echo " ";
        echo " ";
        echo " ";
else
echo "Username ${red}$username${NC} Does Not Exist ..!"
    exit 1
fi