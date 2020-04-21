#!/bin/bash

# install a package through apt-get, with the added flags
apt_get_install() {
  
  # $1: the name of the package we're installing
  local PKG=$1
  shift
  
  # $2: the aditional (optional) flags that should be passed to apt-get 
  local FLAGS=${1:-""}
  shift

  echo "installing package '$PKG', with flags '$FLAGS'"

  sudo apt-get install -y -qq $FLAGS $PKG -qq > /dev/null
}
