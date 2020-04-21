#!/bin/sh
sudo apt-get install tor privoxy tor-geoipdb
sudo apt-get install obfs4proxy
sudo apt-get install proxychains
sudo sh -c "echo 'SocksPort 9050' >> /etc/tor/torrc"
sudo sh -c "echo 'ORPort auto' >> /etc/tor/torrc"
sudo sh -c "echo 'BridgeRelay 1' >> /etc/tor/torrc"
sudo sh -c "echo 'Exitpolicy reject *:*' >> /etc/tor/torrc"
sudo sh -c "echo 'ExtORPort auto' >> /etc/tor/torrc"
sudo sh -c "echo 'ServerTransportPlugin obfs4 exec /usr/bin/obfs4proxy' >> /etc/tor/torrc"
sudo systemctl stop tor
sudo systemctl disable tor
