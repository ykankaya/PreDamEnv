#!/bin/sh

os=$(lsb_release -is)

# case $os in
#	Ubuntu)
#		__apt_ppa ppa:alexlarsson/flatpak --state present
#		__package_update_index
#		;;
# esac
# __package flatpak --state present
# flatpak remote-add --if-not-exists --no-gpg-verify flathub https://flathub.org/repo/flathub.flatpakrepo #i've run into gpg troubles with this repo

# flatpak install flathub com.valvesoftware.Steam
# flatpak install flathub com.skype.Client

#emulators in flatpaks
# flatpak install flathub org.ppsspp.PPSSPP
# flatpak install flathub org.libretro.RetroArch
