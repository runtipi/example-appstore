# TAUTULLI

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/Tautulli/Tautulli) [<img src="https://img.shields.io/github/issues/Tautulli/Tautulli?color=7842f5">](https://github.com/Tautulli/Tautulli/issues)

---

## 📖 SYNOPSIS
Tautulli is a powerful monitoring and tracking tool for Plex Media Server. It provides comprehensive statistics about what has been watched, who watched it, when and where they watched it, all presented in a beautiful web interface.

---

## ✨ MAIN FEATURES
- Responsive web design (desktop, tablet, mobile)
- Real-time monitoring of Plex Media Server activity
- Detailed watching history with search and filtering
- Comprehensive user statistics and information
- Rich analytics with interactive charts and graphs
- Fully customizable notifications for stream activity
- Complete library statistics and media information
- User sync tracking and device monitoring
- Themed to complement Plex/Web interface

---

## 🌟 ADVANTAGES
- Deep insights into your Plex server usage
- Beautiful, intuitive web interface
- Highly customizable notification system
- Active development and community support

---

## 🐳 DOCKER IMAGE DETAILS
- Based on [LinuxServer.io/tautulli](https://github.com/linuxserver/docker-tautulli)
- Alpine-based, secure and lightweight
- Runs as non-root (1000:1000)
- Web UI accessible on port 8181

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/tautulli/data/config` | `/config` | Tautulli config, database, and logs |

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
- [Official Documentation](https://github.com/Tautulli/Tautulli/wiki)
- [Installation Guide](https://github.com/Tautulli/Tautulli/wiki/Installation)
- [Configuration Guide](https://github.com/Tautulli/Tautulli/wiki/Frequently-Asked-Questions)
- [API Documentation](https://github.com/Tautulli/Tautulli/wiki/Tautulli-API-Reference)

---

## 💬 SUPPORT & COMMUNITY
- [Reddit Community](https://www.reddit.com/r/Tautulli/)
- [GitHub Discussions](https://github.com/Tautulli/Tautulli/discussions)
- [Feature Requests](https://github.com/Tautulli/Tautulli/issues)

---

## 💾 SOURCE
* [Tautulli/Tautulli](https://github.com/Tautulli/Tautulli)
* [Official Website](https://tautulli.com/)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.