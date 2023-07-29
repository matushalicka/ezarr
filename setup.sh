#!/bin/bash

source .env

# Make users and group
sudo useradd sonarr -u 13001
sudo useradd radarr -u 13002
sudo useradd prowlarr -u 13006
sudo useradd qbittorrent -u 13007
sudo usermod -a -G mediacenter sonarr
sudo usermod -a -G mediacenter radarr
sudo usermod -a -G mediacenter prowlarr
sudo usermod -a -G mediacenter qbittorrent

# Make directories
sudo mkdir -pv ./config/{sonarr,radarr,prowlarr,qbittorrent,jellyfin}-config
sudo mkdir -pv ${ROOT_DIR}/data/{torrents,media}/{tv,movies}

# Set permissions
sudo chmod -R 775 ${ROOT_DIR}/data
sudo chown -R ${UID}:mediacenter ${ROOT_DIR}/data
sudo chown -R ${UID}:mediacenter ./config
sudo chown -R sonarr:mediacenter ./config/sonarr-config
sudo chown -R radarr:mediacenter ./config/radarr-config
sudo chown -R prowlarr:mediacenter ./config/prowlarr-config
sudo chown -R qbittorrent:mediacenter ./config/qbittorrent-config
sudo chown -R ${UID}:mediacenter ./config/jellyfin-config
