#!/bin/bash

source "$DIR/utils/check_and_install.sh"
source "$DIR/utils/check_and_install.sh"

setup_wsl() (

  # set up a link from ~/projects to C:/projects (/mnt/c/projects)
  link_to_c_drive() {
    mkdir /mnt/c/projects &> /dev/null
    ln -s /mnt/c/projects &> /dev/null
  }

  # copy ssh keys from windows supersystem to linux subsystem
  copy_ssh_keys() {

    if [ -z "$WINDOWS_USER" ]; then
      printf "What's your username in your windows system? (press enter to use the default: $USER) "
      read WINDOWS_USER
      
      # if user didnt enter Windows username, use Linux username
      if [ -z "$WINDOWS_USER" ]; then
        WINDOWS_USER=$USER
      fi
    fi
    cp -r /mnt/c/Users/$WINDOWS_USER/.ssh ~/.
    chmod 700 ~/.ssh/id_rsa
  }

  check_and_install "$LINK_TO_C_DRIVE" link_to_c_drive "Do you want to create a projects folder in your C:/ drive?"
  check_and_install "$COPY_SSH_KEYS" copy_ssh_keys "Do you want to share your Windows ssh keys with this linux subsystem?"
)
check_and_install "$SETUP_WSL" setup_wsl "Are you in a WSL (windows subsystem for linux)?"
© 2020 GitHub, Inc.
