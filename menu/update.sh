#!/bin/bash
LocalVersion=$(cat /root/versi)
Version=$(curl -sS myrid.digital/drg/versi | awk '{print $2}')
if [ $LocalVersion = $Version ]; then
echo -e "Script Sudah Versi Terbaru..." | lolcat
else
echo -e "Update tersedia!!";
wget -q -O updateyes.sh https://raw.githubusercontent.com/YINNSTORE/drg/main/menu/updateyes.sh && chmod +x updateyes.sh && ./updateyes.sh
rm -f updateyes.sh
fi
