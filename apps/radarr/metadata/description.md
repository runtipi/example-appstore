# RADARR

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/Radarr/Radarr) [<img src="https://img.shields.io/github/issues/Radarr/Radarr?color=7842f5">](https://github.com/Radarr/Radarr/issues)

Movie collection manager for Usenet and BitTorrent users.

---

## 📖 SYNOPSIS
Radarr is a movie collection manager that automates the downloading, sorting, and renaming of movies from Usenet and BitTorrent. It monitors RSS feeds for new movies and upgrades existing files when better quality is available.

---

## ✨ MAIN FEATURES
- Monitors multiple RSS feeds for new movies
- Automatic download, sorting, and renaming
- Quality upgrades for existing files
- Modern web UI

---

## 🌟 ADVANTAGES
- Automated movie management
- Open Source and actively maintained

---

## 🐳 DOCKER IMAGE DETAILS
- **Runs as non-root (1000:1000)** for improved security (rootless by default)
- **Minimal image size** for fast deployment and low resource usage
- **Based on [11notes/radarr](https://github.com/11notes/docker-radarr))**
- Built via a secure, pinned CI/CD process, immune to upstream attacks
- Contains a proper health check to verify the app is actually working
- Works as read-only, most other images need to write files to the image filesystem
- Auto update feature: the latest version is automatically built and published
- Special thanks to [11notes](https://github.com/11notes) for his original Docker image and his work!

---

## 📁 VOLUMES
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/store/radarr/data` | `/config` | Configuration and database |
| `/runtipi/media` | `/media` | Media library |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | docker | User name |
| `uid` | 1000 | User identifier |
| `gid` | 1000 | Group identifier |
| `home` | /radarr | Home directory of user docker |

---

## 📝 ENVIRONMENT
| Parameter | Default value | Description |
| --- | --- | --- |
| `TZ` | [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | Timezone |
| `DEBUG` |  | Will activate debug option for container image and app (if available) |

---

## ⚠️ IMPORTANT
- For best experience, use with Prowlarr and Sonarr.

---

## 💾 SOURCE
* [Radarr/Radarr](https://github.com/Radarr/Radarr)
* [11notes/docker-radarr](https://github.com/11notes/docker-radarr)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.
