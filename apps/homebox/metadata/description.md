# HOMEBOX

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/sysadminsmedia/homebox) [<img src="https://img.shields.io/github/issues/sysadminsmedia/homebox?color=7842f5">](https://github.com/sysadminsmedia/homebox/issues)

Inventory and organization system for the Home User.

---

## 📖 SYNOPSIS
Homebox is a simple, fast, and portable inventory and organization system for home users. It uses SQLite and an embedded Web UI for easy deployment and backup. Written in Go for minimal resource usage.

---

## ✨ MAIN FEATURES
- Simple and easy to use
- Blazingly fast (Go-based)
- Portable (runs anywhere, uses SQLite)
- Modern web UI
- Minimal setup, no complex configuration

---

## 🌟 ADVANTAGES
- Open Source and actively maintained
- Lightweight and resource-efficient
- Designed for home users

---

## 🐳 DOCKER IMAGE DETAILS
- **Runs as non-root (1000:1000)** for improved security (rootless by default)
- **Minimal image size** for fast deployment and low resource usage
- **Based on [sysadminsmedia/homebox](https://github.com/sysadminsmedia/homebox)**
- Built via a secure, pinned CI/CD process
- Contains a proper health check
- Auto update feature: the latest version is automatically built and published
- Special thanks to [@hay-kot](https://github.com/hay-kot) (project) et [@lakotelman](https://github.com/lakotelman) (logo)

---

## 📁 VOLUMES
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/store/homebox/data` | `/data` | Configuration and database |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `uid` | 1000 | User identifier |
| `gid` | 1000 | Group identifier |

---

## 📝 ENVIRONMENT
| Parameter | Default value | Description |
| --- | --- | --- |
| `TZ` | Europe/Paris | Timezone |
| `HBOX_LOG_LEVEL` | info | Log level |
| `HBOX_LOG_FORMAT` | text | Log format |
| `HBOX_WEB_MAX_UPLOAD_SIZE` | 10 | Max upload size (MB) |
| `HBOX_OPTIONS_ALLOW_REGISTRATION` | false | Allow user registration |

---

## ⚠️ IMPORTANT
- For best experience, see the [official documentation](https://homebox.sysadminsmedia.com/quick-start.html).

---

## 💾 SOURCE
* [sysadminsmedia/homebox](https://github.com/sysadminsmedia/homebox)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on le dépôt GitHub officiel.