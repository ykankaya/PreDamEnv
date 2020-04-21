#!/bin/bash

# https://github.com/moovweb/gvm
if [ ! -d $HOME/.gvm ]; then
  echo -e "\nInstalling gvm..."
  curl -L https://github.com/moovweb/gvm/raw/master/binscripts/gvm-installer | bash

  export GVM_ROOT="$HOME/.gvm"
  [ -s "$GVM_ROOT/scripts/gvm" ] && \. "$GVM_ROOT/scripts/gvm"

  sed -i "s/https:\/\/go.googlesource.com\/go/http:\/\/github.com\/golang\/go/g" $HOME/.gvm/scripts/install
  gvm install go1.4 -B
  gvm use go1.4
  gvm install go1.13
  gvm use go1.13 --default
fi
