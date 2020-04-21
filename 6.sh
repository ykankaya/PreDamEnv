#!/bin/bash
echo '============= Nginx 安裝及設定 ==============='
echo '更新 yum'
sudo yum -y update
echo '安裝 EPEL 擴充套件庫'
sudo yum -y install epel-release
echo '安裝 Nginx'
sudo yum -y install nginx
echo '啟動 Nginx'
sudo systemctl start nginx
echo '設定為開機時啟動'
sudo systemctl enable nginx
echo '顯示目前 Nginx 伺服器狀態'
sudo systemctl status nginx

echo '將使用者加入 nginx 群組'
read -p '請輸入使用者名稱：' username
sudo usermod -aG nginx $username

echo '將 /usr/share/nginx 之下的目錄及檔案擁有者改為 nginx:nginx'
sudo cd /usr/share/nginx
sudo chown -R nginx:nginx *

echo '將 /usr/share/nginx/html 目錄及其下的子目錄加入群組寫入的權限'
sudo cd /usr/share/nginx
sudo chmod -R g+w html

echo '設定 SELinux 權限'
chcon -Rv --type=httpd_sys_content_t /usr/share/nginx
ls -Z /usr/share/nginx
read -p '請確認是否有 httpd_sys_content_t 屬性'
