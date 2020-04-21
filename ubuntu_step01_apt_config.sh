#!/bin/bash

echo -e "Backuping existing apt configuration"
timestr=$(date +%Y%m%d%H%M)
sudo tar -zcPf /etc/apt.$timestr.tar.gz /etc/apt

aptKeys=(
  https://download.docker.com/linux/ubuntu/gpg # docker-ce
)
for k in ${aptKeys[@]}; do echo "Adding apt key: ${k}"; curl -fsSL $k | sudo apt-key add -; done

aptRepositories=(
  ppa:jonathonf/vim # vim
  ppa:git-core/ppa # git
  ppa:ansible/ansible # ansible
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" # docker-ce
)
for ((i = 0; i < ${#aptRepositories[@]}; i++));
do
  echo "Adding apt repository: ${aptRepositories[$i]}"
  sudo add-apt-repository -y "${aptRepositories[$i]}"
done


