#!/bin/bash

source "$DIR/utils/check_and_install.sh"
source "$DIR/utils/install_package.sh"

update_repos() {

  echo "Updating repos"

  # adding repos
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg &> /dev/null | sudo apt-key add - &> /dev/null
  echo "deb https://dl.yarnpkg.com/debian/ stable main" &> /dev/null | sudo tee /etc/apt/sources.list.d/yarn.list

  # updating
  sudo apt update &> /dev/null

  # just to be sure these important tools are installed on the machine
  install_package_silence build-essential
  install_package_silence wget curl git
  install_package_silence gnupg2

}

# do the thing
check_and_install "$UPDATE_REPOS" update_repos "should repos be updated? (say yes unless you know what you're doing)"
