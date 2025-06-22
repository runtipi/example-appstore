# SWAPARR

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/ThijmenGThN/swaparr) [<img src="https://img.shields.io/github/issues/ThijmenGThN/swaparr?color=7842f5">](https://github.com/ThijmenGThN/swaparr/issues)

Stalled download cleaning utility for *arr applications.

---

## 📖 SYNOPSIS
Swaparr is a stalled download cleaning utility designed for the *arr ecosystem. It automatically monitors and removes stalled, failed, or problematic downloads from Sonarr, Radarr, Lidarr, Readarr, and other *arr applications. Built to solve the common problem of downloads that appear active but haven't made progress.

---

## ✨ MAIN FEATURES
- Smart detection of truly stalled downloads vs. slow but progressing ones
- Configurable strike system before taking action
- Dry run mode for safe configuration testing
- Automatic removal of problematic downloads
- Comprehensive logging and monitoring

---

## 🌟 ADVANTAGES
- Automated cleanup of stalled downloads
- Open Source and actively maintained
- Safe operation with multiple safety checks

---

## 🐳 DOCKER IMAGE DETAILS
- **Runs as non-root (1000:1000)** for improved security (rootless by default)
- **Minimal image size** for fast deployment and low resource usage
- **Based on [ThijmenGThN/swaparr](https://github.com/ThijmenGThN/swaparr)**
- Built via a secure, pinned CI/CD process, immune to upstream attacks
- Contains a proper health check to verify the app is actually working
- Auto update feature: the latest version is automatically built and published
- Special thanks to [ThijmenGThN](https://github.com/ThijmenGThN) for his original work!

---

## 📁 VOLUMES
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/swaparr/data` | `/app/data` | Application data and configuration |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | swaparr | User name |
| `uid` | 1000 | User identifier |
| `gid` | 1000 | Group identifier |
| `home` | /app | Home directory of user docker |

---

## 📝 ENVIRONMENT
| Parameter | Default value | Description |
| --- | --- | --- |
| `TZ` | Europe/Paris | Timezone |
| `BASEURL` |  | URL to your *arr application (Required) |
| `APIKEY` |  | API key for *arr authentication (Required) |
| `PLATFORM` | sonarr | *arr platform type (sonarr, radarr, lidarr, readarr) |
| `MAX_STRIKES` | 3 | Number of strikes before removal |
| `SCAN_INTERVAL` | 10m | Time between monitoring cycles |
| `MAX_DOWNLOAD_TIME` | 2h | Maximum time before considering stalled |
| `IGNORE_ABOVE_SIZE` | 25GB | Skip downloads larger than this size |
| `REMOVE_FROM_CLIENT` | true | Also remove from download client |
| `DRY_RUN` | true | Test mode without actual removal |

---

## ⚠️ IMPORTANT
- Configure API access to your *arr applications before use.
- Start with dry run mode enabled for safe testing.
- Monitor logs during initial setup to verify correct operation.

---

## 💾 SOURCE
* [ThijmenGThN/swaparr](https://github.com/ThijmenGThN/swaparr)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by the community for the *arr ecosystem.

---

For any questions or issues, open an issue on the official GitHub repository.
