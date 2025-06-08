# HUNTARR

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/plexguide/Huntarr) [<img src="https://img.shields.io/github/issues/plexguide/Huntarr?color=7842f5">](https://github.com/plexguide/Huntarr/issues)

---

## 📖 SYNOPSIS
Huntarr automates the search for missing and low-quality content in your media libraries (Sonarr, Radarr, Lidarr, Readarr). It runs continuously, gently querying your indexers to help you complete your collection and upgrade quality, all with a modern web UI for real-time monitoring and configuration.

---

## ✨ MAIN FEATURES
- Continuous automation: missing content & quality upgrades
- Smart selection: random/sequential, batch size, skip metadata refresh
- Persistent state with auto-reset
- Real-time log viewer and statistics dashboard
- Full web UI for settings and monitoring
- Large library support (pagination, batching)

---

## 🌟 ADVANTAGES
- Set-and-forget automation for your *arr ecosystem
- Reduces manual searching and indexer load
- Open Source and actively maintained

---

## 🐳 DOCKER IMAGE DETAILS
- Based on [plexguide/Huntarr](https://github.com/plexguide/Huntarr)
- Minimal image, easy deployment
- Web UI and API on port 9705

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/huntarr/data/config` | `/config` | App config & persistent state |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | docker | User name |

---

## 📝 ENVIRONMENT
| Variable | Default value | Description |
| --- | --- | --- |
| `TZ` | Europe/Paris | Timezone |

---

## 📚 DOCUMENTATION
- [Official Wiki](https://github.com/plexguide/Huntarr/wiki)

---

## 💾 SOURCE
* [plexguide/Huntarr](https://github.com/plexguide/Huntarr)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.

