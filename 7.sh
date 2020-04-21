#!/bin/bash
echo '============= PHP-FPM 安裝及設定 ==============='
echo '安裝 EPEL 倉庫'
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
echo '安裝 IUS 倉庫'
sudo yum install https://centos7.iuscommunity.org/ius-release.rpm
echo '安裝 php72u-fpm php72u-common php72u-cli php72u-mbstring php72u-pdo php72u-opcache php72u-sodium php72u-xml'
sudo yum -y install php72u-fpm php72u-common php72u-cli php72u-mbstring php72u-pdo php72u-opcache php72u-sodium php72u-xml

read -p '是否要安裝 php72u-mysqlnd 套件? (y/n):' mysqlnd
if [[ "$mysqlnd" = "y" ]]; then
	sudo yum -y install php72u-mysqlnd
fi

read -p '是否要安裝 php72u-pgsql 套件? (y/n):' pgsql
if [[ "$pgsql" = "y" ]]; then
	sudo yum -y install php72u-pgsql
fi

echo '修改 /etc/php-fpm.d/www.conf'
echo '修改成以下內容：'
echo 'user = nginx'
echo 'group = nginx'
echo ''
echo '以下 2 選 1'
echo 'listen = 127.0.0.1:9000'
echo 'listen = /var/run/php-fpm/php-fpm.sock'
echo ''
echo 'listen.owner = nginx  # 拿掉註解'
echo 'listen.group = nginx  # 拿掉註解'
echo 'listen.mode = 0660  # 拿掉註解'
read -p '按 Enter 進入編輯...'
sudo vim /etc/php-fpm.d/www.conf

echo '啟動 PHP-FPM'
sudo systemctl start php-fpm
echo '設定為開機時啟動'
sudo systemctl enable php-fpm
echo '顯示目前 php-fpm 伺服器狀態'
sudo systemctl status php-fpm
