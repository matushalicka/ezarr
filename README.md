# EZARR

Ezarr is a project built to make it EZ to deploy a Servarr mediacenter. It features:
- [Sonarr](https://sonarr.tv/) is an application to manage TV shows. It is capable of keeping track
  of what you'd like to watch, at what quality, in which language and more, and can find a place to
  download this if connected to Prowlarr and qBittorrent. It can also reorganize the media you
  already own in order to create a more uniformly formatted collection.
- [Radarr](https://radarr.video/) is like Sonarr, but for movies.
- [Prowlarr](https://github.com/Prowlarr/Prowlarr) can keep track of indexers, which are services that
  keep track of Torrent or UseNet links. One can search an indexer for certain content and find a
  where to download this. **Note**: when adding an indexer, please do not set the "seed ratio" to
  less than 1. Less than 1 means that you upload less than you download. Not only is this
  unfriendly towards your fellow users, but it can also get you banned from certain indexers.
- [qBittorrent](https://www.qbittorrent.org/) can download torrents and provides a bunch more
  features for management.
- [Jellyfin](https://jellyfin.org/) is a Free Software Media System that puts you in control of managing and streaming your media. It is an alternative to the proprietary Emby and Plex, to provide media from a dedicated server to end-user devices via multiple apps.
- [FlareSolverr](https://github.com/FlareSolverr/FlareSolverrFlareSolverr) is a proxy server to bypass Cloudflare and DDoS-GUARD protection.
- [Bazarr](https://www.bazarr.media/) is a companion application to Sonarr and Radarr that manages and downloads subtitles based on your requirements.
- [Whisper ASR Webservice](https://github.com/ahmetoner/whisper-asr-webservice/) is a general-purpose speech recognition model. It is trained on a large dataset of diverse audio and is also a multitask model that can perform multilingual speech recognition as well as speech translation and language identification.

## Using
1. To get started, clone the repository in a directory of your choosing. **Note: this will be where
   your installation and media will be as well, so think about this a bit.**
2. Set the environment variables to your liking.
3. Run `setup.sh` as superuser. This will set up your users, a system of directories, ensure
   permissions are set correctly and sets some more environment variables for docker compose.
4. Run `docker compose up`.

That's it! Your containers are now up and you can continue to set up the settings in them. Please
take a look at [important notes](#important-notes) before you continue.

## Important notes
- I forked this for my personal use. Don't expect any updates or bugfixes.
- When linking one service to another, remember to use the container name instead of `localhost`.
- Please set the settings of the -arr containers as soon as possible to the following (use
  advanced):
  - Media management:
    - Use hardlinks instead of Copy: `true`
    - Root folder: `/data/media/` and then tv, movies or music depending on service
  - Make sure to set a username and password for all servarr services and qBittorrent!
- In qBittorrent, after connecting it to the -arr services, you can indicate it should move
  torrents in certain categories to certain directories, like torrents in the `radarr` category
  to `/data/torrents/movies`. You should do this. Also set the `Default Save Path` to
  `/data/torrents`. Set "Run external program on torrent completion" to true and enter this in the
  field: `chmod -R 775 "%F/"`.
- You'll have to add indexers in Prowlarr by hand. Use Prowlarrs settings to connect it to the
  other -arr apps.

## FAQ

### Why do I need to set some settings myself, can that be added?
Some settings, particularly for the Servarr suite, are set in databases. While it *might* be
possible to interact with this database after creation, I'd rather not touch these. It's not
that difficult to set them yourself, and quite difficult to do it automatically. For other
containers, configuration files are automatically generated, so these are more easily edited,
but I currently don't believe this is worth the effort.

On top of the above, connecting the containers above would mean setting a password and creating an
API key for all of them. This would lead to everyone using Ezarr having the same API key and user/
password combination. Personally, I'd rather trust users to figure this out on their own rather
than trusting them to change these passwords and keys.
