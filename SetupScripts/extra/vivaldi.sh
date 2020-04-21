#!/bin/sh

os=$(lsb_release -is)

vervivvaldi=1.12.955.48-1
case $os in
	Arch)
		yaourt -S --noconfirm vivaldi
		yaourt -S --noconfirm vivaldi-ffmpeg-codecs
		;;

	Debian)
		cd ~/bin/
		mkdir vivaldi
		cd vivaldi
		wget "https://downloads.vivaldi.com/stable/vivaldi-stable_$vervivvaldi_amd64.deb"
		sudo dpkg -i "vivaldi-stable_$vervivvaldi_amd64.deb"
		;;

	Fedora)
		cd ~/bin/
		mkdir vivaldi
		cd vivaldi
		wget "https://downloads.vivaldi.com/stable/vivaldi-stable-$vervivvaldi.x86_64.rpm"
		sudo dnf install "vivaldi-stable-$vervivvaldi.x86_64.rpm"
		;;

	Ubuntu)
		cd ~/bin/
		mkdir vivaldi
		cd vivaldi
		wget "https://downloads.vivaldi.com/stable/vivaldi-stable_$vervivvaldi_amd64.deb"
		sudo dpkg -i "vivaldi-stable_$vervivvaldi_amd64.deb"
		;;
esac
