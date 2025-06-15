# PROFILARR

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/Dictionarry-Hub/profilarr) [<img src="https://img.shields.io/github/issues/Dictionarry-Hub/profilarr?color=7842f5">](https://github.com/Dictionarry-Hub/profilarr/issues)

---

## 📖 SYNOPSIS
Profilarr is a configuration management tool for Radarr/Sonarr that automates importing and version control of custom formats and quality profiles. It provides automatic synchronization with remote configuration databases, direct import to Radarr/Sonarr instances, and Git-based version control with conflict resolution.

---

## ✨ MAIN FEATURES
- 🔄 Automatic synchronization with remote configuration databases
- 🎯 Direct import to Radarr/Sonarr instances
- 🔧 Git-based version control of your configurations
- ⚡ Preserve local customizations during updates
- 🛠️ Built-in conflict resolution
- 🌐 Modern web UI for configuration management
- 📊 Real-time monitoring and status updates

---

## 🌟 ADVANTAGES
- Automated configuration management for *arr applications
- Version control for custom formats and quality profiles
- Seamless integration with TRaSH Guides
- Open Source and actively maintained by Dictionarry-Hub
- Currently in beta with active development

---

## 🐳 DOCKER IMAGE DETAILS
- Based on [santiagosayshey/profilarr](https://hub.docker.com/r/santiagosayshey/profilarr)
- **Runs as root** (default container configuration)
- Web UI available on port 6868
- Lightweight container with built-in database

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/profilarr/data/config` | `/config` | Configuration files and database |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | root | User name (default in container) |

---

## 📝 ENVIRONMENT
| Variable | Default value | Description |
| --- | --- | --- |
| `TZ` | Europe/Paris | Timezone |

---

## ⚠️ IMPORTANT
- Currently in beta phase - expect occasional bugs and updates
- Database is case-sensitive - use Docker volumes or WSL filesystem on Windows
- Part of the Dictionarry project ecosystem for media automation

---

## 📚 DOCUMENTATION
- [Complete Setup Guide](https://dictionarry.dev/wiki/profilarr-setup)
- [Official Website](https://dictionarry.dev/)
- [Discord Community](https://discord.com/invite/Y9TYP6jeYZ)

---

## ⚖️ COMPARISON WITH ALTERNATIVES

| Feature | Profilarr | Configarr | Recyclarr | Notifiarr |
| --- | :---: | :---: | :---: | :---: |
| **Web GUI** | ✅ | ❌ | ❌ | ✅ |
| **TRaSH-Guide Custom Formats** | ✅ | ✅ | ✅ | ✅ |
| **TRaSH-Guide CF Groups** | ❌ | ✅ | ✅ | ❌ |
| **TRaSH-Guide Quality Profiles** | ❌ | ✅ | ✅ | ❌ |
| **TRaSH-Guide Quality Sizes** | ✅ | ✅ | ✅ | ✅ |
| **TRaSH-Guide Naming** | ✅ | ✅ | ✅ | ✅ |
| **Custom Custom Formats** | ✅ | ✅ | ❌ | ❌ |
| **Custom Quality Profiles** | ✅ | ✅ | 📝 *templates* | ✅ |
| **Custom Quality Sizes** | ❌ | ✅ | ❌ | ❌ |
| **Custom Naming** | ❌ | ✅ | ❌ | ❌ |
| **Clear all Custom Formats** | ✅ | ✅ | ✅ | ✅ |
| **Modify Scores** | ✅ | ✅ | ✅ | ✅ |
| **Profile Renaming** | ❌ | ✅ | ✅ | ❌ |
| **Profile Cloning** | ❌ | ✅ | ❌ | ❌ |
| **Version Control (Git)** | ✅ | ❌ | ❌ | ❌ |
| **Conflict Resolution** | ✅ | ❌ | ❌ | ❌ |
| **Sonarr v4** | ✅ | ✅ | ✅ | ✅ |
| **Radarr v5** | ✅ | ✅ | ✅ | ✅ |
| **Whisparr Support** | ❌ | ✅ | ❌ | ✅ |
| **Readarr Support** | ❌ | ✅ | ❌ | ✅ |
| **Lidarr Support** | ❌ | ✅ | ❌ | ✅ |
| **Real-time Notifications** | ❌ | ❌ | ❌ | ✅ |
| **Discord Integration** | ❌ | ❌ | ❌ | ✅ |
| **Open Source** | ✅ | ✅ | ✅ | ❌ |
| **Docker/Kubernetes** | ✅ | ✅ | ✅ | ✅ |

**Choose Profilarr if:** You want a user-friendly web interface with Git-based version control, conflict resolution, and visual configuration management.

**Choose Configarr if:** You need maximum customizability, support for all *arr applications, and advanced configuration automation.

**Choose Recyclarr if:** You want the original, battle-tested solution focused on TRaSH-Guides automation for Sonarr/Radarr.

**Choose Notifiarr if:** You prioritize real-time notifications, Discord integration, and web-based management over configuration flexibility.

---

## 💾 SOURCE
* [Dictionarry-Hub/profilarr](https://github.com/Dictionarry-Hub/profilarr)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.

