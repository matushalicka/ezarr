#!/bin/bash

source .env

# Make users and group
sudo useradd -u 13001 -s /bin/bash sonarr
sudo useradd -u 13002 -s /bin/bash radarr
sudo useradd -u 13006 -s /bin/bash prowlarr
sudo useradd -u 13007 -s /bin/bash qbittorrent
sudo useradd -u 13011 -s /bin/bash sabnzbd
sudo useradd -u 13013 -s /bin/bash bazarr
sudo groupadd -g 13000 mediacenter
sudo usermod -a -G mediacenter sonarr
sudo usermod -a -G mediacenter radarr
sudo usermod -a -G mediacenter prowlarr
sudo usermod -a -G mediacenter qbittorrent
sudo usermod -a -G mediacenter sabnzbd
sudo usermod -a -G mediacenter bazarr

# Make directories
sudo mkdir -pv ./config/{sonarr,radarr,prowlarr,qbittorrent,jellyfin,sabnzbd,bazarr,recyclarr}-config
sudo mkdir -pv ${ROOT_DIR}/data/movies/{torrents,usenet,media}
sudo mkdir -pv ${ROOT_DIR_2}/data/tv/{torrents,usenet,media}

# Set permissions
sudo chmod -R 775 ${ROOT_DIR}/data
sudo chown -R ${M_UID}:mediacenter ${ROOT_DIR}/data
sudo chmod -R 775 ${ROOT_DIR_2}/data
sudo chown -R ${M_UID}:mediacenter ${ROOT_DIR_2}/data
sudo chown -R ${M_UID}:mediacenter ./config
sudo chown -R ${M_UID}:mediacenter ./data
sudo chown -R sonarr:mediacenter ./config/sonarr-config
sudo chown -R radarr:mediacenter ./config/radarr-config
sudo chown -R prowlarr:mediacenter ./config/prowlarr-config
sudo chown -R qbittorrent:mediacenter ./config/qbittorrent-config
sudo chown -R ${M_UID}:mediacenter ./config/jellyfin-config
sudo chown -R bazarr:mediacenter ./config/bazarr-config
sudo chown -R sabnzbd:mediacenter config/sabnzbd-config
sudo chown -R ${M_UID}:mediacenter ./config/recyclarr-config

