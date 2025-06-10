# AUTOBRR

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/autobrr/autobrr) [<img src="https://img.shields.io/github/issues/autobrr/autobrr?color=7842f5">](https://github.com/autobrr/autobrr/issues)

---

## 📖 SYNOPSIS
Autobrr is the modern download automation tool for torrents. With inspiration from tools like trackarr, autodl-irssi and flexget, it monitors IRC announce channels in real-time to grab torrents as soon as they're uploaded, helping you join the initial swarm faster.

---

## ✨ MAIN FEATURES
- Support for 60+ trackers with IRC announces
- Torznab/RSS support via Prowlarr for hundreds of trackers
- Powerful filtering with RegEx support
- Mobile-friendly web UI with dark mode
- Built on Go and React (lightweight and cross-platform)
- Multiple download client support (qBittorrent, Deluge, rTorrent, Transmission)
- Direct integration with *arr apps (Sonarr, Radarr, Lidarr, Whisparr, Readarr)
- Watch folder and custom script execution
- Webhook support and notifications (Discord, Telegram, Notifiarr)
- Database support (PostgreSQL and SQLite)

---

## 🌟 ADVANTAGES
- Join torrents earlier than RSS-based tools
- Maintain better tracker ratios through faster seeding
- Real-time monitoring of IRC announce channels
- Active development with modern architecture

---

## 🐳 DOCKER IMAGE DETAILS
- Based on [ghcr.io/s0up4200/autobrr-distroless](https://github.com/autobrr/autobrr)
- Distroless, secure and lightweight
- Runs as nobody user
- Web UI accessible on port 7474

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/autobrr/data/autobrr` | `/config` | Autobrr config, database, and filters |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | nobody | User identifier |
| `port` | 7474 | Web UI port |

---

## 📝 ENVIRONMENT
| Variable | Default value | Description |
| --- | --- | --- |
| `TZ` | Europe/Paris | Timezone |

---

## 📚 DOCUMENTATION
- [Official Documentation](https://autobrr.com/)
- [Installation Guide](https://autobrr.com/installation)
- [Configuration Guide](https://autobrr.com/configuration)
- [Filters Setup](https://autobrr.com/filters)

---

## 💬 SUPPORT & COMMUNITY
- [Discord Server](https://discord.gg/WQ2eUycxyT)
- [GitHub Discussions](https://github.com/autobrr/autobrr/discussions)
- [Feature Requests](https://github.com/autobrr/autobrr/issues)

---

## 💾 SOURCE
* [autobrr/autobrr](https://github.com/autobrr/autobrr)
* [Official Website](https://autobrr.com/)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.
