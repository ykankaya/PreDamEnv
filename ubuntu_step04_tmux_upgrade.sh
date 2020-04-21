#!/bin/bash

if [[ `tmux -V` != "tmux 2.8" ]]; then
  curl -L https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz -o tmux-2.8.tar.gz
  tar -zxvf tmux-2.8.tar.gz
  cd tmux-2.8
  sudo apt install -y libevent-dev ncurses-dev
  sudo ./configure
  sudo make
  sudo make install
  cd .. && sudo rm -rf tmux-2.8 tmux-2.8.tar.gz
fi

