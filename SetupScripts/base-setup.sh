#!/bin/sh

os=$(lsb_release -is)
user=$(whoami)

case $os in
	Arch)
		sudo pacman -Syu
		;;

	Debian)
		sudo apt-get -y update
		sudo apt-get -y install apt-utils
		sudo apt-get -y upgrade
		;;

	Ubuntu)
		sudo apt-get -y update
		sudo apt-get -y install apt-utils
		sudo apt-get -y upgrade
		;;
esac

mkdir ~/Go
mkdir ~/Go/bin
mkdir ~/bin/
mkdir ~/Maildir
mkdir ~/Maildir/Gmail/
mkdir ~/.emacs.d/
touch ~/.emacs.d/w3m-session
mkdir ~/.cargo/
mkdir ~/.cargo/bin/
mkdir ~/aria2
touch ~/aria2/session

mkdir ~/Music

echo "api_key: " >> ~/.meetup-clirc
chmod 600 .meetup-clirc

sudo usermod -aG tty $user
