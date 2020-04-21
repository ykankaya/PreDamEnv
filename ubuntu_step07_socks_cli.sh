#!/bin/bash

# https://github.com/zjx20/socks-cli
if [ ! -d $HOME/.socks-cli ]; then
  echo -e "\nInstalling socks-cli..."
  git clone https://github.com/zjx20/socks-cli.git $HOME/.socks-cli
  cp $HOME/.socks-cli/socksproxyenv.sample $HOME/.socks-cli/socksproxyenv
fi

