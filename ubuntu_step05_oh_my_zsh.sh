#!/bin/bash

# https://github.com/robbyrussell/oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh ]; then
  echo -e "\nInstalling oh-my-zsh..."
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  chsh -s /bin/zsh
fi

