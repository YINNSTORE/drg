#!/bin/bash

function vmess(){
sleep 2
while IFS=' ' read -r line; do
    if [[ "$line" == "###"* ]]; then
        user=$(echo "$line" | cut -d' ' -f2)
        expiration_time=$(echo "$line" | cut -d' ' -f3)
        current_time=$(date +"%T")

        if [[ "$expiration_time" < "$current_time" ]]; then
            exp=$(grep -wE "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
systemctl restart xray > /dev/null 2>&1

        fi
    fi
done < /etc/trialxray.txt
}
function vless() {
sleep 2
    while IFS=' ' read -r line; do
        if [[ "$line" == "#!"* ]]; then
            user=$(echo "$line" | cut -d' ' -f2)
            expiration_time=$(echo "$line" | cut -d' ' -f3)
            current_time=$(date +"%T")

            if [[ "$expiration_time" < "$current_time" ]]; then
                exp=$(grep -wE "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
                sed -i "/^#& $user $exp/,/^},{/d" /etc/xray/config.json
                systemctl restart xray > /dev/null 2>&1
            fi
        fi
    done < /etc/trialxray.txt
}

function trojan() {
sleep 2
    while IFS=' ' read -r line; do
        if [[ "$line" == "#!"* ]]; then
            user=$(echo "$line" | cut -d' ' -f2)
            expiration_time=$(echo "$line" | cut -d' ' -f3)
            current_time=$(date +"%T")

            if [[ "$expiration_time" < "$current_time" ]]; then
                exp=$(grep -wE "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
                sed -i "/^#! $user $exp/,/^},{/d" /etc/xray/config.json
                systemctl restart xray > /dev/null 2>&1
            fi
        fi
    done < /etc/trialxray.txt
}

function ssh() {
    while IFS=' ' read -r line; do
        if [[ "$line" == "#?"* ]]; then
            user=$(echo "$line" | cut -d' ' -f2)
            expiration_time=$(echo "$line" | cut -d' ' -f3)
            current_time=$(date +"%T")

            if [[ "$expiration_time" < "$current_time" ]]; then
                userdel $user
            fi
        fi
    done < /etc/trialxray.txt
}


vmess
vless
trojan
ssh