#!/bin/sh
os=$(lsb_release -is)

case $os in
	Arch)
		sudo pacman --noconfirm -S clang
		sudo pacman --noconfirm -S gcc
		sudo pacman --noconfirm -S cmake
		sudo pacman --noconfirm -S automake
		sudo pacman --noconfirm -S autoconf
		sudo pacman --noconfirm -S make
		sudo pacman --noconfirm -S sudo
		sudo pacman --noconfirm -S gperf
		sudo pacman --noconfirm -S bison
		;;

	Debian)
		sudo apt-get -y install clang
		sudo apt-get -y install gcc
		sudo apt-get -y install cmake
		sudo apt-get -y install automake
		sudo apt-get -y install autoconf
		sudo apt-get -y install make
		sudo apt-get -y install sudo
		sudo apt-get -y install gperf
		sudo apt-get -y install bison
		;;

	Fedora)
		sudo dnf -y install clang
		sudo dnf -y install gcc
		sudo dnf -y install cmake
		sudo dnf -y install automake
		sudo dnf -y install autoconf
		sudo dnf -y install make
		sudo dnf -y install sudo
		sudo dnf -y install gperf
		sudo dnf -y install bison
		;;

	Ubuntu)
		sudo apt-get -y install clang
		sudo apt-get -y install gcc
		sudo apt-get -y install cmake
		sudo apt-get -y install automake
		sudo apt-get -y install autoconf
		sudo apt-get -y install make
		sudo apt-get -y install sudo
		sudo apt-get -y install gperf
		sudo apt-get -y install bison
		;;
esac
