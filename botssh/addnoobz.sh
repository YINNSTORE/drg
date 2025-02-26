#!/bin/bash
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "      °NOOBZVPN'S CREATE°            "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -p "Username: " user
read -p "Password: " pass
read -p "Exp (0 for unlimited days):" exp
read -p "IP LIMIT " ip

if [ ! -e /etc/cybervpn/limit/noobs/ip/ ]; then
  mkdir -p /etc/cybervpn/limit/noobs/ip/
fi
echo "$ip" > /etc/cybervpn/limit/noobs/ip/$user

noobzvpns --add-user $user $pass --expired-user $user $exp
