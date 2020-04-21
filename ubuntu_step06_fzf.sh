#!/bin/bash

# https://github.com/junegunn/fzf
if [ ! -d $HOME/.fzf ]; then
  echo -e "\nInstalling fzf..."
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf && $HOME/.fzf/install
fi

