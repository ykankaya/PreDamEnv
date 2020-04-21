#!/bin/bash

# https://github.com/creationix/nvm
if [ ! -d $HOME/.nvm ]; then
  echo -e "\nInstalling nvm..."
  curl -L https://github.com/creationix/nvm/raw/v0.33.11/install.sh | bash

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  nvm install 8
  nvm use 8
  nvm alias default 8
fi

