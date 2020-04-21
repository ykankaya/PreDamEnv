#!/bin/bash
echo '============= 安裝資料庫 ==============='

# MariaDB
read -p '是否要安裝 MariaDB? (y/n):' mariadb
if [[ "$mariadb" = "y" ]]; then
	echo '安裝 MariaDB'
	sudo yum install mariadb-server
	echo '啟動 MariaDB'
	sudo systemctl start mariadb
	echo '設定為開機時啟動'
	sudo systemctl enable mariadb
	echo '目前運作狀態'
	sudo systemctl status mariadb
	echo '執行安全腳本'
	sudo mysql_secure_installation
	echo '完成確認'
	mysqladmin -u root -p version
fi

# MySQL
read -p '是否要安裝 MySQL? (y/n):' mysql
if [[ "$mysql" = "y" ]]; then
	echo '下載 MySQL 8.0'
    cd /opt
    sudo wget https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm

    echo '確認 MD5 檢查碼是否相同'
    md5=($(md5sum mysql80-community-release-el7-1.noarch.rpm))
    if [[ "$md5" = "739dc44566d739c5d7b893de96ee6848" ]]; then
    	echo '檢查碼正確！'
    else
     	echo $md5
    	echo '檢查碼不正確，檔案可能有問題！'
    fi

    echo '安裝 mysql 倉庫到 yum'
    sudo rpm -ivh mysql80-community-release-el7-1.noarch.rpm

    echo '安裝 MySQL'
    sudo yum -y install mysql-server

    echo '啟動 MySQL'
    sudo systemctl start mysqld
    echo '設定為開機時啟動'
    sudo systemctl enable mysqld
    echo '目前運作狀態'
    sudo systemctl status mysqld

    echo '執行安全腳本'
    sudo mysql_secure_installation
    echo '完成確認'
	mysqladmin -u root -p version
fi

# PostgreSQL
read -p '是否要安裝 PostgreSQL? (y/n):' postgresql
if [[ "$postgresql" = "y" ]]; then
	echo '安裝 PostgreSQL 伺服器'
    sudo yum install postgresql-server
    echo '安裝 PostgreSQL 客戶端工具'
    sudo yum install postgresql

    echo '初始化資料庫'
    sudo postgresql-setup initdb

    echo '啟動 PostgreSQL'
    sudo systemctl start postgresql
    echo '設定為開機時啟動'
    sudo systemctl enable postgresql
    echo '目前運作狀態'
    sudo systemctl status postgresql
fi
