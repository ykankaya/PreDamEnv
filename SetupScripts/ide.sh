#!/bin/sh

os=$(lsb_release -is)

idea=2017.2.5

case $os in
	Arch)
		# sudo pacman  --noconfirm -S eclipse-java
		yaourt -S --noconfirm intellij-idea-ultimate-edition
		yaourt -S --noconfirm android-studio
		yaourt -S --noconfirm android-sdk
		;;

	Debian)
		cd ~/bin/
		wget "https://download.jetbrains.com/idea/ideaIU-$idea.tar.gz"
		tar xzf "ideaIU-$idea.tar.gz"
		mv idea-* idea
		# sudo apt-get -y install eclipse
		;;

	Fedora)
		# sudo dnf -y install eclipse
		cd ~/bin/
		wget "https://download.jetbrains.com/idea/ideaIU-$idea.tar.gz"
		tar xzf "ideaIU-$idea.tar.gz"
		mv idea-* idea
		;;

	Ubuntu)
		# sudo apt-get -y install eclipse
		sudo apt-get -y install ubuntu-make
		umake android
		umake android android-studio
		umake ide idea-ultimate
		;;
esac

# cd ~/bin/
# mkdir eclim
# wget -O eclipse.tar.gz http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/oxygen/1a/eclipse-jee-oxygen-1a-linux-gtk-x86_64.tar.gz\&r=1
# tar xzf eclipse.tar.gz

# cd eclim
# wget https://github.com/ervandew/eclim/releases/download/2.7.0/eclim_2.7.0.jar
# java -Dvim.skip=true -Declipse.home=~/bin/eclipse -jar eclim_2.7.0.jar install
