#!/bin/bash
echo '============= 安裝 Python 3 ==============='
echo '加入 Fedora 倉庫'
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
echo '加入 IUS 倉庫'
sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm
echo '更新 YUM'
sudo yum update

echo '安裝 Python 3.6'
sudo yum -y install python36u python36u-pip python36u-devel
echo '確認安裝'
python3.6 -V
which python3.6
