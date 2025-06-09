# BESZEL AGENT

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/henrygd/beszel) [<img src="https://img.shields.io/github/issues/henrygd/beszel?color=7842f5">](https://github.com/henrygd/beszel/issues)

---

## 📖 SYNOPSIS
Beszel Agent is the monitoring component that runs on each system you want to monitor with Beszel. It communicates system metrics to the Beszel hub through a secure, minimal SSH server and provides Docker container statistics.

---

## ✨ MAIN FEATURES
- Lightweight system monitoring agent
- Real-time system metrics collection (CPU, memory, disk usage)
- Docker container statistics monitoring
- Secure communication through minimal SSH server
- Low resource footprint and minimal dependencies
- Easy setup with key-based authentication
- Network mode host for accurate system monitoring
- Read-only Docker socket access for container stats

---

## 🌟 ADVANTAGES
- Minimal resource usage on monitored systems
- Secure communication with Beszel hub
- No GUI required - runs as background service
- Easy configuration with single key parameter

---

## 🐳 DOCKER IMAGE DETAILS
- Based on [henrygd/beszel-agent](https://github.com/henrygd/beszel)
- Lightweight monitoring agent
- Runs on port 45876
- Network mode: host for system monitoring

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/var/run/docker.sock` | `/var/run/docker.sock` | Docker socket access (read-only) |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | docker | User name |
| `port` | 45876 | Agent communication port |
| `network_mode` | host | Required for system monitoring |

---

## 📝 ENVIRONMENT
| Variable | Default value | Description |
| --- | --- | --- |
| `PORT` | 45876 | Agent listening port |
| `KEY` | Required | Beszel authentication key (provided by hub) |

---

## 🔧 CONFIGURATION
To use Beszel Agent, you need to:
1. First install and configure the Beszel hub
2. Add a new server in the Beszel hub interface
3. Copy the generated key from the hub
4. Enter this key when installing the Beszel Agent

---

## 📚 DOCUMENTATION
- [Official Documentation](https://github.com/henrygd/beszel/blob/main/README.md)
- [Agent Setup Guide](https://github.com/henrygd/beszel#agent)
- [Installation Instructions](https://github.com/henrygd/beszel#installation)

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
