#!/bin/sh
cd ~/bin/
mkdir emacs-source
wget http://ftp.gnu.org/gnu/emacs/emacs-25.2.tar.gz
tar xf emacs-25.2.tar.gz -C emacs-source
git clone https://github.com/akermu/emacs-libvterm.git
cd emacs-libvterm
make EMACS-SRC=~/bin/emacs-source/emacs-25.2/
