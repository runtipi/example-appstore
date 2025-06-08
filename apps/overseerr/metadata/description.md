# OVERSEERR

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/sct/overseerr) [<img src="https://img.shields.io/github/issues/sct/overseerr?color=7842f5">](https://github.com/sct/overseerr/issues)

---

## 📖 SYNOPSIS
Overseerr is a modern web application to manage movie and TV show requests for your Plex server. It offers a user-friendly interface, granular permission management, and full integration with Plex, Sonarr, and Radarr.

---

## ✨ MAIN FEATURES
- Modern, mobile-friendly UI with beautiful design
- Full Plex integration (authentication, library scan)
- Multi-server Sonarr/Radarr support (including 4K)
- Customizable request system (movies, seasons, quality profiles)
- Granular per-user permission management
- Multiple notification agents (email, Discord, Pushbullet, Slack, Telegram, etc.)
- Configurable request limits and quotas
- Supports both local and Plex OAuth users
- RESTful API with full documentation

---

## 🌟 ADVANTAGES
- Save time with automated request management
- Beautiful, intuitive user experience
- Active development and community support
- Open Source and well-documented

---

## 🐳 DOCKER IMAGE DETAILS
- Based on [LinuxServer.io/overseerr](https://github.com/linuxserver/docker-overseerr)
- Alpine-based, secure and lightweight
- Runs as non-root (1000:1000)
- Web UI accessible on port 5055

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/overseerr/data/config` | `/config` | Overseerr config, database, and logs |

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

---

## 📚 DOCUMENTATION
- [Official Documentation](https://docs.overseerr.dev/)
- [Installation Guide](https://docs.overseerr.dev/getting-started/installation)
- [Configuration Guide](https://docs.overseerr.dev/getting-started/configuration)
- [API Documentation](https://api-docs.overseerr.dev/)

---

## 💬 SUPPORT & COMMUNITY
- [Discord Support Server](https://discord.gg/sZNaxsb6tc)
- [GitHub Discussions](https://github.com/sct/overseerr/discussions)
- [Feature Requests](https://github.com/sct/overseerr/issues)

---

## 💾 SOURCE
* [sct/overseerr](https://github.com/sct/overseerr)
* [Official Website](https://overseerr.dev/)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.