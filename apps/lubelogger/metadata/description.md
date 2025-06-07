# LUBELOGGER

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/hargata/lubelog) [<img src="https://img.shields.io/github/issues/hargata/lubelog?color=7842f5">](https://github.com/hargata/lubelog/issues)

Self-hosted, open-source, collaborative Vehicle Maintenance and Fuel Mileage Tracker.

---

## 📖 SYNOPSIS
LubeLogger is a self-hosted web app to track vehicle maintenance, fuel consumption, and costs. It replaces homemade spreadsheets and piles of receipts with a modern, collaborative, and accessible interface.

---

## ✨ MAIN FEATURES
- Collaborative maintenance and fuel tracking
- Modern, responsive web interface
- Multi-vehicle management
- Statistics, charts, and PDF reports
- Email notifications (SMTP)
- Local or OpenID authentication
- CSV import/export
- Custom logo and welcome message

---

## 🌟 ADVANTAGES
- Open source, self-hosted, no cloud
- Lightweight, easy Docker install
- Multi-user, multi-platform
- Online demo available

---

## 🐳 DOCKER IMAGE DETAILS
- **Runs as non-root (1000:1000)** for security
- **Lightweight image** for fast deployment
- **Based on [hargata/lubelog](https://github.com/hargata/lubelog)**
- Secure CI/CD, automatic updates
- Thanks to [hargata](https://github.com/hargata) for the original project

---

## 📁 VOLUMES
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/store/lubelogger/data` | `/data` | Data, config, documents |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `uid` | 1000 | User ID |
| `gid` | 1000 | Group ID |

---

## 📝 ENVIRONMENT
| Variable | Default | Description |
| --- | --- | --- |
| `LUBELOGGER_LOCALE` | en_US.UTF-8 | Locale for dates, numbers, currencies |
| `LUBELOGGER_ALLOWED_FILE_EXTENSIONS` | pdf | Allowed file extensions |
| `LUBELOGGER_CUSTOM_LOGO_URL` |  | Custom logo |
| `LUBELOGGER_MOTD` |  | Welcome message |
| `LUBELOGGER_WEBHOOK_URL` |  | Webhook URL |
| `LUBELOGGER_EMAIL_SERVER` |  | SMTP server |
| `LUBELOGGER_EMAIL_FROM` |  | Email sender |
| `LUBELOGGER_EMAIL_USE_SSL` | false | Email SSL |
| `LUBELOGGER_EMAIL_PORT` | 587 | SMTP port |
| `LUBELOGGER_EMAIL_USERNAME` |  | SMTP user |
| `LUBELOGGER_EMAIL_PASSWORD` |  | SMTP password |
| `LUBELOGGER_ENABLE_AUTH` | false | Enable authentication |
| `LUBELOGGER_USERNAME_HASH` |  | Root user hash |
| `LUBELOGGER_PASSWORD_HASH` |  | Root password hash |
| `LUBELOGGER_OPENID_*` |  | OpenID settings (see docs) |

---

## ⚠️ IMPORTANT
- Online demo: [demo.lubelogger.com](https://demo.lubelogger.com) (test/1234, resets every 20 min)
- Documentation: [docs.lubelogger.com](https://docs.lubelogger.com/)
- Troubleshooting: [Troubleshooting](https://docs.lubelogger.com/Troubleshooting)

---

## 💾 SOURCE
* [hargata/lubelog](https://github.com/hargata/lubelog)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.