#!/bin/sh

os=$(lsb_release -is)
user=$(whoami)

#restore dotfiles
case $os in
	Arch)
		yaourt -S --noconfirm yadm-git
		;;

	Debian)
		sudo apt-get -y install yadm
		;;

	Fedora)
		sudo dnf -y copr enable thelocehiliosan/yadm
		sudo dnf -y install yadm
		;;

	Ubuntu)
		sudo apt-get -y install yadm
		;;
esac
cd ~/
yadm clone https://github.com/schvabodka-man/Dotfiles.git
sudo cp .gitignore_global /etc/gitconfigs/.gitignore_global

# sudo sh -c "echo 'focus_password      yes' >> /etc/slim.conf"
# sudo sh -c "echo \"default_user        $user\" >> /etc/slim.conf"
# sudo sh -c "sed -i 's/\/bin\/bash -login \/etc\/X11\/Xsession %session/\/bin\/bash - ~\/.xinitrc %session/g' /etc/slim.conf"
# sudo cp -r /usr/share/slim/themes/debian-softwaves/ /usr/share/slim/themes/custom
# sudo rm /usr/share/slim/themes/custom/background.png
# sudo cp /home/$user/.wallpapers/space-flat-2.png /usr/share/slim/themes/default/background.jpg
# sudo sh -c "sed -i 's/current_theme       debian-softwaves/current_theme       custom/g' /etc/slim.conf"
# # i'm using i3lock so no
# sudo sh -c "echo 'daemon      no' >> /etc/slim.conf"

#not used anymore
# mkdir ~/.config/mpd/playlists
# touch ~/.config/mpd/mpd.db
# touch ~/.config/mpd/mpd.log
# touch ~/.config/mpd/mpd.pid
# touch ~/.config/mpd/mpd.state
# touch ~/.config/mpd/sticker.sql
