#!/bin/bash

dpkg --get-selections | grep firefox

aptPackages=(
  xul-ext-ubufox
  libappstream3
  snapd
  unity-webapps-common
  thunderbird
  totem
  rhythmbox

  empathy
  brasero
  simple-scan
  gnome-mahjongg
  aisleriot
  gnome-mines
  cheese

  gnome-orca
  webbrowser-app
  gnome-sudoku
  landscape-client-ui-install
  onboard
  deja-dup
)

for k in ${aptPackages[@]}; do sudo apt purge -y $k; done
sudo apt purge `dpkg --get-selections | grep firefox | awk '{print $1}'`
sudo apt purge `dpkg --get-selections | grep libreoffice | awk '{print $1}'`

sudo apt autoremove -y

