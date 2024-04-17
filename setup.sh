#!/bin/bash

source .env

# Make users and group
sudo useradd sonarr -u 13001
sudo useradd radarr -u 13002
sudo useradd prowlarr -u 13006
sudo useradd qbittorrent -u 13007
sudo useradd sabnzbd -u 13011
sudo useradd bazarr -u 13013
sudo groupadd mediacenter -g 13000
sudo usermod -a -G mediacenter sonarr
sudo usermod -a -G mediacenter radarr
sudo usermod -a -G mediacenter prowlarr
sudo usermod -a -G mediacenter qbittorrent
sudo usermod -a -G mediacenter sabnzbd
sudo usermod -a -G mediacenter bazarr

# Make directories
sudo mkdir -pv ./config/{sonarr,radarr,prowlarr,qbittorrent,jellyfin,sabnzbd,bazarr,recyclarr}-config
sudo mkdir -pv ${ROOT_DIR}/data/{torrents,usenet,media}/{tv,movies}

# Set permissions
sudo chmod -R 775 ${ROOT_DIR}/data
sudo chown -R ${MUID}:mediacenter ${ROOT_DIR}/data
sudo chown -R ${MUID}:mediacenter ./config
sudo chown -R sonarr:mediacenter ./config/sonarr-config
sudo chown -R radarr:mediacenter ./config/radarr-config
sudo chown -R prowlarr:mediacenter ./config/prowlarr-config
sudo chown -R qbittorrent:mediacenter ./config/qbittorrent-config
sudo chown -R ${MUID}:mediacenter ./config/jellyfin-config
sudo chown -R bazarr:mediacenter ./config/bazarr-config
sudo chown -R sabnzbd:mediacenter config/sabnzbd-config
sudo chown -R ${MUID}:mediacenter ./config/recyclarr-config
