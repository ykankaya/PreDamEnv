#!/bin/bash

# Set the colours you can use
black='\033[1;30m'
white='\033[1;37m'
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
magenta='\033[1;35m'
cyan='\033[1;36m'
pink='\e[1;31m'
endcolor='\e[0m'

echo ""
echo -e $cyan"##############################################" 
echo -e $pink"#         STARTING SYSTEM CONFIG SCRIPT      #"
echo -e $cyan"##############################################"
echo ""
echo -e $cyan"$(whoami), Are you ready $yellow?$endcolor"

select yn in "Yes" "No"; do
  case $yn in
    Yes ) break;;
    No ) echo -e $cyan "\nGood bye my friend ;( \n" $endcolor; exit 1;;
    *) echo -e $red "Answer must be$blue 1 or$blue 2 " $endcolor
  esac
done

echo ""
echo -e $cyan"##############################################" 
echo -e $pink"#            UPDATING YOUR SYSTEM            #"
echo -e $cyan"##############################################"
echo ""
echo -e "$pink"
  sudo apt update -y && echo "" && \
  sudo apt dist-upgrade -y && echo "" && \
  sudo apt upgrade -y && echo "" && \
  sudo apt autoremove -y && echo "" && \
  sudo apt autoclean -y && echo "" && \
echo ""

echo ""
echo -e $cyan"##############################################" 
echo -e $pink"#       STARTING APPLICATIONS INSTALLER      #"
echo -e $cyan"##############################################"
echo ""

echo -e $cyan"Checking non-free sources... \n"
#list of allow non-free sources
list=(
  software-properties-common 
  software-properties-gtk
  ubuntu-restricted-extras
  python-software-properties
  )
for app in ${!list[*]}
  do
    echo -e $pink""
    if test ! $(which ${list[$app]}); then
        echo -e "Installing ${list[$app]} \n"
        sudo apt install -y ${list[$app]}
    fi
  done 
echo -e ""

echo -e $cyan"Installing archive formats \n"
#list of archive formats
formats=(
  unace
  rar
  unrar
  p7zip-rar
  p7zip
  sharutils
  mpack
  arj
  cabextract
  lzip
  lunzip
)
for app in ${!formats[*]}
  do
    echo -e $pink""
        echo -e "Installing ${formats[$app]} \n"
        sudo apt install -y ${formats[$app]}
  done 
echo -e ""

echo -e $cyan"Installing general apps \n"

echo -e "$pink"
if test ! $(which amd64-microcode); then 
  #Processor drivers: amd64-microcode, intel-microcode #replace that u need
  echo -e "Installing processor drivers... \n"
  sudo apt install -y amd64-microcode
  echo -e ""
fi

if test ! $(which libreoffice); then
  #libreoffice
  echo -e "Installing libreoffice app... \n"
  sudo add-apt-repository ppa:libreoffice/ppa
  sudo apt update
  sudo apt install -y libreoffice libreoffice-templates libreoffice-style-elementary libreoffice-l10n-es myspell-es hyphen-es
  sudo apt install -y ttf-mscorefonts-installer #ms fonts
  echo -e ""
fi

if test ! $(which gdebi); then
  #gdebi .deb installer
  echo -e "Installing gdebi app... \n"
  sudo apt install -y gdebi
  echo -e ""
fi

if test ! $(which vlc); then
  #vlc Media Player
  echo -e "Installing vlc app... \n"
  sudo apt install -y vlc
  echo -e ""
fi

if test ! $(which elementary-tweaks); then
  #tweaks for customize eOS
  echo -e "Installing Elementary-tweaks \n"
  sudo add-apt-repository ppa:philip.scott/elementary-tweaks 
  sudo apt-get update
  sudo apt-get install elementary-tweaks
  echo -e ""
fi

if test ! $(which spotify-client); then
  #Spotify linux client
  echo -e "Installing Spotify Client for Linux"
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
  echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt update
  sudo apt install -y spotify-client
  echo -e ""
fi

#device compatibility
echo -e "Installing Compatibility with Android $ IPhone"
sudo apt install -y mtp-tools ipheth-utils ideviceinstaller ifuse

#steam
echo -e "Installing Steam Client"
sudo add-apt-repository multiverse
sudo apt update
sudo apt install -y steam

echo -e $cyan"Installing developer apps \n"

#open source chrome browser
echo -e "Installing chromium-browser \n"
sudo apt install -y chromium-browser

#mozilla firefox
echo -e "Installing firefox-browser \n"
sudo apt install -y firefox

#google chrome 64Bits
echo -e "Installing google-chrome-browser \n"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi google-chrome-stable_current_amd64.deb 
#deleting .deb after installed
sudo rm -r google-chrome-stable_current_amd64.deb 

#git 
echo -e "Installing Git \n"
sudo apt install -y git-core

#NodeJS
echo -e "Installing NodeJS & NPM \n"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs

#Heroku CLI - replace x64 to x86 if necessary
echo -e "Installing Heroku CLI \n"
wget https://cli-assets.heroku.com/heroku-cli/channels/stable/heroku-cli-linux-x64.tar.gz -O heroku.tar.gz
tar -xvzf heroku.tar.gz
mkdir -p /usr/local/lib /usr/local/bin
mv heroku-cli-v6.14.20-darwin-64 /usr/local/lib/heroku
ln -s /usr/local/lib/heroku/bin/heroku /usr/local/bin/heroku

#VS Code
echo -e "Installing VS Code Text-Editor \n"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code

#Atom
#echo -e "Installing Atom Text-Editor \n"
#sudo add-apt-repository ppa:webupd8team/atom
#sudo apt update 
#sudo apt install -y atom
# install add-ins with apm - Feel free to edit this packages
#apm install file-icons
#apm install atom-beautify
#apm install indent-guide-improved
#apm install git-plus
#apm install highlight-selected minimap minimap-highlight-selected minimap-find-and-replace
#apm install pigments

#Sublime Text 3
#echo -e "Installing Sublime Text-Editor 3 \n"
#wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
#sudo apt install -y apt-transport-https
#echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#sudo apt update
#sudo apt install -y sublime-text

#dconf-editor
echo -e "Installing dconf-editor \n"
sudo apt install -y dconf-editor

#Oh my zsh terminal - Source: http://choyan.me/oh-my-zsh-elementaryos/
echo -e "Installing Oh My Zsh \n"
sudo apt-get update && sudo apt-get install -y zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | bash
sudo chsh -s $(which zsh) $(whoami) 

#JAVA
echo -e "Installing JAVA \n"
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt update
sudo apt install -y oracle-java9-installer

echo ""
echo -e $cyan"##############################################" 
echo -e $pink"#     ADDING THEMES & ICONS REPOSITORIES     #"
echo -e $cyan"##############################################"
echo ""

echo -e "Adding ppa's repositories \n"
sudo add-apt-repository ppa:yunnxx/elementary #Loki FlatBlackPurple Theme
sudo add-apt-repository ppa:papirus/papirus #Papirus Icon
sudo add-apt-repository ppa:snwh/pulp #PaperMonoDark Icon
sudo add-apt-repository ppa:moka/daily #icon
sudo add-apt-repository ppa:oranchelo/oranchelo-icon-theme #icon
sudo apt update
echo -e "Installing custom themes \n"
sudo apt install -y elementary-lokiflatblackpurple-theme
sudo apt install -y papirus-icon-theme
sudo apt install -y paper-icon-theme #icon theme
sudo apt install -y paper-cursor-theme #cursor theme
sudo apt install -y paper-gtk-theme #gtk theme
sudo apt install -y moka-icon-theme #icon
sudo apt install -y faba-icon-theme faba-mono-icons #icon
sudo apt install -y oranchelo-icon-theme #icon

# remove elementary softwares
echo -e $yellow"Cleaning eOS \n"
sudo apt purge epiphany-browser epiphany-browser-data
sudo apt purge midori-granite
sudo apt purge noise
sudo apt purge bluez
sudo apt purge modemmanager
sudo apt purge geary
sudo apt autoremove
sudo apt autoclean
#Fin
