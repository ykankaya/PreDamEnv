#!/bin/bash
echo '============= 其他安裝 ==============='

# 移除 Postfix 郵件伺服器
read -p '是否要移除 Postfix 郵件伺服器? (y/n): ' rmpostfix
if [[ "$rmpostfix" = 'y' ]]; then
	sudo systemctl stop postfix
	sudo systemctl disable postfix
	sudo yum remove postfix
	echo '移除 Postfix 郵件伺服器完成！'
fi

# 安裝 OpenJDK
read -p '是否要安裝 OpenJDK? (y/n): ' openjdk
if [[ "$openjdk" = 'y' ]]; then
	sudo yum install java-1.8.0-openjdk-devel
	echo '確認安裝成功'
	java -version
	
	echo '如果要切換 JDK 版本，指令如下：'
	echo 'sudo alternatives --config java'
fi

# 安裝 Oracle JDK
read -p '是否要安裝 Oracle JDK? (y/n): ' jdk
if [[ "$jdk" = 'y' ]]; then
	echo '切換目錄到 /opt'
	cd /opt
	echo '安裝 wget'
	sudo yum -y install wget
	echo '下載 jdk-8u181-linux-x64.rpm'
	sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.rpm"
	echo '安裝 jdk-8u181-linux-x64.rpm'
	sudo yum localinstall jdk-8u181-linux-x64.rpm
	echo '確認安裝成功'
	java -version

	echo '如果要切換 JDK 版本，指令如下：'
	echo 'sudo alternatives --config java'
fi

# 安裝 Dropbox
read -p '是否要安裝 Dropbox? (y/n): ' dropbox
if [[ "$dropbox" = 'y' ]]; then
    echo 'Dropbox 會安裝在使用者家目錄，目前的使用者帳號為'
    whoami
	
	echo '下載並解壓縮主程式到家目錄'
	cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
	
	echo '下載控制腳本(請確認已安裝 Python)'
	cd ~/.dropbox-dist
	curl -Lo dropbox.py https://www.dropbox.com/download?dl=packages/dropbox.py
	echo '設定腳本有執行的權限'
	sudo chmod +x dropbox.py
	echo '建立副本到指令目錄(/usr/local/bin)，並且改名為 dropbox'
	sudo ln dropbox.py /usr/local/bin/dropbox

	echo '啟動 Dropbox Demean'
	~/.dropbox-dist/dropboxd
	
	echo '排除不需要同步的目錄，指令如下：'
	echo 'dropbox exclude add 目錄名稱1 目錄名稱2 目錄名稱3 ... '
	echo '查看有哪些目錄被排除同步'
	echo 'dropbox exclude list'

	echo '使用排程在開機時啟動（常駐）'
	echo '複製這行: @reboot ~/.dropbox-dist/dropboxd'
	read -p '貼到排程器中，按 Enter 進入編輯...'
	crontab -e
fi

# 安裝 Git
read -p '是否要安裝 Git? (y/n): ' git
if [[ "$git" = 'y' ]]; then
	sudo yum -y install git
	
	echo '確認安裝'
	git --version
fi
