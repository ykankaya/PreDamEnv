#!/bin/bash

# installing utilities
echo "Installing basic utilities"

# git flow
curl --silent --location  https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh --output /tmp/gitflow-installer.sh
sudo bash /tmp/gitflow-installer.sh install stable &> /dev/null
rm /tmp/gitflow-installer.sh

# git flow config
git config --global gitflow.feature.finish.no-ff yes
git config --global --add merge.ff false
