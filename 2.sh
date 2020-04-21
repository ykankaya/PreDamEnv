#!/bin/bash
echo '============= 登入安全設定 ==============='
echo '1. 建立使用者'
read -p '請輸入使用者名稱：' username
sudo adduser $username
echo '請輸入密碼：'
sudo passwd $username
echo ''
echo '2. 加入 wheel 群組'
sudo usermod -aG wheel $username
sudo getent group wheel
read -p '按下 Enter 繼續...'
echo ''
echo '3. 檢查 %wheel  ALL=(ALL) ALL 是否取消註解'
read -p '按下 Enter 進入編輯...'
sudo visudo
echo ''
echo '4. 只讓 wheel 群組的使用者無法使用 su 來切換成 root'
echo '取消此行註解 => auth  required  pam_wheel.so use_uid'
read -p '按下 Enter 進入編輯...'
sudo vim /etc/pam.d/su
read -p '將 SU_WHEEL_ONLY yes 加入 /etc/login.defs 檔尾'
sudo vim /etc/login.defs
echo ''
echo '5. 設定金鑰，請依部驟執行'
echo '5.1 確定伺服器的 root 已經有設定密碼'
echo '5.2 本機建立金鑰 ssh-keygen -t rsa'
echo '5.3 複製本機的 ~/.ssh/id_rsa.pub 內容'
echo '到伺服器的 ~/.ssh/authorized_keys 檔案內'
echo "5.4 並且於本機執行登入測試成功: ssh $username@伺服器IP或網址"
echo '5.5 才能修改: sudo vi /etc/ssh/sshd_config'
echo '------ 修改以下內容 ------'
echo '#PermitRootLogin yes 改成 PermitRootLogin no'
echo '#PasswordAuthentication yes 改成 PasswordAuthentication no'
echo '#PermitEmptyPasswords no 改成 PermitEmptyPasswords no'
echo '------------------------'
echo '5.6 完成後重啟 SSH: systemctl restart sshd'
