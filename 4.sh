#!/bin/bash
echo '============= fail2ban SSH 設定 ==============='
echo '安裝 fail2ban'
sudo yum -y install fail2ban

echo '設定檔內容如下，請複製以下內容'
echo '####################'
echo '[DEFAULT]'
echo '# Ban hosts for 30 days(259200秒), -1 表示永久'
echo 'bantime = 259200'
echo '# 限定時間內 1 天(86400秒)'
echo 'findtime = 86400'
echo '# 重試的次數'
echo 'maxretry = 3'
echo ''
echo '[sshd]'
echo 'enabled = true'
echo 'banaction = iptables-multiport'
echo ''
echo '# 針對 ssh ddos 攻擊'
echo '[ssh-ddos]'
echo 'enabled = true'
echo 'port = ssh,sftp'
echo 'filter = sshd-ddos'
echo 'logpath = /var/log/messages'
echo '####################'
read -p '按下 Enter 建立 /etc/fail2ban/jail.local 並貼上內容'
sudo vim /etc/fail2ban/jail.local

echo '啟動 fail2ban'
sudo systemctl start fail2ban
sudo systemctl enable fail2ban
echo '查看 fail2ban 狀態'
sudo systemctl status fail2ban
echo '設定完成！'
echo '看 log 請輸入：tail -F /var/log/fail2ban.log'
echo '看執行狀態請輸入：fail2ban-client status sshd'
