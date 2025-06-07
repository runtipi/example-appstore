# PLEX

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/linuxserver/docker-plex) [<img src="https://img.shields.io/github/issues/linuxserver/docker-plex?color=7842f5">](https://github.com/linuxserver/docker-plex/issues)

Media server to organize and stream your movies, TV, music, and photos.

---

## 📖 SYNOPSIS
Plex is a powerful media server that organizes your media and streams it to any device, anywhere. It provides a beautiful interface and rich metadata for your entire collection.

---

## ✨ MAIN FEATURES
- Organize and stream movies, TV, music, and photos
- Beautiful web and mobile interfaces
- Remote access and sharing
- Hardware transcoding support

---

## 🌟 ADVANTAGES
- Centralized media management
- Open Source (LinuxServer.io image)
- Actively maintained

---

## 🐳 DOCKER IMAGE DETAILS
- **Runs as root by default** (not rootless)
- **Minimal image size** for fast deployment and low resource usage
- **Based on [linuxserver/plex](https://github.com/linuxserver/docker-plex))**
- Built via a secure, pinned CI/CD process, immune to upstream attacks
- Contains a proper health check to verify the app is actually working
- Auto update feature: the latest version is automatically built and published
- Special thanks to [linuxserver.io](https://github.com/linuxserver) for their original Docker image and their work!

---

## 📁 VOLUMES
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/store/plex/data` | `/config` | Configuration and database |
| `/runtipi/media` | `/data` | Media library |

---

## 🗃️ DEFAULT PARAMETERS
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

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.
