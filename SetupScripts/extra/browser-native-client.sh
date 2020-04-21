#!/bin/sh
cd ~/bin/
mkdir native-client
wget https://github.com/andy-portmen/native-client/releases/download/0.6.3/linux.zip -P native-client
cd native-client
unzip linux.zip
./install.sh
