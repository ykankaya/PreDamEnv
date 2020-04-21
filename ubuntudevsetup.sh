
ASDF_VERSION=0.6.1
ERLANG_VERSION=20.3
ELIXIR_VERSION=1.6
RUBY_VERSION=2.5.1
RED='\033[0;31m'
DG='\033[0;31m' # Dark Grey
NC='\033[0m' # No Color

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "---------------------------------------"
echo "   ${machine}                          "
echo "---------------------------------------"

apt-get update

echo "--------------------------------------------"
echo "   ${green} updated successfully ${reset}   "
echo "--------------------------------------------"

sudo apt-get -y install vim

echo "============================================="
echo " ${green} Vim installed successfully${reset} "
echo "============================================="

echo "==========================================================="
echo " ${green} System Basics Dependencies Installation ${reset}  "
echo "==========================================================="

apt-get -y install build-essential git wget libssl-dev libreadline-dev \
	libncurses5-dev zlib1g-dev m4 curl wx-common libwxgtk3.0-dev autoconf

echo "=============================================="
echo " ${green}System Dependencies Installed${reset}"
echo "=============================================="


echo "============================================="
echo "   Installation Start Ruby Dependencies      "
echo "============================================="
#capybara-webkit error fixed libqt5webkit5-dev
#apt get install qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x
# libssl1.0 is asdf ruby 2.2.2 installation error fixed
apt-get -y install libssl-dev libyaml-dev libxml2-dev \
	 libxslt1-dev libcurl4-openssl-dev software-properties-common \
	 libffi-dev nodejs yarn libssl1.0-dev qt5-default libqt5webkit5-dev

echo "============================================="
echo "${green}Ruby Dependencies Installed${reset}"
echo "============================================="

echo "============================================="
echo "   Installation Start Erlang Dependencies    "
echo "============================================="

apt-get -y install fop default-jdk unixodbc-dev g++ libssl-dev libwxbase3.0 \
	libwxgtk3.0-dev libqt4-opengl-dev libgtk2.0-dev

echo "============================================="
echo "${green}Erlang Dependencies Installed${reset}"
echo "============================================="


echo "=============================================="
echo "        Python pip3 Installation Start        "
echo "=============================================="

apt-get update && apt-get -y install python3-pip && pip3 install numpy scipy Pillow

echo "==================================================="
echo " ${green}Python pip3 installed Successfully${reset}"
echo "==================================================="


echo "=============================================="
echo "          ASDF installation Start             "
echo "=============================================="

git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.5.0

if [ "$machine" = "Mac" ]; then
	echo 'sh $HOME/.asdf/asdf.sh' >> $HOME/.bash_profile
	echo 'sh $HOME/.asdf/completions/asdf.bash' >> $HOME/.bash_profile
	echo 'export PATH=$PATH:$HOME/.asdf/bin:$HOME/.asdf/shims' >> $HOME/.bash_profile
else
	echo 'bash $HOME/.asdf/asdf.sh' >> $HOME/.bashrc
	echo 'bash $HOME/.asdf/completions/asdf.bash' >> $HOME/.bashrc
	echo 'export PATH=$PATH:$HOME/.asdf/bin:$HOME/.asdf/shims' >> $HOME/.bashrc
fi

source $HOME/.bashrc

export PATH=$PATH:$HOME/.asdf/bin:$HOME/.asdf/shims

echo "============================================="
echo "   ${green} ASDF Installed Successfully ${reset}"
echo "============================================="

echo "============================================="
echo "         Ruby installation Start           "
echo "============================================="

asdf plugin-add ruby && asdf install ruby $RUBY_VERSION && asdf global ruby $RUBY_VERSION && gem install bundler && gem install rails

echo "============================================="
echo " ${green} Ruby installed Successfully${reset}  "
echo "============================================="

echo "============================================="
echo "         Erlang installation Start           "
echo "============================================="

asdf plugin-add erlang && asdf install erlang $ERLANG_VERSION && asdf global $ERLANG_VERSION

echo "============================================="
echo " ${green} Erlang installed Successfully${reset}  "
echo "============================================="

echo '============================================='
echo '        Elixir installation Start ASDF       '
echo '============================================='

asdf plugin-add elixir && asdf install elixir $ELIXIR_VERSION && asdf global elixir $ELIXIR_VERSION

echo "============================================="
echo "${green} Elixir Installed Successfully${reset}  "
echo "============================================="


echo "=============================================="
echo "        Imagemagick Installation Start      "
echo "=============================================="

# rmagick error fixed libmagick++-dev
apt-get install -y checkinstall libx11-dev libxext-dev zlib1g-dev \
	libpng-dev libjpeg-dev libfreetype6-dev libxml2-dev \
	build-dep imagemagick libmagick++-dev

asdf plugin-add imagemagick && asdf install imagemagick 7.0.8-10 && asdf global imagemagick 7.0.8-10

echo "==================================================="
echo " ${green} Imagemagick Installed Successfully ${reset} "
echo "==================================================="

echo "============================================="
echo "         Wkhtmltopdf Installation Start      "
echo "============================================="

if [ "$machine" = "Mac" ]; then
	brew update && brew cask install wkhtmltopdf
else
	apt-get install -y wkhtmltopdf
fi

echo "======================================================"
echo " ${green} wkhtmltopdf Installed Successfully${reset}  "
echo "======================================================"

echo "============================================="
echo "         PostgreSQL installation Start       "
echo "============================================="


echo "ADDING PDGD KEYRING for POSTGRES"

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

echo "deb http://apt.postgresql.org/pub/repos/apt/ $(grep -e UBUNTU_CODENAME /etc/os-release | awk -F= '{print $2}')-pgdg main" > /etc/apt/sources.list.d/pgdg.list

apt-get install -q -y postgresql-9.6 postgresql-client-9.6 postgresql-contrib-9.6 postgresql-client-common postgresql-common

echo postgres:postgres | chpasswd

/etc/init.d/postgresql start

su -c "psql -c \"ALTER USER postgres PASSWORD 'postgres';\"" postgres

echo "================================================"
echo " ${green}Postgres installed Successfully${reset}"
echo "================================================"


echo "=============================================="
echo "    Visual Studio Code installation Start     "
echo "=============================================="

apt install snap
snap install vscode --classic

echo "=========================================================="
echo "${green}Visual Studio Code installed Successfully${reset} "
echo "=========================================================="

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
asdf list ruby
asdf list erlang
asdf list elixir
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

echo "${green}All Dev system packages are installed successfully${reset}"



