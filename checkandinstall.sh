#!/bin/bash

# in this file is declared a function that:
# 1. checks a variable Y.
#   - if its "YES", installs the tool X
#   - if its "FALSE", doesnt install the tool
#   - otherwise, asks the user if the tool should be installed or not, and acts accordingly
check_and_install() {
  # $1: wether we're supposed to install that tool or not
  local SHOULD_I_INSTALL_TOOL=$1
  # $2: function that when called installs the tool
  local INSTALL_FUNCTION=$2
  # $3: string for a query asking wether the tool should be installed or not
  local INSTALL_QUERRY=$3

  if [[ $SHOULD_I_INSTALL_TOOL = "YES" ]]; then
    $INSTALL_FUNCTION
  elif [[ $SHOULD_I_INSTALL_TOOL != "NO" ]]; then
    printf "$INSTALL_QUERRY "
    read SHOULD_I_INSTALL_TOOL1
    if [[ $SHOULD_I_INSTALL_TOOL1 =~ $REGEX_YES ]]; then
      $INSTALL_FUNCTION
    fi
  fi

}

# regex to check for yes from user input
REGEX_YES='[y|yes|Y|YES]'
