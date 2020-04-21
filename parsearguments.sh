#!/bin/bash

for i in "$@"
do
case $i in
  # EXAMPLE OF KEY/VALUE ARGUMENT
  -u=*|--windows-user=*|--user=*)
  WINDOWS_USER="${i#*=}"
  shift # past argument=value
  ;;

  # EXAMPLE OF UNARY ARGUMENT
  --default)
  DEFAULT=YES
  shift # past argument with no value
  ;;

#! DOTFILES SETUP OPTIONS
  --dotfiles|-d)
  SETUP_DOTFILES=YES
  shift
  ;;
  --no-dotfiles|-no-d)
  SETUP_DOTFILES=NO
  shift
  ;;

#! WSL SETUP OPTIONS
  --wsl|-w)
  SETUP_WSL=YES
  shift
  ;;
  --no-wsl)
  SETUP_WSL=NO
  shift
  ;;

#! OH-MY-ZSH SETUP OPTIONS
  --oh-my-zsh|--omz|--zsh|-z)
  INSTALL_ZSH=YES
  shift
  ;;

  --noh-my-zsh|--nomz|--no-oh-my-zsh|--no-omz|--no-zsh)
  INSTALL_ZSH=NO
  shift
  ;;

#! UPDATE REPOS OPTIONS
  --update-repos|--update|-u)
  UPDATE_REPOS=YES
  shift
  ;;
  --no-update-repos|--no-update)
  UPDATE_REPOS=NO
  shift
  ;;

#! DEV TOOLS OPTIONS
  # node and nvm options
  --node|--nvm|-N)
  INSTALL_NODE=YES
  shift # past argument with no value
  ;;
  --no-node|--no-nvm)
  INSTALL_NODE=NO
  shift # past argument with no value
  ;;

  # rails options
  --rails|-r)
  INSTALL_RAILS=YES
  shift # past argument with no value
  ;;
  --no-rails)
  INSTALL_RAILS=NO
  shift # past argument with no value
  ;;

  # unknown option
  *)
  ;;
esac
done

# if default, setup variables
if [ "$DEFAULT" = "YES" ]; then
  WINDOWS_USER="$USER"
  INSTALL_NODE="YES"
  INSTALL_ZSH="YES"
  INSTALL_RAILS="YES"
  SETUP_DOTFILES="YES"
  UPDATE_REPOS="YES"
  SETUP_WSL="NO"
fi
