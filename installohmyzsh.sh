#!/bin/bash

source "$DIR/utils/install_package.sh"
source "$DIR/utils/check_and_install.sh"
source "$DIR/utils/install_tool.sh"

setup_omz() (

  # INSTALL AND SETUP ZSH AND OH-MY-SZH
  # set up zsh and oh-my-zsh
  install_zsh() {
    install_package_silence zsh 
  }

  # install oh-my-zsh
  install_omz() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -y -qq &> /dev/null
  }

  # powerline fonts for "agnoster" oh-my-zsh theme
  install_fonts() {
    install_package_silence fonts-powerline
  }

  # check if oh-my-zsh is installed
  if [[ $ZSH == *".oh-my-zsh"* ]]; then
    HAS_OMZ="YES"
  fi

  # check if powerline fonts are installed
  if [ $(dpkg -l | awk '/^ii +'"fonts-powerline"' +/' | egrep "^ii" | wc -l) = 1 ]; then
    HAS_FONTS="YES"
  fi

  install_tool "oh-my-zsh"                    \
  "zsh"               install_zsh   ""        \
  "omz"               install_omz   $HAS_OMZ  \
  "powerline fonts"   install_fonts $HAS_FONTS
)
check_and_install "$INSTALL_ZSH" setup_omz "Do you want to install oh-my-zsh as your shell?"
