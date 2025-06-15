# CONFIGARR

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/raydak-labs/configarr) [<img src="https://img.shields.io/github/issues/raydak-labs/configarr?color=7842f5">](https://github.com/raydak-labs/configarr/issues)

---

## 📖 SYNOPSIS
Configarr is an open-source tool designed to simplify configuration and synchronization for Sonarr, Radarr, and other *arr applications. It integrates with TRaSH Guides to automate updates of custom formats, quality profiles, and other settings, while also supporting user-defined configurations.

---

## ✨ MAIN FEATURES
- TRaSH-Guides integration for custom formats synchronization
- Compatible with recyclarr templates
- Support for custom formats in different languages (German, French, etc.)
- Support for Sonarr v4, Radarr v5, Whisparr, Readarr, Lidarr
- Multiple configuration sources (TRaSH-Guides, local files, direct config)
- Flexible deployment options (Docker, Kubernetes)
- YAML configuration with secrets support

---

## 🌟 ADVANTAGES
- Automated configuration management for *arr applications
- Consistent custom formats across all instances
- Open Source and actively maintained by raydak-labs
- Alternative to recyclarr with additional features
- Reduces manual configuration effort

---

## 🐳 DOCKER IMAGE DETAILS
- Based on [raydak-labs/configarr](https://github.com/raydak-labs/configarr)
- TypeScript-based application
- Runs as a one-time execution tool (no persistent web UI)

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/configarr/data/config` | `/app/config` | Configuration files (config.yml, secrets.yml) |
| `/runtipi/app-data/configarr/data/repos` | `/app/repos` | Cached repositories (TRaSH-Guides, etc.) |
| `/runtipi/app-data/configarr/data/cfs` | `/app/cfs` | Custom formats directory |
| `/runtipi/app-data/configarr/data/templates` | `/app/templates` | Templates directory |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `uid` | 1000 | User identifier |
| `gid` | 1000 | Group identifier |

---

## 📝 ENVIRONMENT
| Variable | Default value | Description |
| --- | --- | --- |
| `TZ` | Europe/Paris | Timezone |
| `LOG_LEVEL` | info | Logging level (debug, info, warn, error) |

---

## 📚 DOCUMENTATION
- [Official Documentation](https://configarr.raydak.de/)
- [Configuration Guide](https://configarr.raydak.de/docs/configuration/)
- [Examples](https://configarr.raydak.de/docs/examples/)

---

## ⚖️ COMPARISON WITH ALTERNATIVES

| Feature | Configarr | Recyclarr | Notifiarr | Profilarr |
| --- | :---: | :---: | :---: | :---: |
| **Web GUI** | ❌ | ❌ | ✅ | ✅ |
| **TRaSH-Guide Custom Formats** | ✅ | ✅ | ✅ | ✅ |
| **TRaSH-Guide CF Groups** | ✅ | ✅ | ❌ | ❌ |
| **TRaSH-Guide Quality Profiles** | ✅ | ✅ | ❌ | ❌ |
| **TRaSH-Guide Quality Sizes** | ✅ | ✅ | ✅ | ✅ |
| **TRaSH-Guide Naming** | ✅ | ✅ | ✅ | ✅ |
| **Custom Custom Formats** | ✅ | ❌ | ❌ | ✅ |
| **Custom Quality Profiles** | ✅ | 📝 *templates* | ✅ | ✅ |
| **Custom Quality Sizes** | ✅ | ❌ | ❌ | ❌ |
| **Custom Naming** | ✅ | ❌ | ❌ | ❌ |
| **Clear all Custom Formats** | ✅ | ✅ | ✅ | ✅ |
| **Modify Scores** | ✅ | ✅ | ✅ | ✅ |
| **Profile Renaming** | ✅ | ✅ | ❌ | ❌ |
| **Profile Cloning** | ✅ | ❌ | ❌ | ❌ |
| **Sonarr v4** | ✅ | ✅ | ✅ | ✅ |
| **Radarr v5** | ✅ | ✅ | ✅ | ✅ |
| **Whisparr Support** | ✅ | ❌ | ✅ | ❌ |
| **Readarr Support** | ✅ | ❌ | ✅ | ❌ |
| **Lidarr Support** | ✅ | ❌ | ✅ | ❌ |
| **Real-time Notifications** | ❌ | ❌ | ✅ | ❌ |
| **Discord Integration** | ❌ | ❌ | ✅ | ❌ |
| **Open Source** | ✅ | ✅ | ❌ | ✅ |
| **Docker/Kubernetes** | ✅ | ✅ | ✅ | ✅ |

**Choose Configarr if:** You need maximum customizability, support for all *arr applications, custom formats/profiles creation, and seamless containerized deployment.

**Choose Recyclarr if:** You want the original, battle-tested solution focused on TRaSH-Guides automation for Sonarr/Radarr.

**Choose Notifiarr if:** You prioritize real-time notifications, Discord integration, and web-based management over custom format flexibility.

**Choose Profilarr if:** You want a web-based interface for profile management with custom format support and bulk operations.

---

## 💾 SOURCE
* [raydak-labs/configarr](https://github.com/raydak-labs/configarr)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.


