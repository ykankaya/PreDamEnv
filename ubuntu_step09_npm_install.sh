#!/bin/bash

nodeModules=(
################################################################################
# name                          desc
################################################################################
  http-server                 # a command-line http server
  cleaver                     # 30-second Slideshows for Hackers
)

for k in ${nodeModules[@]}; do npm install -g $k; done
