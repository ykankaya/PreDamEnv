sudo sudo apt-get update
sudo sudo apt-get upgrade
sudo sudo apt-get install pass
sudo sudo apt-get install yadm
sudo sudo apt-get install syncthing
sudo sudo apt-get install python3-pip
sudo loginctl enable-linger pi
sudo systemctl enable syncthing@pi.service
sudo systemctl start syncthing@pi.service
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo sudo apt-get install docker-compose
#rtorrent + rutorrent
docker run -v /home/pi/.config/rtorrent:/config -v /home/pi/Data/Share/Downloads:/downloads -e PGID=1000 -e PUID=1000 --name rtorrent -e TZ=Europe/Kiev -p 8888:80 -p 5000:5000 -p 51413:51413 -p 6881:6881/udp -d --restart always lsioarmhf/rutorrent
#organizr
docker run -v /home/pi/Data/Config/Organizr:/config --name organizr -e PGID=1000 -e PUID=1000 -p 80:80 -d --restart always lsioarmhf/organizr
#Pyload
docker run -d --name pyload --restart always -p 8540:8000 -v /home/pi/Data/Share/NonTorrentDownloads/Saved:/opt/pyload/Downloads -v /home/pi/Data/Config/pyload:/opt/pyload/pyload-config/ -e PGID=1000 -e PUID=1000 ltsmoke55/rpi-pyload
#Radicale dav server
#docker run -d --name radicale --restart always -p 5232:5232 -v /home/pi/Data/Config/radicale:/config -v /home/pi/Data/DAV:/collections -e PGID=1000 -e PUID=1000 funkyfuture/rpi-radicale
#emby server
# docker run -d --name emby --restart always -e TZ=EET -p 8096:8096 -p 8920:8920 \
	#	   -p 7359:7359/udp -p 1900:1900/udp \
	#	   -v /home/pi/Data/Config/emby:/config \
	#	   -e PGID=1000 -e PUID=1000 \
	#	   -v /home/pi/Data/Share/Media:/media -d emby/embyserver:armv7
#couch potato server
docker run \
	   -d --restart always \
	   --name=couchpotato \
	   -v /home/pi/Data/Config/couchpotato:/config \
	   -v /home/pi/Data/Share/Media/Movies:/movies \
	   -v /home/pi/Data/Share/Downloads/completed:/downloads \
	   -v /home/pi/Data/Share/Downloads/watched:/watching \
	   -e PGID=1000 -e PUID=1000  \
	   -e TZ=EET \
	   -p 5050:5050 \
	   lsioarmhf/couchpotato
#headphones server
docker run \
	   -d --restart always \
	   --name=headphones \
	   -v /home/pi/Data/Config/headphones:/config \
	   -v /home/pi/Data/Share/Downloads/completed:/downloads \
	   -v /home/pi/Data/Share/Media/Music:/music \
	   -v /home/pi/Data/Share/Downloads/watched:/watching \
	   -e PGID=1000 -e PUID=1000  \
	   -e TZ=EET \
	   -p 8181:8181 \
	   lsioarmhf/headphones
#emacs image
docker build -t scvhapps/emacs https://github.com/schvabodka-man/emacs-rpi-docker.git
#elfeed server
mkdir ~/.emacs.elfeed
cp init.el ~/.emacs.elfeed
docker run -d --restart always \
	   --name=elfeed \
	   -v /home/pi/.emacs.elfeed:/root/config \
	   -v /home/pi/.elfeed:/root/.elfeed \
	   -v /home/pi/Data/Share/Org/Util:/root/org-files/ \
	   -e PGID=1000 -e PUID=1000  \
	   -e TZ=EET \
	   -p 36545:8080 \
	   scvhapps/emacs
#calibre server
docker build -t scvhapps/calibre https://github.com/schvabodka-man/calibre-rpi-docker.git
docker run -d --restart always --name calibre -p 8089:8080 -v /home/pi/Data/Share/Media/Books:/root/books -v /home/pi/.config/calibre:/root/.config/calibre -e PGID=1000 -e PUID=1000 -e TZ=EET -d scvhapps/calibre
#gitea
docker run -d \
	   --restart=always \
	   --name=gitea \
	   -p 52:22 \
	   -e PGID=1000 -e PUID=1000 -e TZ=EET \
	   -p 3044:3000 \
	   -v /home/pi/Data/Git:/data \
	   phreakazoid/gitea-rpi
#tagspaces
# docker build -t scvhapps/rpi-tagspaces https://github.com/schvabodka-man/rpi-tagspaces.git
# docker run --name tagspaces -d --restart=always -p 9223:80 -e PGID=1000 -e PUID=1000 -e TZ=EET scvhapps/rpi-tagspaces
#cloud
#docker run -d --name "webdav" --restart=always -e PGID=1000 -e PUID=1000 -e TZ=EET -e READWRITE=true -p 5632:80 -v /home/pi/Data/Share:/webdav -v /home/pi/Data/Config/webdav:/config raigen/rpi-alpine-webdav
#syncing bbdb and carddav server
# docker run --name asynk -d -v /home/pi/Data/Bbdb:/root/Bbdb
# -v /home/pi/Config/asynk/:/root/asynk-config --restart=always -e PGID=1000 -e PUID=1000 -e TZ=EET -e PROFILE=bbdb scvhapps/rpi-asynk
