#!/bin/sh
os=$(lsb_release -is)

case $os in
	Arch)
		sudo pacman --noconfirm -S libpng
		sudo pacman --noconfirm -S zlib
		sudo pacman --noconfirm -S poppler
		sudo pacman --noconfirm -S poppler-glib
		sudo pacman --noconfirm -S poppler-data
		sudo pacman --noconfirm -S libxft
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
		sudo apt-get -y install libpng-dev
		sudo apt-get -y install zlib1g-dev
		sudo apt-get -y install libpoppler-glib-dev
		sudo apt-get -y install libpoppler-private-dev
		sudo apt-get -y install libxft-dev
		sudo apt-get -y install libxft2-dbg
		sudo apt-get -y install clang
		sudo apt-get -y install gcc
		sudo apt-get -y install cmake
		sudo apt-get -y install automake
		sudo apt-get -y install autoconf
		sudo apt-get -y install make
		sudo apt-get -y install sudo
		sudo apt-get -y install gperf
		sudo apt-get -y install bison
		sudo apt-get -y install gstreamer1.0-plugins-{bad,base,good,ugly}
		#stumpwm
		sudo apt-get install libfixposix0 libfixposix-dev
		;;

	Fedora)
		sudo dnf -y install zlib-devel
		sudo dnf -y install poppler-glib-devel
		sudo dnf -y install libpng-devel
		sudo dnf -y install libxft
		sudo dnf -y install libxft-devel
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
		sudo apt-get -y install libpng-dev
		sudo apt-get -y install zlib1g-dev
		sudo apt-get -y install libxft-dev
		sudo apt-get -y install libpoppler-glib-dev
		sudo apt-get -y install libpoppler-private-dev
		sudo apt-get -y install libxft-dev
		sudo apt-get -y install libxft2-dbg
		sudo apt-get -y install clang
		sudo apt-get -y install gcc
		sudo apt-get -y install cmake
		sudo apt-get -y install automake
		sudo apt-get -y install autoconf
		sudo apt-get -y install make
		sudo apt-get -y install sudo
		sudo apt-get -y install gperf
		sudo apt-get -y install bison
		sudo apt-get -y install gstreamer1.0-plugins-{bad,base,good,ugly}
		#for stumpwm notifications
		sudo apt-get install libfixposix0 libfixposix-dev
		;;
esac
#emacs pdf utils
case $os in
	Arch)
		sudo pacman --noconfirm -S libpng
		sudo pacman --noconfirm -S zlib
		sudo pacman --noconfirm -S poppler
		sudo pacman --noconfirm -S poppler-glib
		sudo pacman --noconfirm -S poppler-data
		;;

	Debian)
		sudo apt-get -y install libpng-dev
		sudo apt-get -y install zlib1g-dev
		sudo apt-get -y install libpoppler-glib-dev
		sudo apt-get -y install libpoppler-private-dev
		sudo apt-get install clisp-module-clx cl clx-sbcl
		sudo apt-get install libclxclient3 libclxclient-dev
		;;

	Fedora)
		sudo dnf -y install zlib-devel
		sudo dnf -y install poppler-glib-devel
		sudo dnf -y install libpng-devel
		;;

	Ubuntu)
		sudo apt-get -y install libpng-dev
		sudo apt-get -y install zlib1g-dev
		sudo apt-get -y install libpoppler-glib-dev
		sudo apt-get -y install libpoppler-private-dev
		sudo apt-get install clisp-module-clx cl clx-sbcl
		sudo apt-get install libclxclient3 libclxclient-dev
		;;
esac
#imlib for compiling icat
case $os in
	Arch)
		sudo pacman --noconfirm -S
		;;

	Debian)
		sudo apt-get -y install libimlib2-dev
		;;

	Fedora)
		sudo dnf -y install imlib2-devel
		;;

	Ubuntu)
		sudo apt-get -y install libimlib2-dev
		;;
esac
#for ls with icons
case $os in
	Arch)
		sudo pacman --noconfirm -S gettext
		sudo pacman --noconfirm -S texinfo
		sudo pacman --noconfirm -S texi2html
		;;

	Debian)
		sudo apt-get -y install gettext
		sudo apt-get -y install autopoint
		sudo apt-get -y install texinfo
		sudo apt-get -y install texi2html
		;;

	Fedora)
		sudo dnf -y install gettext-devel
		sudo dnf -y install texinfo
		sudo dnf -y install texi2html
		;;

	Ubuntu)
		sudo apt-get -y install gettext
		sudo apt-get -y install autopoint
		sudo apt-get -y install texinfo
		sudo apt-get -y install texi2html
		;;
esac
