#!/usr/bin/fish
cd ~/Data/Share/CodeBackups
for folder in (ls -d */ | tr -d "/")
	cd $folder
	git pull origin master
	cd ..
end
