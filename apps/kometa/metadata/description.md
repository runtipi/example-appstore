# KOMETA

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/Kometa-Team/Kometa) [<img src="https://img.shields.io/github/issues/Kometa-Team/Kometa?color=7842f5">](https://github.com/Kometa-Team/Kometa/issues)

---

## 📖 SYNOPSIS
Kometa is a powerful automation tool for Plex and other media servers. It lets you create, update, and manage collections, overlays, and playlists using modular YAML configs, with deep integration for TMDb, Trakt, IMDb, Sonarr, Radarr, and more. Kometa brings your media library to life with beautiful artwork, smart collections, and automated metadata management.

---

## ✨ MAIN FEATURES
- Automated creation of collections, overlays, and playlists for Plex
- Integrates with TMDb, Trakt, IMDb, Sonarr, Radarr, and more
- Modular YAML configuration (Kometa Defaults & Community Configs)
- Custom artwork, summaries, titles, and overlays
- Batch updates and scheduled runs
- No GUI: configuration via files, logs via console

---

## 🌟 ADVANTAGES
- Save hours of manual curation
- Always up-to-date collections and overlays
- Community-driven: share and use configs from others
- Open Source and actively maintained

---

## 🐳 DOCKER IMAGE DETAILS
- Based on [Kometa-Team/Kometa](https://github.com/Kometa-Team/Kometa)
- Minimal image, easy deployment
- Runs as non-root (1000:1000)
- No web UI: configuration via YAML files

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/kometa/data/config` | `/config` | Kometa config, logs, and state |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | docker | User name |
| `uid` | 1000 | User identifier |
| `gid` | 1000 | Group identifier |

---

## 📝 ENVIRONMENT
| Variable | Default value | Description |
| --- | --- | --- |
| `PUID` | 1000 | User ID (container permissions) |
| `PGID` | 1000 | Group ID (container permissions) |
| `TZ` | Europe/Paris | Timezone |
| `KOMETA_CONFIG` | /config/config.yml | Path to Kometa config file |
| `KOMETA_TIME` | 02:00 | Schedule time (HH:MM) |
| `KOMETA_RUN` | false | Run Kometa immediately (true/false) |
| `KOMETA_TEST` | false | Run in test mode (true/false) |
| `KOMETA_NO_MISSING` | false | Skip missing items (true/false) |
| `KOMETA_DEBUG` | false | Enable debug logging |
| `KOMETA_TRACE` | false | Enable trace logging |
| `KOMETA_LOG_REQUESTS` | false | Log HTTP requests |
| `KOMETA_TIMEOUT` | 180 | Request timeout (seconds) |
| `KOMETA_NO_VERIFY_SSL` | false | Disable SSL verification |
| `KOMETA_COLLECTIONS_ONLY` | false | Only process collections |
| `KOMETA_METADATA_ONLY` | false | Only process metadata |
| `KOMETA_PLAYLISTS_ONLY` | false | Only process playlists |
| `KOMETA_OPERATIONS_ONLY` | false | Only process operations |
| `KOMETA_OVERLAYS_ONLY` | false | Only process overlays |
| `KOMETA_IGNORE_SCHEDULES` | false | Ignore schedules |
| `KOMETA_IGNORE_GHOST` | false | Ignore ghost items |
| `KOMETA_DELETE_COLLECTIONS` | false | Delete collections |
| `KOMETA_DELETE_LABELS` | false | Delete labels |
| `KOMETA_NO_REPORT` | false | Disable report generation |

---

## 📚 DOCUMENTATION
- [Official Wiki](https://kometa.wiki/)
- [Install Guide](https://kometa.wiki/en/latest/kometa/install/overview/)
- [Kometa Defaults](https://kometa.wiki/en/latest/defaults/guide/)
- [Community Configs](https://github.com/Kometa-Team/Community-Configs)

---

## 💬 SUPPORT & COMMUNITY
- [Discord Support Server](https://kometa.wiki/en/latest/discord/)
- [Feature Requests](https://features.kometa.wiki/features)
- [Discussions](https://github.com/Kometa-Team/Kometa/discussions)

---

## 💾 SOURCE
* [Kometa-Team/Kometa](https://github.com/Kometa-Team/Kometa)
* [Kometa Wiki](https://kometa.wiki/)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.