#!/bin/sh
os=$(lsb_release -is)

case $os in
	Arch)
		sudo pacman --noconfirm -S diffutils
		sudo pacman --noconfirm -S gettext
		sudo pacman --noconfirm -S yajl
		sudo pacman --noconfirm -S git
		cd ~/bin/
		git clone https://aur.archlinux.org/package-query.git
		cd package-query/
		sudo pacman -S --noconfirm pkg-config
		sudo pacman -S --noconfirm fakeroot
		makepkg -sci
		cd ~/bin/
		git clone https://aur.archlinux.org/yaourt.git
		cd yaourt
		makepkg -sci
		yaourt -Syu
		;;

	Fedora)
		sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
		sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
		;;
esac