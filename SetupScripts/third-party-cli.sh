#!/bin/sh
os=$(lsb_release -is)
user=$(whoami)

# git clone https://github.com/fcambus/ansiweather.git ~/bin/ansiweather
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#more utils from foreign repos
#some nice utils for sql
sudo -H pip install mycli
sudo -H pip install pgcli
sudo -H pip install tldr

#better find command
cargo install fd-find

#safer rm
sudo -H pip install trash-cli
#mv/cp with progress bar
sudo -H pip3 install pycp

#asciinema
sudo pip3 install asciinema

#replacement for regular tree
sudo npm install -g @aweary/alder

#cli fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/bin/fzf
cd ~/bin/fzf
fish -c "./install"

#cat for images
cd ~/bin/
git clone https://github.com/atextor/icat.git
cd icat
make

#colored cat output
cd ~/Go/bin/
./gopm bin github.com/jingweno/ccat

#ls with icons
sudo apt-get -y install fontforge python-fontforge
cd ~/bin/
git clone https://github.com/sebastiencs/icons-in-terminal.git
cd icons-in-terminal
./install.sh
cd ~/bin/
git clone https://github.com/sebastiencs/ls-icons.git
cd ls-icons
./bootstrap
export CC=clang 
export CXX=clang++
mkdir binary
./configure --prefix=/home/$user/bin/ls-icons/binary
make
make install

#alternative. slow
#sudo gem install colorls

#need this for displaying layout in dzen2
cd ~/bin/
wget https://github.com/nonpop/xkblayout-state/archive/v1b.zip
unzip xkblayout-state-1b.zip
mv xkblayout-state-1b xkblayout-state
cd xkblayout-state
make

sudo gem install rmeetup
sudo gem install meetup-cli

#offlineimap wrapper
cd ~/bin/
git clone https://github.com/hrnr/offlineimap-daemon.git

#aria2 rpc client
cd ~/bin/
wget https://raw.githubusercontent.com/aria2/aria2/master/doc/xmlrpc/aria2rpc -P aria2rpc
cd aria2rpc
chmod +x aria2rpc

#time tracker
case $os in
	Debian)
		sudo apt-get -y install arbtt
		;;

	Ubuntu)
		sudo apt-get -y install arbtt
		;;

    *)
	    sudo cabal install arbtt
		;;
esac

# cd ~/bin/
# wget https://raw.githubusercontent.com/AnthonyDiGirolamo/els/master/els
# chmod +x els

git clone https://github.com/stumpwm/stumpwm-contrib.git ~/stumpwm/contrib

cd ~/bin/
git clone https://github.com/cdown/clipmenu.git

# git clone https://github.com/novoid/Memacs.git ~/bin/memacs
sudo pip install memacs

# git clone https://github.com/kewlfft/nm-opennic.git ~/bin/nm-opennic/
# cd ~/bin/nm-opennic/
# chmod +x opennic.sh
