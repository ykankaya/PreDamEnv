#!/bin/bash/

source "$DIR/utils/apt_get_install.sh"

# in this file is declared a function that installs a package, if it isnt already installed.
# if the package is already installed, it does nothing
install_package() {
  # $1: the name of the package we're installing
  local PKG=$1
  # $2: the aditional flags that should be passed to apt-get 
  local FLAGS=$2

  # check wether or not the package is already installed
  local PKG_OK=$(dpkg -l | awk '/^ii +'"$PKG"' +/' | egrep "^ii" | wc -l)
  printf "Checking for $PKG: "
  
  # if package isnt installed, install it
  if [ 0 == $PKG_OK ]; then
    apt_get_install $PKG $FLAGS

  # if its already installed, just move on
  else
    printf "ok\n"
  fi
}
install_package_silence() {
  # $1: the name of the package we're installing
  local PKG=$1
  # $2: the aditional flags that should be passed to apt-get 
  local FLAGS=$2

  install_package $PKG $FLAGS &> /dev/null
}
