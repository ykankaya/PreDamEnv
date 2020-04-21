#!/bin/sh

os=$(lsb_release -is)

#gui apps
case $os in
	Arch)
		sudo pacman -S --noconfirm calibre
		sudo pacman -S --noconfirm emacs
		sudo pacman -S --noconfirm xfce4-terminal
		sudo pacman -S --noconfirm xfce4-screenshooter
		sudo pacman -S --noconfirm pidgin
		sudo pacman -S --noconfirm gimp
		sudo pacman -S --noconfirm qutebrowser
		sudo pacman -S --noconfirm uget
		sudo pacman -S --noconfirm thunar
		sudo pacman -S --noconfirm zathura
		;;

	Debian)
		sudo apt-get -y install calibre
		sudo apt-get -y install emacs
		sudo apt-get -y install xfce4-terminal
		sudo apt-get -y install xfce4-screenshooter
		sudo apt-get -y install pidgin
		sudo apt-get -y install uget
		sudo apt-get -y install gimp
		sudo apt-get -y install thunar
		sudo apt-get -y install zathura
		;;

	Fedora)
		sudo dnf -y install calibre
		sudo dnf -y install emacs
		sudo dnf -y install xfce4-terminal
		sudo dnf -y install xfce4-screenshooter
		sudo dnf -y install pidgin
		sudo dnf -y install uget
		sudo dnf -y install gimp
		sudo dnf -y install qutebrowser
		sudo dnf -y install thunar
		sudo dnf -y install zathura
		;;

	Ubuntu)
		sudo apt-get -y install calibre
		sudo apt-get -y install emacs
		sudo apt-get -y install xfce4-terminal
		sudo apt-get -y install xfce4-screenshooter
		sudo apt-get -y install pidgin
		sudo apt-get -y install uget
		sudo apt-get -y install gimp
		sudo apt-get -y install thunar
		sudo apt-get -y install zathura
		;;
esac
case $os in
	Fedora)
		sudo dnf -y install calibre purple-libsteam
		sudo dnf -y install calibre purple-telegram
		sudo dnf -y install calibre purple-discord
		sudo dnf -y install calibre purple-hangouts
		sudo dnf -y install calibre purple-facebook
		sudo dnf -y install calibre purple-skypeweb
		;;

	Arch)
		sudo pacman -S --noconfirm purple-facebook
		sudo pacman -S --noconfirm purple-skypeweb
		;;
esac
case $os in
	Debian|Ubuntu)
		# cd ~/bin
		# mkdir qutebrowser
		# cd qutebrowser
		# wget https://qutebrowser.org/python3-pypeg2_2.15.2-1_all.deb
		# wget https://github.com/qutebrowser/qutebrowser/releases/download/v1.0.3/qutebrowser_1.0.3-2_all.deb
		# sudo apt -y install ./python3-pypeg2_*_all.deb
		# sudo apt -y install ./qutebrowser_*_all.deb
		sudo -H pip3 install qutebrowser
		sudo apt-get install python3-pyqt5.*
		;;
	
	Fedora)
		sudo dnf -y install qutebrowser
		;;

	Arch)
		sudo pacman -S --noconfirm qutebrowser
		;;
esac
#for development
case $os in
	Arch)
		sudo pacman -S --noconfirm firefox
		sudo pacman -S --noconfirm chromium
		;;

	Debian)
		sudo apt-get -y install firefox
		sudo apt-get -y install chromium-browser
		;;

	Fedora)
		sudo dnf -y install firefox
		sudo dnf -y install chromium
		;;

	Ubuntu)
		sudo apt-get -y install firefox
		sudo apt-get -y install chromium-browser
		;;
esac
case $os in
	Debian)
		sudo apt-get -y install gitk
		;;

	Fedora)
		sudo dnf -y install gitk
		;;

	Ubuntu)
		sudo apt-get -y install gitk
		;;
esac
case $os in
	Arch)
		sudo pacman -S --noconfirm libreoffice-fresh
		sudo pacman -S --noconfirm libreoffice-fresh-ru
		;;

	Debian)
		sudo apt-get -y install libreoffice
		sudo apt-get -y install libreoffice-l10n-ru
		sudo apt-get -y install libreoffice-lightproof-ru-ru
		;;

	Fedora)
		sudo dnf -y install libreoffice
		sudo dnf -y install libreoffice-langpack-ru
		;;

	Ubuntu)
		sudo apt-get -y install libreoffice
		sudo apt-get -y install libreoffice-l10n-ru
		sudo apt-get -y install libreoffice-lightproof-ru-ru
		;;
esac
#wine with stuff
case $os in
	Arch)
		sudo pacman -S --noconfirm playonlinux
		;;

	Debian)
		sudo apt-get -y install playonlinux
		;;

	Fedora)
		sudo dnf -y install http://rpm.playonlinux.com/playonlinux-yum-4-1.noarch.rpm
		sudo dnf -y install playonlinux
		;;

	Ubuntu)
		sudo apt-get -y install playonlinux
		;;
esac

sudo systemctl disable lightdm
# cd ~/bin/
# mkdir palemooninstaller
# cd palemooninstaller
# wget https://linux.palemoon.org/datastore/release/pminstaller-0.2.3.tar.bz2
# tar xjvf pminstaller-*
# ./pminstaller.sh

# cd ~/bin/
# git clone git://git.suckless.org/st
# cd st
# rm config.h
# cp ~/.config/st/config.h ./
# make

#termite
cd ~/bin/
git clone --recursive https://github.com/thestinger/termite.git
git clone https://github.com/thestinger/vte-ng.git

sudo apt-get install -y \
	 g++ \
	 libgtk-3-dev \
	 gtk-doc-tools \
	 gnutls-bin \
	 valac \
	 intltool \
	 libpcre2-dev \
	 libglib3.0-cil-dev \
	 libgnutls28-dev \
	 libgirepository1.0-dev \
	 libxml2-utils \
	 gperf
echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd vte-ng
./autogen.sh
make
sudo make install
cd ..
cd termite
make
sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x
sudo ln -s /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite
