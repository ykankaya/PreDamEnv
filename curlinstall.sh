#!/bin/bash

# install a package through apt-get, with the added flags
curl_install() {
  
  # $1: the name of the package we're installing
  local URL=$1
  shift
  
  # $2: the aditional (optional) flags that should be passed to apt-get 
  local FLAGS=${1:-""}
  shift

  # install the package
  # curl --silent --output /dev/null $URL | bash $FLAGS &> /dev/null
  curl --silent $URL | bash $FLAGS &> /dev/null

}
© 2020 GitHub, Inc.
