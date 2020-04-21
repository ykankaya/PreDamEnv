ASDF_VERSION=0.6.1
ERLANG_VERSION=21.0.5
ELIXIR_VERSION=1.7.2
RUBY_VERSION=2.5.1
IMAGEMAGICK=7.0.8-10
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

# Detect OS 
echo ""
echo "     >>>>>>>${green} ${machine} ${reset}<<<<<<<<<             "
echo ""

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "      ====================================================="
echo "             ${green} Homebrew installed successfully ${reset} "
echo "      ====================================================="
  
# Ruby Dependencies   
echo ""
echo ">>>>>>>>>>>>${green} Dependencies install start ${reset} "
echo ""

brew update && brew install coreutils openssl libyaml \
                    libffi automake autoconf readline \
                    libxslt wxmac gpg git yarn node

echo "      ====================================================="
echo "             ${green} Ruby Dependencies installed ${reset} "
echo "      ====================================================="


echo ""
echo ">>>>>>>>>>>>${green} ASDF installation strat ${reset}      "
echo ""

# Clone ASDF Repo
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.5.0

if [ "$machine" = "Mac" ]; then
	echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
	echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
	#echo 'sh $HOME/.asdf/asdf.sh' >> $HOME/.bash_profile
	#echo 'sh $HOME/.asdf/completions/asdf.bash' >> $HOME/.bash_profile
	#echo 'export PATH=$PATH:$HOME/.asdf/bin:$HOME/.asdf/shims' >> $HOME/.bash_profile
else
	echo 'bash $HOME/.asdf/asdf.sh' >> $HOME/.bashrc
	echo 'bash $HOME/.asdf/completions/asdf.bash' >> $HOME/.bashrc
	echo 'export PATH=$PATH:$HOME/.asdf/bin:$HOME/.asdf/shims' >> $HOME/.bashrc
fi

# asdf source path
source ~/.asdf/asdf.sh

echo "      ====================================================="
echo "             ${green} ASDF Installed Successfully ${reset} "
echo "      ====================================================="

echo ""
echo ">>>>>>>>>>>>>${green} Ruby installation Start ${reset} "
echo ""

# Add asdf ruby Plugin
asdf plugin-add ruby && asdf install ruby $RUBY_VERSION && asdf global ruby $RUBY_VERSION && gem install bundler && gem install rails

echo "      ====================================================="
echo "             ${green} Ruby installed Successfully ${reset}  "
echo "      ====================================================="


echo ""
echo ">>>>>>>>>>>>>${green} Elixir installation Start  ${reset} "
echo ""

# Install Erlang and Elixir
brew install erlang elixir

# Add asdf elixir plugin
asdf plugin-add elixir && asdf install elixir $ELIXIR_VERSION && asdf global elixir $ELIXIR_VERSION

echo "      ====================================================="
echo "             ${green} Elixir Installed Successfully${reset}    "
echo "      ====================================================="


echo ""
echo ">>>>>>>>>>>>>${green} Imagemagick Installation Start ${reset}  "
echo ""

asdf plugin-add imagemagick && asdf install imagemagick $IMAGEMAGICK && asdf global imagemagick $IMAGEMAGICK

echo "      ==================================================="
echo "             ${green} Imagemagick Installed Successfully ${reset} "
echo "      ==================================================="


echo ""
echo ">>>>>>>>>>>>>${green} Wkhtmltopdf Installation Start ${reset}   "
echo ""

brew update && brew cask install wkhtmltopdf

echo "      ======================================================"
echo "             ${green} wkhtmltopdf Installed Successfully${reset}  "
echo "      ======================================================"


echo ""
echo ">>>>>>>>>>>>>${green} PostgreSQL Installation start ${reset} "
echo ""

brew update && brew install postgresql

# Start postgres service
brew services start postgresql

echo "      ======================================================"
echo "             ${green} PostgreSQL Installed Successfully${reset}  "
echo "      ======================================================"


echo ""
echo ">>>>>>>>>>>>>${green} Libre Office Start ${reset} "
echo ""

# use install or cask both are working
brew cask install libreoffice libreoffice-language-pack

echo "      ======================================================"
echo "             ${green} LibreOffice Installed Successfully${reset}  "
echo "      ======================================================"





