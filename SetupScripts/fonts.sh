#!/bin/sh
#fonts
os=$(lsb_release -is)

case $os in
	Arch)
		sudo pacman -Sy otf-fira-sans
		sudo pacman -Sy otf-fira-mono
		sudo pacman -Sy ttf-fira-mono
		sudo pacman -Sy ttf-fira-sans
		sudo pacman -Sy awesome-terminal-fonts
		yaourt -S --noconfirm otf-font-awesome
		yaourt -S --noconfirm ttf-font-awesome
		;;

	Debian)
		#sudo apt-get -y install fonts-firacode
		sudo apt-get -y install fonts-font-awesome
		cd ~/bin
		mkdir firafont
		cd firafont
		wget https://github.com/mozilla/Fira/archive/master.zip
		unzip master.zip
		sudo mkdir -p /usr/share/fonts/truetype/fira
		sudo cp Fira-master/ttf/* /usr/share/fonts/truetype/fira
		;;

	Fedora)
		sudo dnf -y install mozilla-fira-mono-fonts
		sudo dnf -y install mozilla-fira-sans-fonts
		sudo dnf -y install mozilla-fira-fonts-common
		sudo dnf -y install fontawesome-fonts
		;;

	Ubuntu)
		#sudo apt-get -y install fonts-firacode
		sudo apt-get -y install fonts-font-awesome
		cd ~/bin
		mkdir firafont
		cd firafont
		wget https://github.com/mozilla/Fira/archive/master.zip
		unzip master.zip
		sudo mkdir -p /usr/share/fonts/truetype/fira
		sudo cp Fira-master/ttf/* /usr/share/fonts/truetype/fira
		;;
esac

#some powerline
cd ~/bin/
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh

#case $os in
#	Ubuntu|Debian)
#		sudo mkdir /usr/share/fonts/truetype/furamono
#		sudo cp ~/.local/share/fonts/FuraMono-*  /usr/share/fonts/truetype/furamono
#		;;
#esac

case $os in
	Arch)
		sudo pacman -Sy powerline-fonts
		;;

	Debian)
		sudo apt-get -y install fonts-powerline
		;;

	Fedora)
		sudo dnf -y install powerline-fonts
		;;

	Ubuntu)
		sudo apt-get -y install fonts-powerline
esac
