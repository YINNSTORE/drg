#!/bin/bash


LocalVersion=$(cat /etc/version)
version=$(curl -sS "myrid.digital/drg/versiupdate")

if [ "$LocalVersion" = "$version" ]; then
  echo
else
  clear
  figlet -f 3d "gretongers" | lolcat
  echo "Update tersedia!!" | lolcat
  echo "Fix Menu" | lolcat

  spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
      local temp=${spinstr#?}
      printf " [%c] " "$spinstr"
      local spinstr=$temp${spinstr%"$temp"}
      sleep $delay
      printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
  }

  loading_animation() {
    local message=$1
    echo -n "$message"
    $2 &
    spinner $!
  }

  echo "Sedang mengupdate!!!"

  loading_animation "Loading" "sleep 5"

  fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
      [[ -e $HOME/fim ]] && rm $HOME/fim
      ${CMD[0]} -y >/dev/null 2>&1
      ${CMD[1]} -y >/dev/null 2>&1
      touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
      for ((i = 0; i < 18; i++)); do
        echo -ne "\033[0;32m#"
        sleep 0.1s
      done
      [[ -e $HOME/fim ]] && rm $HOME/fim && break
      echo -e "\033[0;33m]"
      sleep 1s
      tput cuu1
      tput dl1
      echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
  }
  fun_bar

  # Hapus semua file sebelum mengunduh versi baru
  rm -f /etc/version
  rm -f /usr/bin/menu
  rm -f /usr/bin/menu-ssh
  # Tambahkan perintah rm untuk file lainnya...
wget -q -O /etc/version "https://raw.githubusercontent.com/YINNSTORE/drg/main/versiupdate" && chmod +x /etc/version
  rm -f /usr/bin/menu
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/YINNSTORE/drg/main/menu.sh" && chmod 777 /usr/bin/menu


fi
