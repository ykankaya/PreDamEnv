#!/bin/sh
microversion=1.3.3
cd ~/bin/
mkdir micro
cd micro
wget "https://github.com/zyedidia/micro/releases/download/v$microversion/micro-$microversion-linux64.tar.gz"
tar xzf "micro-$microversion-linux64.tar.gz"
cd "micro-$microversion"
mv micro ..
# rm -rf micro-$microversion micro-$microversion-linux64.tar.gz
