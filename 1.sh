#!/bin/bash
echo '============= 初次安裝 ==============='
echo 'Update yum'
sudo yum -y update
echo 'Install EPEL'
sudo yum -y install epel-release
echo 'Install Vim'
sudo yum -y install vim
