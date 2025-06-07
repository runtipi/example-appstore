# BYPARR

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/ThePhaseless/Byparr) [<img src="https://img.shields.io/github/issues/ThePhaseless/Byparr?color=7842f5">](https://github.com/ThePhaseless/Byparr/issues)

Alternative to FlareSolverr, built with SeleniumBase and FastAPI. Drop-in replacement for bypassing anti-bot challenges.

---

## 📖 SYNOPSIS
Byparr is a lightweight, rootless, and secure solution to bypass browser challenges (like Cloudflare) for your applications. It leverages SeleniumBase and FastAPI to provide a simple API for solving captchas and browser checks.

---

## ✨ MAIN FEATURES
- Drop-in replacement for FlareSolverr
- Headless Chromium support
- FastAPI-powered API with documentation at `/docs`
- Proxy support (HTTP/SOCKS)
- ARM support (limited)

---

## 🌟 ADVANTAGES
- Secure and rootless by default
- Community-driven and open source
- Lightweight and fast
- Easy to deploy and maintain
- Actively maintained and documented

---

## 🐳 DOCKER IMAGE DETAILS
- **Runs as non-root (1000:1000)** for improved security (rootless by default)
- **Minimal image size** for fast deployment and low resource usage
- **Based on [ThePhaseless/Byparr](https://github.com/ThePhaseless/Byparr))**
- Built via a secure, pinned CI/CD process, immune to upstream attacks
- Contains a proper health check to verify the app is actually working
- Auto update feature: the latest version is automatically built and published
- Special thanks to [ThePhaseless](https://github.com/ThePhaseless) for his original Docker image and his work!

---

## 📁 VOLUMES
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/store/byparr/data` | `/config` | Configuration and logs |

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
| `TZ` | [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | Timezone |
| `USE_HEADLESS` | SeleniumBase default | Use headless Chromium |
| `PROXY` | None | Proxy in format: `protocol://username:password@host:port` |

---

## ⚠️ IMPORTANT
- This tool increases the chance of bypassing browser challenges, but does not guarantee success for all sites.
- ARM support is experimental.
- For troubleshooting, check the API docs at `/docs` and the GitHub issues.

---

## 💾 SOURCE
* [ThePhaseless/Byparr](https://github.com/ThePhaseless/Byparr)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.
