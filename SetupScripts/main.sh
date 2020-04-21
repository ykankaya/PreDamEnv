#!/bin/sh

folder=$PWD
export folder

sh $folder/fish-shell.sh

sh $folder/base-setup.sh

sh $folder/base-compilers.sh
sh $folder/basic-libs.sh

sh $folder/extra-repos.sh

sh $folder/cli-utils.sh
sh $folder/development.sh
sh $folder/gui-apps.sh

sh $folder/development-utils.sh
sh $folder/third-party-cli.sh

sh $folder/fonts.sh

sh $folder/micro-editor.sh
sh $folder/ide.sh

sh $folder/games.sh

sh $folder/docker-setup.sh

sh $folder/restore-configs.sh

nmcli connection mod "docker0" ipv4.dns "51.254.25.115 185.121.170.176 188.165.200.156 52.174.55.168"
nmcli connection mod "Wired connection 1" ipv4.dns "51.254.25.115 185.121.170.176 188.165.200.156 52.174.55.168"

sbcl --load $folder/quicklispinit.lisp
