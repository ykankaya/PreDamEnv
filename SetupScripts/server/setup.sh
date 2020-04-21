#!/bin/sh
sudo apt-get -y update
sudo apt-get -y upgrade

currentusername=$(whoami)

sudo apt-get -y install pass

mkdir ~/.ssh/
mkdir ~/Data/

sudo mount /dev/sda1 ~/Data

#keys and shit, stored on seperate flash drive that should be inserted on setup
cp ~/Data/id_rsa.pub ~/.ssh/authorized_keys
sudo chmod 600 ~/.ssh/authorized_keys
#the key is actually used only for aria2 token
gpg2 --import ~/Data/vanya@server.com.asc
#trust and shit
gpg2 --edit-key "vanya@server.com" trust quit
#unix pass
cp -r ~/Data/password-store-server ~/.password-store/
#user passwords
sudo passwd root
sudo passwd $currentusername

sudo apt-get -y install apt-utils
sudo apt-get -y install neofetch
sudo apt-get -y install cron
sudo apt-get -y install network-manager
sudo apt-get -y install cron-apt
sudo apt-get -y install fish
sudo apt-get -y install fail2ban
sudo apt-get -y install iptables

nmcli connection mod "docker0" ipv4.dns "51.254.25.115 185.121.170.176 188.165.200.156 52.174.55.168"
nmcli connection mod "Wired connection 1" ipv4.dns "51.254.25.115 185.121.170.176 188.165.200.156 52.174.55.168"

# should replace this with -i
sudo sed 's/#\?\(PermitRootLogin\s*\).*$/\1 no/' /etc/ssh/sshd_config > sshd.txt
sudo mv -f sshd.txt /etc/ssh/sshd_config
sudo sed 's/#\?\(X11Forwarding\s*\).*$/\1 no/' /etc/ssh/sshd_config > sshd.txt
sudo mv -f sshd.txt /etc/ssh/sshd_config
sudo sed 's/#\?\(PermitEmptyPasswords \s*\).*$/\1 no/' /etc/ssh/sshd_config > sshd.txt
sudo mv -f sshd.txt /etc/ssh/sshd_config
sudo sed 's/#\?\(MaxAuthTries \s*\).*$/\1 3/' /etc/ssh/sshd_config > sshd.txt
sudo mv -f sshd.txt /etc/ssh/sshd_config
sudo sed 's/#\?\(IgnoreRhosts \s*\).*$/\1 yes/' /etc/ssh/sshd_config > sshd.txt
sudo mv -f sshd.txt /etc/ssh/sshd_config
sudo sed '$ a Protocol 2' /etc/ssh/sshd_config > sshd.txt
sudo mv -f sshd.txt /etc/ssh/sshd_config
sudo sed 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config > sshd.txt
sudo mv -f sshd.txt /etc/ssh/sshd_config
sudo sed 's/#\?\(PubkeyAuthentication\s*\).*$/\1 yes/' /etc/ssh/sshd_config > sshd.txt
sudo mv -f sshd.txt /etc/ssh/sshd_config

sudo apt-get -y install docker.io
sudo apt-get -y install docker-compose
sudo usermod -aG docker $currentusername
sudo systemctl enable docker

sudo apt-get install tor privoxy tor-geoipdb
sudo apt-get install obfs4proxy
sudo apt-get install proxychains
sudo sh -c "echo 'SocksPort 9050' >> /etc/tor/torrc"
sudo sh -c "echo 'ORPort auto' >> /etc/tor/torrc"
sudo sh -c "echo 'BridgeRelay 1' >> /etc/tor/torrc"
sudo sh -c "echo 'Exitpolicy reject *:*' >> /etc/tor/torrc"
sudo sh -c "echo 'ExtORPort auto' >> /etc/tor/torrc"
sudo sh -c "echo 'ServerTransportPlugin obfs4 exec /usr/bin/obfs4proxy' >> /etc/tor/torrc"
sudo systemctl enable tor

# sudo sh -c 'echo "MAILON=\"always\"" >> /etc/cron-apt/config'
# sudo sh -c 'echo "MAILTO=\"scvhapps@gmail.com\"" >> /etc/cron-apt/config'

sudo sh -c "echo \"@reboot root mount /dev/sda1 /home/$currentusername/Data\" >> /etc/crontab"

sudo systemctl enable cron

sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo systemctl enable fail2ban

sudo chsh -s /usr/bin/fish $currentusername
sudo chsh -s /usr/bin/fish root

rm -rf ~/.password-store/
gpg2 --delete-key "vanya@server.com"

sudo reboot
