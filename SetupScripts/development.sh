#!/bin/sh

os=$(lsb_release -is)

#for development
case $os in
	Arch)
		sudo pacman --noconfirm -S the_silver_searcher
		sudo pacman --noconfirm -S python2-pip
		sudo pacman --noconfirm -S python-pip
		sudo pacman --noconfirm -S ruby
		sudo pacman --noconfirm -S shellcheck
		sudo pacman --noconfirm -S jdk9-openjdk
		sudo pacman --noconfirm -S go
		sudo pacman --noconfirm -S perl
		sudo pacman --noconfirm -S texlive-most
		sudo pacman --noconfirm -S rust
		sudo pacman --noconfirm -S kotlin
		yaourt -S --noconfirm brainfuck
		sudo pacman --noconfirm -S luarocks
		sudo pacman --noconfirm -S scala
		sudo pacman --noconfirm -S clojure
		sudo pacman --noconfirm -S groovy
		sudo pacman --noconfirm -S tidy
		sudo pacman --noconfirm -S maven
		sudo pacman --noconfirm -S gradle
		sudo pacman --noconfirm -S sbt
		sudo pacman --noconfirm -S sbcl
		sudo pacman --noconfirm -S clisp
		sudo pacman --noconfirm -S cmucl
		sudo pacman --noconfirm -S ecl
		sudo pacman --noconfirm -S cabal-install
		;;

	Debian)
		sudo apt-get -y install python-pip
		sudo apt-get -y install python3-pip
		sudo apt-get -y install ruby-all-dev
		sudo apt-get -y install shellcheck
		sudo apt-get -y install openjdk-9-jdk
		sudo apt-get -y install golang
		sudo apt-get -y install perl
		sudo apt-get -y install texlive-full
		sudo apt-get -y install cargo
		sudo apt-get -y install software-properties-common
		sudo apt-get -y install g++
		sudo apt-get -y install hsbrainfuck
		sudo apt-get -y install luarocks
		sudo apt-get -y install scala
		sudo apt-get -y install clojure
		sudo apt-get -y install groovy
		sudo apt-get -y install tidy
		sudo apt-get -y install gradle
		sudo apt-get -y install maven
		sudo apt-get -y install sbt
		sudo apt-get -y install sbcl
		sudo apt-get -y install clisp
		sudo apt-get -y install cmucl
		sudo apt-get -y install ecl
		sudo apt-get -y install cl-quicklisp
		sudo apt-get -y install cabal-install
		;;

	Fedora)
		sudo dnf -y install python-pip
		sudo dnf -y install python3-pip
		sudo dnf -y install ruby-devel
		sudo dnf -y install ShellCheck
		sudo dnf -y install java-1.8.0-openjdk-devel-debug
		sudo dnf -y install golang
		sudo dnf -y install cpan
		sudo dnf -y install texlive-scheme-full
		sudo dnf -y install cargo
		sudo dnf -y install gcc-c++
		sudo dnf -y install brainfuck
		sudo dnf -y install texlive-collection-langcyrillic
		sudo dnf -y install luarocks
		sudo dnf -y install scala
		sudo dnf -y install clojure
		sudo dnf -y install groovy
		sudo dnf -y install tidy
		sudo dnf -y install maven
		sudo dnf -y install gradle
		sudo dnf -y install sbt
		sudo dnf -y install cab
		sudo dnf -y install sbcl
		sudo dnf -y install clisp
		sudo dnf -y install cmucl
		sudo dnf -y install ecl
		;;

	Ubuntu)
		sudo apt-get -y install python-pip
		sudo apt-get -y install python3-pip
		sudo apt-get -y install ruby-all-dev
		sudo apt-get -y install shellcheck
		sudo apt-get -y install openjdk-9-jdk
		sudo apt-get -y install golang
		sudo apt-get -y install perl
		sudo apt-get -y install texlive-full
		sudo apt-get -y install cargo
		sudo apt-get -y install software-properties-common
		sudo apt-get -y install g++
		sudo apt-get -y install hsbrainfuck
		sudo apt-get -y install luarocks
		sudo apt-get -y install scala
		sudo apt-get -y install clojure
		sudo apt-get -y install groovy
		sudo apt-get -y install tidy
		sudo apt-get -y install gradle
		sudo apt-get -y install maven
		sudo apt-get -y install sbt
		sudo apt-get -y install cabal-install
		sudo apt-get -y install sbcl
		sudo apt-get -y install clisp
		sudo apt-get -y install cmucl
		sudo apt-get -y install ecl
		sudo apt-get -y install cl-quicklisp
		;;
esac

case $os in
	Arch)
		sudo pacman --noconfirm -S groovy-docs
		;;

	Fedora)
		sudo dnf -y install groovy-groovysh
		sudo dnf -y install groovy-groovydoc
		sudo dnf -y install groovy-console
		sudo dnf -y install groovy-servlet
		sudo dnf -y install groovy-docgenerator
		;;
esac
#nodejs in deb based is very funny to install properly
case $os in
	Arch)
		sudo pacman --noconfirm -S npm
		;;

	Debian)
		curl -sL https://deb.nodesource.com/setup_8.x | bash -
		sudo apt-get -y install nodejs
		sudo apt-get -y install npm
		;;

	Fedora)
		sudo dnf -y install npm
		;;

	Ubuntu)
		curl -sL https://deb.nodesource.com/setup_8.x | bash -
		sudo apt-get -y install nodejs
		sudo apt-get -y install npm
		;;
esac

#there are no lein in repos, stuff happens
curl -s "https://get.sdkman.io" | bash
sdk install leiningen
