#!/bin/bash
echo '============= 時區設定 ==============='
read -p '列出可用時區 (Enter 進入，/ 搜尋，q 離開)'
timedatectl list-timezones

read -p '設定時區(直接 Enter 使用預設 Asia/Taipei): ' timezone
if [[ "$timezone" = "" ]]; then
	sudo timedatectl set-timezone Asia/Taipei
	echo '設定時區為 Asia/Taipei'
else
	sudo timedatectl set-timezone $timezone
	echo "設定時區為 $timezone"
fi

read -p '是否安裝 NTP 伺服器來同步時間? (y/n):' ntp
if [[ "$ntp" = "y" ]]; then
	sudo yum -y install ntp
	echo '啟動 NTP'
	sudo systemctl start ntpd
	sudo systemctl enable ntpd
fi
