#!/bin/sh

os=$(lsb_release -is)

case $os in
	Arch)
		sudo pacman --noconfirm -S gnupg
		sudo pacman --noconfirm -S consolekit
		sudo pacman --noconfirm -S pwgen
		;;

	Debian)
		sudo apt-get -y install gnupg2
		sudo apt-get -y install gnupg
		sudo apt-get -y install consolekit
		sudo apt-get -y install pwgen
		;;

	Fedora)
		sudo dnf -y install gnupg2
		sudo dnf -y install gnupg
		sudo dnf -y install consolekit
		sudo dnf -y install pwgen
		;;

	Ubuntu)
		sudo apt-get -y install gnupg2
		sudo apt-get -y install gnupg
		sudo apt-get -y install consolekit
		sudo apt-get -y install pwgen
		;;
esac

case $os in
	Arch)
		sudo pacman --noconfirm -S the_silver_searcher
		sudo pacman --noconfirm -S hunspell
		sudo pacman --noconfirm -S hunspell-en
		yaourt -S --noconfirm hunspell-ru
		;;

	Debian)
		sudo apt-get -y install silversearcher-ag
		sudo apt-get -y install hunspell
		#russian disctionary for hunspellb
		sudo apt-get -y install hunspell-ru
		;;

	Fedora)
		sudo dnf -y install the_silver_searcher
		sudo dnf -y install hunspell
		#russian disctionary for hunspell
		sudo dnf -y install hunspell-ru
		;;

	Ubuntu)
		sudo apt-get -y install silversearcher-ag
		sudo apt-get -y install hunspell
		#russian disctionary for hunspell
		sudo apt-get -y install hunspell-ru
		;;
esac

case $os in
	Arch)
		sudo pacman --noconfirm -S iptables ufw
		;;

	Debian)
		sudo apt-get -y install iptables ufw
		;;

	Fedora)
		sudo dnf -y install iptables ufw
		;;

	Ubuntu)
		sudo apt-get -y install iptables ufw
		;;
esac

case $os in
	Arch)
		sudo pacman --noconfirm -S syncthing
		;;

	Debian|Ubuntu)
		sudo apt-get -y install syncthing
		;;

	Fedora)
		sudo dnf -y install syncthing
		;;
esac

case $os in
	Arch)
		sudo pacman --noconfirm -S syncthing
		;;

	Debian|Ubuntu)
		sudo apt-get -y install syncthing
		;;

	Fedora)
		sudo dnf -y install syncthing
		;;
esac

#pretty neat but no rpm package
case $os in
	Arch)
		yaourt -S --noconfirm sct
		;;

	Debian|Ubuntu)
		sudo apt-get -y install sct
		;;

esac

case $os in
	Arch)
		sudo pacman --noconfirm -S ntp
		;;

	Debian|Ubuntu)
		sudo apt-get -y install ntp ntpstat
		;;

	Fedora)
		sudo dnf -y install ntp
		;;
esac

case $os in
	Arch)
		sudo pacman --noconfirm -S pass
		sudo pacman --noconfirm -S tmux
		sudo pacman --noconfirm -S git
		sudo pacman --noconfirm -S mercurial
		sudo pacman --noconfirm -S fossil
		sudo pacman --noconfirm -S feh
		sudo pacman --noconfirm -S shntool
		sudo pacman --noconfirm -S dunst
		sudo pacman --noconfirm -S cuetools
		sudo pacman --noconfirm -S curl
		sudo pacman --noconfirm -S wget
		sudo pacman --noconfirm -S inotify-tools
		sudo pacman --noconfirm -S htop
		sudo pacman --noconfirm -S cloc
		sudo pacman --noconfirm -S pandoc
		sudo pacman --noconfirm -S unrar
		sudo pacman --noconfirm -S compton
		sudo pacman --noconfirm -S xdotool
		sudo pacman --noconfirm -S unzip
		sudo pacman --noconfirm -S p7zip
		sudo pacman --noconfirm -S source-highlight
		sudo pacman --noconfirm -S colordiff
		sudo pacman --noconfirm -S xsel
		sudo pacman --noconfirm -S youtube-dl
		sudo pacman --noconfirm -S scrot
		sudo pacman --noconfirm -S mpv
		sudo pacman --noconfirm -S rtorrent
		sudo pacman --noconfirm -S octave
		sudo pacman --noconfirm -S dzen2
		sudo pacman --noconfirm -S cmus
		sudo pacman --noconfirm -S mplayer
		sudo pacman --noconfirm -S xorg-setxkbmap
		sudo pacman --noconfirm -S aria2
		sudo pacman --noconfirm -S i3lock
		sudo pacman --noconfirm -S udisks2 udiskie
		sudo pacman --noconfirm -S gawk mawk
		sudo pacman --noconfirm -S mediainfo
		sudo pacman --noconfirm -S tmux
		sudo pacman --noconfirm -S offlineimap
		sudo pacman --noconfirm -S ffmpeg
		sudo pacman --noconfirm -S w3m
		sudo pacman --noconfirm -S libnotify
		sudo pacman --noconfirm -S grabc
		sudo pacman --noconfirm -S xorg-xinit
		sudo pacman --noconfirm -S unclutter
		sudo pacman --noconfirm -S rofi
		yaourt -S --noconfirm neofetch
		yaourt -S --noconfirm stumpwm
		yaourt -S --noconfirm gitflow-avh
		;;

	Debian)
		sudo apt-get -y install pass
		sudo apt-get -y install tmux
		sudo apt-get -y install git
		sudo apt-get -y install mercurial
		sudo apt-get -y install fossil
		sudo apt-get -y install feh
		sudo apt-get -y install shntool
		sudo apt-get -y install cuetools
		sudo apt-get -y install octave
		sudo apt-get -y install curl
		sudo apt-get -y install wget
		sudo apt-get -y install highlight highlight-common
		sudo apt-get -y install htop
		sudo apt-get -y install xdotool
		sudo apt-get -y install cloc
		sudo apt-get -y install git-flow
		sudo apt-get -y install neofetch
		sudo apt-get -y install pandoc
		sudo apt-get -y install rtorrent
		sudo apt-get -y install dunst
		sudo apt-get -y install unrar
		sudo apt-get -y install unzip
		sudo apt-get -y install mplayer
		sudo apt-get -y install cmus
		sudo apt-get -y install udisks2 udiskie
		sudo apt-get -y install compton
		sudo apt-get -y install p7zip
		sudo apt-get -y install unclutter
		sudo apt-get -y install inotify-tools
		sudo apt-get -y install source-highlight
		sudo apt-get -y install colordiff
		sudo apt-get -y install xsel
		sudo apt-get -y install youtube-dl
		sudo apt-get -y install scrot
		sudo apt-get -y install mpv
		sudo apt-get -y install libnotify-bin
		sudo apt-get -y install ffmpeg
		sudo apt-get -y install dzen2
		sudo apt-get -y install aria2
		sudo apt-get -y install grabc
		sudo apt-get -y install x11-xkb-utils
		sudo apt-get -y install i3lock
		sudo apt-get -y install mediainfo
		sudo apt-get -y install gawk mawk
		sudo apt-get -y install tmux
		sudo apt-get -y install offlineimap
		sudo apt-get -y install w3m
		sudo apt-get -y install w3m-img
		sudo apt-get -y install xinit
		sudo apt-get -y install stumpwm
		sudo apt-get -y install rofi
		;;

	Fedora)
		sudo dnf -y install pass
		sudo dnf -y install tmux
		sudo dnf -y install git
		sudo dnf -y install mercurial
		sudo dnf -y install fossil
		sudo dnf -y install feh
		sudo dnf -y install shntool
		sudo dnf -y install cuetools
		sudo dnf -y install curl
		sudo dnf -y install screenfetch
		sudo dnf -y install wget
		sudo dnf -y install xdotool
		sudo dnf -y install htop
		sudo dnf -y install cloc
		sudo dnf -y install pandoc
		sudo dnf -y install gitflow
		sudo dnf -y install cmus
		sudo dnf -y install mplayer
		sudo dnf -y install unrar
		sudo dnf -y install octave
		sudo dnf -y install rtorrent
		sudo dnf -y install udisks2 udiskie
		sudo dnf -y install unzip
		sudo dnf -y install dunst
		sudo dnf -y install p7zip
		sudo dnf -y install inotify-tools
		sudo dnf -y install source-highlight
		sudo dnf -y install colordiff
		sudo dnf -y install xsel
		sudo dnf -y install youtube-dl
		sudo dnf -y install libnotify
		sudo dnf -y install scrot
		sudo dnf -y install grabc
		sudo dnf -y install mpv
		sudo dnf -y install gawk mawk
		sudo dnf -y install dzen2
		sudo dnf -y install aria2
		sudo dnf -y install i3lock
		sudo dnf -y install mediainfo
		sudo dnf -y install tmux
		sudo dnf -y install offlineimap
		sudo dnf -y install ffmpeg
		sudo dnf -y install w3m
		sudo dnf -y install unclutter
		sudo dnf -y install w3m-img
		;;

	Ubuntu)
		sudo apt-get -y install pass
		sudo apt-get -y install tmux
		sudo apt-get -y install git
		sudo apt-get -y install mercurial
		sudo apt-get -y install fossil
		sudo apt-get -y install gawk mawk
		sudo apt-get -y install feh
		sudo apt-get -y install ffmpeg
		sudo apt-get -y install shntool
		sudo apt-get -y install cuetools
		sudo apt-get -y install compton
		sudo apt-get -y install curl
		sudo apt-get -y install wget
		sudo apt-get -y install htop
		sudo apt-get -y install git-flow
		sudo apt-get -y install mplayer
		sudo apt-get -y install cmus
		sudo apt-get -y install rtorrent
		sudo apt-get -y install unclutter
		sudo apt-get -y install highlight highlight-common
		sudo apt-get -y install cloc
		sudo apt-get -y install udisks2 udiskie
		sudo apt-get -y install pandoc
		sudo apt-get -y install xdotool
		sudo apt-get -y install dunst
		sudo apt-get -y install inotify-tools
		sudo apt-get -y install grabc
		sudo apt-get -y install libnotify-bin
		sudo apt-get -y install unrar
		sudo apt-get -y install octave
		sudo apt-get -y install unzip
		sudo apt-get -y install x11-xkb-utils
		sudo apt-get -y install p7zip
		sudo apt-get -y install source-highlight
		sudo apt-get -y install colordiff
		sudo apt-get -y install xsel
		sudo apt-get -y install youtube-dl
		sudo apt-get -y install scrot
		sudo apt-get -y install mpv
		sudo apt-get -y install dzen2
		sudo apt-get -y install neofetch
		sudo apt-get -y install aria2
		sudo apt-get -y install i3lock
		sudo apt-get -y install mediainfo
		sudo apt-get -y install tmux
		sudo apt-get -y install offlineimap
		sudo apt-get -y install w3m
		sudo apt-get -y install w3m-img
		sudo apt-get -y install xinit
		sudo apt-get -y install stumpwm
		sudo apt-get -y install rofi
		;;
esac

case $os in
	Arch)
		sudo pacman --noconfirm -S mu
		;;

	Debian)
		sudo apt-get -y install maildir-utils
		sudo apt-get -y install mu4e
		;;

	Fedora)
		sudo dnf -y copr enable jamesd/maildir-utils
		sudo dnf -y install maildir-utils emacs-mu4e
		;;

	Ubuntu)
		sudo apt-get -y install maildir-utils
		sudo apt-get -y install mu4e
		;;
esac
case $os in
	Arch)
		sudo pacman --noconfirm -S beets
		;;

	Debian)
		sudo apt-get -y install beets
		sudo apt-get -y install beets-doc
		;;

	Fedora)
		sudo dnf -y install beets
		sudo dnf -y install beets-doc
		sudo dnf -y install beets-plugins
		;;

	Ubuntu)
		sudo apt-get -y install beets
		sudo apt-get -y install beets-doc
		;;
esac
case $os in
	Arch)
		sudo pacman --noconfirm -S hub
		;;

	Fedora)
		sudo dnf -y install install hub
		;;
esac

# case $os in
#	Arch)
#		yaourt -S --noconfirm transmission-remote-gui-gtk2
#		sudo pacman --noconfirm -S transmission-cli
#		;;

#	Debian)
#		sudo apt-get -y install transmission-remote-gtk
#		sudo apt-get -y install transmission-daemon
#		;;

#	Fedora)
#		sudo dnf -y install transmission-remote-gtk
#		sudo dnf -y install transmission-daemon
#		;;

#	Ubuntu)
#		sudo apt-get -y install transmission-remote-gtk
#		sudo apt-get -y install transmission-daemon
#		;;
# esac

#parsers for ansiweather
case $os in
	Arch)
		sudo pacman --noconfirm -S jq
		sudo pacman --noconfirm -S bc
		;;

	Debian)
		sudo apt-get -y install jq
		sudo apt-get -y install bc
		;;

	Fedora)
		sudo dnf -y install jq
		sudo dnf -y install bc
		;;

	Ubuntu)
		sudo apt-get -y install jq
		sudo apt-get -y install bc
		;;
esac

#colorized output for many of things
case $os in
	Arch)
		sudo pacman --noconfirm grc
		;;

	Debian)
		sudo apt-get -y install grc
		;;

	Ubuntu)
		sudo apt-get -y install grc
		;;

	Fedora)
		cd ~/bin/
		git clone https://github.com/garabik/grc.git
		cd grc
		./install.sh
		;;

esac

case $os in
	Arch)
		yaourt -S --noconfirm urlview
		;;

	Fedora)
		sudo dnf -y install urlview
		;;

	Debian)
		sudo apt-get -y install urlview
		;;

	Ubuntu)
		sudo apt-get -y install urlview
		;;
esac

# sudo systemctl stop mpd
# sudo systemctl disable mpd
# sudo systemctl stop transmission
# sudo systemctl disable transmission
