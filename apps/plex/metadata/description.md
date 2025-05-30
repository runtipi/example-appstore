## Stream Movies & TV Shows

Plex Media Server is a digital media player and organizational tool that allows you to access the music, pictures, and videos stored on one computer with any other computer or compatible mobile device. You can install the Plex Media Server software on a Windows, Mac, or Linux computer, or a compatible network-attached storage (NAS) device, then play it back on any other internet-connected device capable of running the Plex app.

Use any compatible device to watch movies, listen to music, and view pictures stored on a computer that runs Plex Media Server. Access media files stored on your Plex Media Server computer remotely over the internet. Allow friends and family to access your movies, music, and pictures over the internet. 

## Folder Info

| Root Folder                           | Container Folder |
|---------------------------------------|------------------|
| /runtipi/app-data/plex/data/config    | /config          |
| /runtipi/app-data/plex/data/transcode | /transcode       |
| /runtipi/media/data                   | /media           |

# PLEX


Run Plex more secure

# SYNOPSIS 📖
**What can I do with this?** Plex Media Server is a digital media player and organizational tool that allows you to access the music, pictures, and videos stored on one computer with any other computer or compatible mobile device. You can install the Plex Media Server software on a Windows, Mac, or Linux computer, or a compatible network-attached storage (NAS) device, then play it back on any other internet-connected device capable of running the Plex app.

Use any compatible device to watch movies, listen to music, and view pictures stored on a computer that runs Plex Media Server. Access media files stored on your Plex Media Server computer remotely over the internet. Allow friends and family to access your movies, music, and pictures over the internet. 

# UNIQUE VALUE PROPOSITION 💶
**Why should I run this image and not the other image(s) that already exist?** Good question! All the other images on the market that do exactly the same don’t do or offer these options:

>* This image runs as 1000:1000 by default, most other images run everything as root
>* This image is created via a secure, pinned CI/CD process and immune to upstream attacks, most other images have upstream dependencies that can be exploited
>* This image contains a proper health check that verifies the app is actually working, most other images have either no health check or only check if a port is open or ping works
>* This repository has an auto update feature that will automatically build the latest version if released, most other providers don't do this
>* This image is smaller than most other images

# COMPARISON 🏁
Below you find a comparison between this image and the most used or original one.

| **image** | hotio/plex:1.41.7 | linuxserver/plex:1.41.7 |
| ---: | :---: | :---: |
| **image size on disk** | 192MB | 156MB |
| **process UID/GID** | 0/0 | 1000/1000 |
| **distroless?** | ❌ | ❌ |
| **rootless?** | ❌ | ❌ |

# VOLUMES 📁

| Mounted folder                                       | Container folder |  Comments |
|---------------------------------------|------------------|-------------------|
| `/runtipi/app-data/`**store**`/plex/data/config`   | `/config`          | directory of all your settings and database
| `/runtipi/app-data/`**store**`/plex/data/transcode`   | `/transcode`          | directory of transcoding cache
| `/runtipi/media/data`   | `/data`          | directory of medias


# DEFAULT SETTINGS 🗃️
| Parameter | Value | Description |
| --- | --- | --- |
| `uid` | 1000 | [user identifier](https://en.wikipedia.org/wiki/User_identifier) |
| `gid` | 1000 | [group identifier](https://en.wikipedia.org/wiki/Group_identifier) |
| `home` | /config | home directory of user docker |

# ENVIRONMENT 📝
| Parameter | Value | Default |
| --- | --- | --- |
| `TZ` | [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | |
| `PUID` | for UserID | `1000` |
| `PGID` | for GroupID | `1000` |
| `VERSION` | Set whether to update plex or not | `docker` |
| `PLEX_CLAIM` | Optionally you can obtain a claim token from https://plex.tv/claim and input here. Keep in mind that the claim tokens expire within 4 minutes.|  |

# SOURCE 💾
* [linuxserver/docker-plex](https://github.com/linuxserver/docker-plex)

# PARENT IMAGE 🏛️
* [linuxserver/docker-baseimage-ubuntu](https://github.com/linuxserver/docker-baseimage-ubuntu)

# BUILT WITH 🧰
* [plexinc/pms-docker](https://github.com/plexinc/pms-docker)
* [linuxserver/docker-unrar](https://github.com/linuxserver/docker-unrar)

# DISCLAIMER™️
This image is provided to you at your own risk. Always make backups before updating an image to a different version. Check the releases for breaking changes.
