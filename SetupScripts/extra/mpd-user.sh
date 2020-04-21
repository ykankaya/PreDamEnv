#!/bin/sh
thisuser=$(whoami)
sudo usermod -aG pulse,pulse-access mpd
sudo passwd mpd
sudo usermod -aG sudo mpd
sudo --user=mpd "echo \"chmod 777 /home/$thisuser/Music\" | bash"
sudo gpasswd -d mpd sudo
