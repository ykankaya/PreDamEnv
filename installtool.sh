#!/bin/bash/
source "$DIR/utils/install_package.sh"

# in this file is declared a function that installs a tool and its related packages
install_tool() {
  # $1: the name of the tool we're installing
  local TOOL=$1
  shift
  

  printf "installing tool \"$TOOL\"\n"

  while test $# -gt 0; do
    # the name of the package we're installing
    local PKG=$1
    shift

    # the installation function to use (default to apt-get)
    local INSTALL_FUNCTION=${1:-"apt_get_install &> /dev/null"}
    shift

    # optional, overrides check to see if package is installed
    local IS_INSTALLED=$1
    shift
    
    # check wether or not the package is already installed
    local PKG_OK=$(dpkg -l | awk '/^ii +'"$PKG"' +/' | egrep "^ii" | wc -l)
    printf "  [$TOOL] Checking for $PKG: "
    
    # if package isnt installed, install it
    if [ "$IS_INSTALLED" = "YES" ] || type "$PKG" &> /dev/null ; then
    # if its already installed, just move on
      printf "ok.\n"
    else
      echo "No $PKG. Setting up $PKG."
      $INSTALL_FUNCTION $PKG
    fi
  done
}

# Usage of install_tool shall be as shown bellow:
# to install tool "node", with packages "yarn", "nvm" and "node"

# install_tool "node" \
#   "nvm"  "shell_function_that_installs_nvm"   \
#   "node" "shell_function_that_installs_nvm"   \
#   "yarn" "shell_function_that_installs_yarn"
