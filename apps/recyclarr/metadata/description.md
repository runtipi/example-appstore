# RECYCLARR

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/recyclarr/recyclarr) [<img src="https://img.shields.io/github/issues/recyclarr/recyclarr?color=7842f5">](https://github.com/recyclarr/recyclarr/issues)

Automatically sync TRaSH guides with your Sonarr and Radarr instances.

---

## 📖 SYNOPSIS
Recyclarr automatically synchronizes release profiles, quality definitions, and custom formats from TRaSH guides to Sonarr and Radarr. It handles creation, update, and deletion of profiles as the guides evolve.

---

## ✨ MAIN FEATURES

### Sonarr
- Syncs Release Profiles ("Preferred", "Must Not Contain", "Must Contain")
- Handles "Include Preferred when Renaming" options
- Automatically creates/updates profiles
- Adds custom tags
- Converts negative scores to "Must not contain"
- Supports Anime and regular Series profiles

### Radarr
- Syncs quality definitions for movies
- Syncs custom formats
- Automatically assigns scores
- Automatically deletes obsolete formats

---

## 🌟 ADVANTAGES
- Reliable and automated TRaSH guides sync
- Advanced customization of scores and profiles
- Compatible with Sonarr ≥ 3.0.4.1098
- Open Source and actively maintained

---

## 📁 VOLUMES
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/store/recyclarr/data` | `/config` | Configuration and database |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `uid` | 1000 | User identifier |
| `gid` | 1000 | Group identifier |

---

## 📝 ENVIRONMENT
| Parameter | Default value |
| --- | --- |
| `TZ` | Europe/Paris |

---

## ⚠️ IMPORTANT
- For Sonarr, use version ≥ 3.0.4.1098.
- Do not use Notifiarr Trash Guides Integration at the same time as Recyclarr to avoid sync conflicts.

---

## 💾 SOURCE
* [recyclarr/recyclarr](https://github.com/recyclarr/recyclarr)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.