#!/bin/sh

os=$(lsb_release -is)
user=$(whoami)

case $os in
	Arch)
		sudo pacman --noconfirm -S docker
		sudo pacman --noconfirm -S docker-compose
		sudo pacman --noconfirm -S docker-machine
		sudo usermod -aG docker $user
		sudo systemctl enable docker
		;;

	Debian)
		sudo apt-get -y install docker.io
		sudo apt-get -y install docker-doc
		sudo apt-get -y install docker-compose
		sudo usermod -aG docker $user
		sudo systemctl enable docker
		;;

	Fedora)
		sudo dnf -y install docker
		sudo dnf -y install docker-compose
		sudo usermod -aG docker $user
		sudo systemctl enable docker
		;;

	Ubuntu)
		sudo apt-get -y install docker.io
		sudo apt-get -y install docker-doc
		sudo apt-get -y install docker-compose
		sudo usermod -aG docker $user
		sudo systemctl enable docker
		;;
esac