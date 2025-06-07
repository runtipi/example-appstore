![banner](store.png?raw=true)

# JigSaw ⛺ Runtipi.io Custom AppStore

<p align="center">
  <a href="https://github.com/JigSawFr/tipi-store/actions/workflows/lint.yml"><img alt="CI" src="https://img.shields.io/github/actions/workflow/status/JigSawFr/tipi-store/lint.yml?label=Lint%20CI&logo=githubactions&style=for-the-badge&color=4B8DF8"></a>
  <a href="LICENSE"><img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge"></a>
  <a href="https://github.com/JigSawFr/tipi-store/stargazers"><img alt="Stars" src="https://img.shields.io/github/stars/JigSawFr/tipi-store?style=for-the-badge&logo=star&color=FFD700"></a>
  <a href="https://github.com/JigSawFr/tipi-store/pulls"><img alt="Pull Requests" src="https://img.shields.io/github/issues-pr/JigSawFr/tipi-store?style=for-the-badge&logo=gitbook&color=purple"></a>
  <a href="https://discord.com/channels/976934649643294750/1378139625268314205"><img alt="Discord" src="https://img.shields.io/discord/976934649643294750?label=Discord&logo=discord&style=for-the-badge&color=5865F2"></a>
  <a href="https://github.com/JigSawFr/tipi-store"><img alt="Code Size" src="https://img.shields.io/github/languages/code-size/JigSawFr/tipi-store?style=for-the-badge&color=orange"></a>
  <a href="https://github.com/JigSawFr/tipi-store"><img alt="Top Language" src="https://img.shields.io/github/languages/top/JigSawFr/tipi-store?style=for-the-badge&color=blueviolet"></a>
  <a href="https://github.com/JigSawFr/tipi-store/commits"><img alt="Last Commit" src="https://img.shields.io/github/last-commit/JigSawFr/tipi-store?color=blue&style=for-the-badge"></a>
  <a href="https://github.com/JigSawFr/tipi-store/issues"><img alt="Issues" src="https://img.shields.io/github/issues/JigSawFr/tipi-store?color=7842f5&style=for-the-badge"></a>
</p>

---

## 🚀 Table of Contents
- 📦 [Apps Available](#-apps-available-7-)
- ⚡ [Quick Start](#-quick-start)
- ✨ [Features](#-features)
- 🛠️ [Installation](#️-installation)
- ❓ [FAQ](#-faq)
- 🙏 [Acknowledgements](#-acknowledgements)
- 🏗️ [Built With](#-built-with)

---

## 📦 Apps Available (7)

|  | Name & Docs | Description | Docker Image |
|:---:|:---|:---|:---|
| <img src="apps/byparr/metadata/logo.jpg" width="48" height="48"> | [**Byparr**](https://github.com/ThePhaseless/Byparr)<br/><sub>[Description](apps/byparr/metadata/description.md)</sub> | 🦾 Alternative to Flaresolverr | [ghcr.io/thephaseless/byparr](https://github.com/ThePhaseless/Byparr/pkgs/container/byparr) |
| <img src="apps/homebox/metadata/logo.jpg" width="48" height="48"> | [**HomeBox**](https://github.com/sysadminsmedia/homebox)<br/><sub>[Description](apps/homebox/metadata/description.md)</sub> | 📦 Inventory & organization for home users | [ghcr.io/sysadminsmedia/homebox](https://github.com/sysadminsmedia/homebox/pkgs/container/homebox) |
| <img src="apps/plex/metadata/logo.jpg" width="48" height="48"> | [**Plex**](https://github.com/linuxserver/docker-plex)<br/><sub>[Description](apps/plex/metadata/description.md)</sub> | 🎞️ Media server, secure | [ghcr.io/linuxserver/plex](https://github.com/linuxserver/docker-plex) |
| <img src="apps/prowlarr/metadata/logo.jpg" width="48" height="48"> | [**Prowlarr**](https://github.com/Prowlarr/Prowlarr)<br/><sub>[Description](apps/prowlarr/metadata/description.md)</sub> | 🔎 Indexer, lightweight & secure | [ghcr.io/linuxserver/prowlarr](https://github.com/linuxserver/docker-prowlarr) |
| <img src="apps/radarr/metadata/logo.jpg" width="48" height="48"> | [**Radarr**](https://github.com/Radarr/Radarr)<br/><sub>[Description](apps/radarr/metadata/description.md)</sub> | 🎬 Movies, lightweight & secure | [ghcr.io/11notes/radarr](https://github.com/11notes/docker-radarr) |
| <img src="apps/recyclarr/metadata/logo.jpg" width="48" height="48"> | [**Recyclarr**](https://github.com/recyclarr/recyclarr)<br/><sub>[Description](apps/recyclarr/metadata/description.md)</sub> | ♻️ Sync TRaSH guides | [ghcr.io/recyclarr/recyclarr](https://github.com/recyclarr/recyclarr/pkgs/container/recyclarr) |
| <img src="apps/sonarr/metadata/logo.jpg" width="48" height="48"> | [**Sonarr**](https://github.com/Sonarr/Sonarr)<br/><sub>[Description](apps/sonarr/metadata/description.md)</sub> | 📺 Series, lightweight & secure | [ghcr.io/11notes/sonarr](https://github.com/11notes/docker-sonarr) |

---

## ⚡ Quick Start

```bash
# Add this AppStore to your Runtipi instance
https://github.com/JigSawFr/tipi-store
```

---

## ✨ Features

- 🛡️ **Rootless by default** (runs as 1000:1000, not root)
- 🔒 **Secure, pinned CI/CD** (no upstream supply chain risk)
- 🩺 **Real healthchecks** (not juste port open)
- 🚀 **Auto-update** (latest version always available)
- 📦 **Lightweight images** (smaller than most alternatives)
- 🧩 **Easy to add new apps** (harmonized structure)
- 📝 **Professional, clear documentation**
- 🤝 **Community & Discord support**

---

## 🛠️ Installation

1. In the Runtipi dashboard, open settings and go to the "App Stores" tab.
2. Click "Add App Store" and fill in the form with a nice name and the URL `https://github.com/JigSawFr/tipi-store`.
3. Submit the form. You can now go to the App Store and select the one you just created from the dropdown.
4. Choose an app and install it. Have fun!

> [!WARNING]
> This appstore is a hobby project. I try to keep apps up to date and working, but I can't guarantee support or permanence for any app.

---

## ❓ FAQ

**Q: Why rootless images?**  
A: For security! Running as 1000:1000 avoids privilege escalation risks.

**Q: How to request a new app?**  
A: You cannot formally request new apps, but you can join the discussion and suggest ideas on the [Discord channel](https://discord.com/channels/976934649643294750/1378139625268314205).

**Q: How are images updated?**  
A: Via automated CI/CD and Renovate.

**Q: Where can I find more about Runtipi?**  
A: See the [official website & documentation](https://runtipi.io/) and the [Runtipi GitHub repository](https://github.com/meienberger/runtipi).

---

## 🙏 Acknowledgements

- Thanks to [11notes](https://github.com/11notes), [LinuxServer.io](https://github.com/linuxserver), [ThePhaseless](https://github.com/ThePhaseless), and [recyclarr](https://github.com/recyclarr) for their Docker images and open source work.
- Thanks to all contributors and users!

---

## 🏗️ Built With

<p align="left">
  <a href="https://runtipi.io/"><img src="https://img.shields.io/badge/%E2%9B%BA%20runtipi.io-2C2C32?style=for-the-badge" alt="Runtipi" height="28"/></a>
  <a href="https://www.docker.com/"><img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker" height="28"/></a>
  <a href="https://github.com/features/actions"><img src="https://img.shields.io/badge/GitHub%20Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white" alt="GitHub Actions" height="28"/></a>
  <a href="https://nodejs.org/"><img src="https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white" alt="Node.js" height="28"/></a>
  <a href="https://www.typescriptlang.org/"><img src="https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white" alt="TypeScript" height="28"/></a>
</p>

---

For any questions or issues, open an issue on the official GitHub repository.