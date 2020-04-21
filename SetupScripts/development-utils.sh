#!/bin/sh
os=$(lsb_release -is)
user=$(whoami)
sudo cabal update
#gopm
export GOPATH=/home/$user/Go
export LGOBIN=/home/$user/Go/bin
go get -u github.com/gpmgo/gopm
#html and css checking
sudo npm install -g csslint
#python indenter
sudo -H pip install autopep8
#js and json linters/indenters
sudo npm install -g tern
sudo npm install -g js-beautify
sudo npm install -g jsonlint
#css classes autocomplete
sudo cpan -fi IPC::Run3
sudo cpan -fi Log::Log4perl
sudo cpan -i CSS::Watcher
#git-pass integration
sudo git clone https://github.com/languitar/pass-git-helper.git /opt/pass-git-helper/
#quicklisp
sbcl --load $folder/quicklispinit.lisp
