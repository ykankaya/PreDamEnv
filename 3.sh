#!/bin/bash
echo '============= 防火牆設定 ==============='
echo '安裝防火牆'
sudo yum -y install firewalld
echo '啟動防火牆'
sudo systemctl start firewalld
sudo systemctl enable firewalld

# 必要
echo '允許 SSH(22)'
sudo firewall-cmd --permanent --add-service=ssh
echo '允許 HTTP(80), HTTPS(443)'
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https

# 選擇性
read -p '是否要允許 MySQL/MariaDB(3306)? (y/n)' mysql
if [[ "$mysql" = 'y' ]]; then
	sudo firewall-cmd --permanent --add-service=mysql
else
    sudo firewall-cmd --permanent --remove-service=mysql
	echo '禁止 MySQL/MariaDB(3306)'
fi

read -p '是否要允許 PostgreSQL(5432)? (y/n)' postgresql
if [[ "$postgresql" = 'y' ]]; then
	sudo firewall-cmd --permanent --add-service=postgresql
else
    sudo firewall-cmd --permanent --remove-service=postgresql
	echo '禁止 PostgreSQL(5432)'
fi

read -p "是否要允許 SMTP(25)? (y/n): " smtp
if [ "$smtp" = 'y' ]; then
	sudo firewall-cmd --permanent --add-service=smtp
else
    sudo firewall-cmd --permanent --remove-service=smtp
	echo '禁止 SMTP(25)'
fi

read -p '是否要額外輸入允許的 Port? (y/n):' ports
if [ "$ports" = 'y' ]; then
    while true; do
        read -p '請輸入 port (直接按 Enter 離開):' port
        if [ "$port" = "" ]; then
            break;
        fi
        if [ "$port" -gt 65535 ] || [ "$port" -lt 1 ]; then
            echo '數值必須界於 1~65535'
        else
            sudo firewall-cmd --permanent --add-port=$port/tcp
            echo "允許 $port"
        fi
    done
fi

echo '以下為執行的結果清單'
sudo firewall-cmd --permanent --list-all
read -p '按下 Enter 重載防火牆...'
sudo firewall-cmd --reload
