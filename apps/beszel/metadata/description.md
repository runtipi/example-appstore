# BESZEL

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/henrygd/beszel) [<img src="https://img.shields.io/github/issues/henrygd/beszel?color=7842f5">](https://github.com/henrygd/beszel/issues)

---

## 📖 SYNOPSIS
Beszel is a lightweight server resource monitoring hub with historical data, Docker stats, and alerts. It provides an efficient way to monitor your systems without the overhead of traditional monitoring solutions.

---

## ✨ MAIN FEATURES
- Lightweight and resource-efficient monitoring
- Docker container statistics (CPU and memory usage history)
- Configurable alerts for CPU, memory, disk usage, and system status
- Multi-user support with individual system management
- OAuth/OIDC authentication support (password auth can be disabled)
- Automatic backups to disk or S3-compatible storage
- REST API for custom integrations
- Simple setup with no public exposure required
- Built on top of PocketBase for reliability

---

## 🌟 ADVANTAGES
- Much smaller and less demanding than leading solutions
- Easy setup and configuration
- Secure communication through minimal SSH server
- Active development and modern architecture

---

## 🐳 DOCKER IMAGE DETAILS
- Based on [henrygd/beszel](https://github.com/henrygd/beszel)
- Lightweight and efficient
- Web UI accessible on port 8090
- Built-in PocketBase backend

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/beszel/data` | `/beszel_data` | Beszel data, configuration, and database |

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
| No environment variables required | - | Beszel uses internal configuration |

---

## 📚 DOCUMENTATION
- [Official Documentation](https://github.com/henrygd/beszel/blob/main/README.md)
- [Installation Guide](https://github.com/henrygd/beszel#installation)
- [Agent Setup](https://github.com/henrygd/beszel#agent)
- [API Documentation](https://github.com/henrygd/beszel#api)

---

## 💬 SUPPORT & COMMUNITY
- [GitHub Issues](https://github.com/henrygd/beszel/issues)
- [GitHub Discussions](https://github.com/henrygd/beszel/discussions)
- [Feature Requests](https://github.com/henrygd/beszel/issues/new)

---

## 💾 SOURCE
* [henrygd/beszel](https://github.com/henrygd/beszel)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.
