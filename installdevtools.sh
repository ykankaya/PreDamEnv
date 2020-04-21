#!/bin/bash

source "$DIR/utils/check_and_install.sh"
source "$DIR/utils/install_package.sh"
source "$DIR/utils/curl_install.sh"
source "$DIR/utils/install_tool.sh"

# set up nvm and node
setup_node() (

  # installs nvm
  install_nvm() {
    curl_install "-o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh"
  }
  
  # installs node
  install_node() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    nvm install node &> /dev/null
  }

  # installs yarn
  install_yarn() {
    install_package yarn --no-install-recommends
    # the --no-install-recommends flag skips the node installation
  }

  # if nvm exists, source it
  local NVM_SCRIPT="$NVM_DIR/nvm.sh"
  test -f $NVM_SCRIPT && source $NVM_SCRIPT

  install_tool "node"     \
  "nvm"  install_nvm  ""  \
  "yarn" install_yarn ""  \
  "node" install_node ""
)
check_and_install "$INSTALL_NODE" setup_node "should node be installed?"

# rails and rvm
setup_rails() (
  # this takes a long ass while, strap yourself

  install_rvm() {
    echo "this is gonna take a fucking while, strap in buckaroo"
    # gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl_install "-sSL https://get.rvm.io" "-s stable --rails"  
    # curl -sSL https://get.rvm.io &> /dev/null | bash -s stable --rails &> /dev/null
    # curl -sSL https://get.rvm.io | bash -s stable --rails
    source /home/$USER/.rvm/scripts/rvm
  }

  install_ruby() {
    rvm get stable --auto-dotfiles &> /dev/null
    rvm install current &> /dev/null
    rvm use --default current &> /dev/null
  }
  
  # postgres
  install_postgres() {
    
    # install postgres
    install_package_silence postgresql "&> /dev/null"
    install_package_silence postgresql-contrib "&> /dev/null"
    install_package_silence libpq-dev "&> /dev/null"
    install_package_silence libpq-dev "&> /dev/null"
 
    # log as postgres and add current user as superuser (if the user already exists, it isnt created, but it still gains superuser)
    sudo service postgresql start

    if sudo -u postgres psql -t -c '\du' | cut -d \| -f 1 | grep -qw $USER; then
      # user exists
      # $? is 0
      echo "Postgres user already setup."
    else  
      # Read Password
      local PASSWORD=""
      printf "Postgres user not set up. Creating new psql superuser...\n"
      printf "Please insert your password (use your actual password for this linux user): "
      read -s PASSWORD
      echo
      
      sudo -u postgres psql -c "
        CREATE USER $USER WITH PASSWORD '$PASSWORD';
        ALTER USER $USER WITH SUPERUSER;
      "
    fi
  }
  
  # if rvm installed but as a binary instead of a shell function, this takes care of that
  if type rvm | grep -i .rvm/bin/rvm > /dev/null; then
    source /home/$USER/.rvm/scripts/rvm
  fi

  install_tool "rails"          \
  "rvm"   install_rvm       ""  \
  "ruby"  install_ruby      ""  \
  "psql"  install_postgres  ""

)
check_and_install "$INSTALL_RAILS" setup_rails "should rails & ruby be installed?"
