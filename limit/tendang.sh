#!/bin/bash
sleep 5
touch .data
if [ -e "/var/log/auth.log" ]; then
    LOG="/var/log/auth.log"
elif [ -e "/var/log/secure" ]; then
    LOG="/var/log/secure"
else
    echo "Tidak ada file log yang tersedia." >&2
    exit 1
fi

data=( $(ps aux | grep -i dropbear | awk '{print $2}') )
grep -i "dropbear" "$LOG" | grep -i "Password auth succeeded" > /tmp/login-db.txt

for PID in "${data[@]}"
do
    grep "dropbear\[$PID\]" /tmp/login-db.txt > /tmp/login-db-pid.txt
    NUM=$(wc -l < /tmp/login-db-pid.txt)
    if [ "$NUM" -eq 1 ]; then
        USER=$(awk '{print $10}' /tmp/login-db-pid.txt)
        echo "$USER" >> .data
    fi
done

sleep 0.5
mulog=$(cat .data)
tanggal=$(date)
data=( $(ls /etc/cybervpn/limit/ssh/ip) )

for user in "${data[@]}"
do
    nilai=$(cat "/etc/cybervpn/limit/ssh/ip/$user")
    
iplimit=$((nilai++))
    cekcek=$(echo -e "$mulog" | grep "$user" | wc -l)
    if [[ $cekcek -gt $iplimit ]]; then
        passwd -l "$user"

pesan="
--------------------------------
🕊 MULTI LOGIN DETECTED 🕊
--------------------------------
$tanggal\nlock User: $user Login: $cekcek IP Max: $ip IP \n
--------------------------------
"
source /root/cybervpn/var.txt && echo $BOT_TOKEN > .bot
azi=$(cat .bot)
source /root/cybervpn/var.txt && echo $ADMIN > .id
aji=$(cat .id)

curl -s -X POST "https://api.telegram.org/bot$azi/sendMessage" \ -d "chat_id=$aji" \ -d "text=$pesan"

        nais=3
        echo -e "$tanggal\nlock User: $user Login: $cekcek IP Max: $ip IP \n" >> /etc/funny/log/ssh/ssh.log
    else
        echo > /dev/null
    fi
    sleep 0.1
done

if [[ $nais -gt 1 ]]; then
    telegram-send --pre "$(log-ssh)" > /dev/null &
else
    echo > /dev/null
fi

rm .data
