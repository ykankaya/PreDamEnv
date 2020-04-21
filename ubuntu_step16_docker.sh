#!/bin/bash

# Add user account to the docker group
sudo usermod -aG docker $(whoami)

# set mirror
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://hub-mirror.c.163.com

# https://github.com/docker/compose
(command -v docker-compose >/dev/null 2>&1) || {
  echo -e "\nInstalling docker-compose..."
  sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
}

