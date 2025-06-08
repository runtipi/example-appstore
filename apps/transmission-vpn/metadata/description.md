# TRANSMISSION (VPN)

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/haugene/docker-transmission-openvpn) [<img src="https://img.shields.io/github/issues/haugene/docker-transmission-openvpn?color=7842f5">](https://github.com/haugene/docker-transmission-openvpn/issues)

---

## 📖 SYNOPSIS
Transmission runs only when OpenVPN has an active tunnel. It supports many popular VPN providers for easy setup and is ideal for secure, private torrenting. Choose your Web UI, works with traefik, and is highly customizable.

---

## 🛡️ VPN PROVIDER COMPARISON

![https://airvpn.org/?referred_by=674291](https://airvpn.org/images/promotional/banner_641x91.gif)

| VPN Provider | Port Forwarding | Works? |
|--------------|-----------------|--------|
| [AirVPN](https://airvpn.org/?referred_by=674291) | **Yes** | **Yes** |
| [ProtonVPN](https://protonvpn.com/fr) | **Yes** | N.C. |
| [NordVPN](https://ref.nordvpn.com/EQNOEHVwOCW) | No | **Almost Yes** |

> [VPN Providers with port forwarding are better for torrenting.](https://www.reddit.com/r/VPNTorrents/comments/p6h7em/answered_why_you_do_need_portforwarding_for/) (reddit.com)

*[NordVPN, Get 3 months free here.](https://ref.nordvpn.com/EQNOEHVwOCW)*

---

## ✨ MAIN FEATURES
- Multiple Web UI options (Combustion, Kettu, Web-Control, Flood, Shift, Transmissionic)
- Supports many OpenVPN providers ([full list](https://haugene.github.io/docker-transmission-openvpn/supported-providers/))
- Healthcheck and traefik support
- Pre-configured for Tipi
- Highly configurable
- Port forwarding support (with compatible VPNs)

---

## 🌟 ADVANTAGES
- Secure torrenting via VPN tunnel
- Automated start/stop with VPN status
- Open Source and actively maintained

---

## 🐳 DOCKER IMAGE DETAILS
- Based on [haugene/transmission-openvpn](https://github.com/haugene/docker-transmission-openvpn)
- Runs as non-root (1000:1000) for improved security
- Minimal image size, fast deployment
- Health check included
- Special thanks to [haugene](https://github.com/haugene) for the original Docker image and upstream work

---

## 📁 VOLUMES
| Host folder | Container folder | Purpose |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/transmission-vpn/data/config` | `/config` | Transmission & OpenVPN config |
| `/runtipi/app-data/transmission-vpn/data/custom` | `/etc/openvpn/custom` | Custom OpenVPN configs |
| `/runtipi/media/torrents` | `/media/torrents` | Torrents data |

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
| `PUID` | 1000 | User ID |
| `PGID` | 1000 | Group ID |
| `TZ` | Europe/Paris | Timezone |
| `TRANSMISSION_WEBUI` | combustion | Web UI selection |
| `TRANSMISSION_OVPN_PROVIDER` | NORDVPN | VPN provider |
| `TRANSMISSION_OVPN_CONFIG` |  | Provider config (see docs) |
| `TRANSMISSION_OVPN_USERNAME` |  | VPN username |
| `TRANSMISSION_OVPN_PASSWORD` |  | VPN password |
| `TRANSMISSION_OVPN_LOCAL_NETWORK` | 10.0.0.0/8,172.16.0.0/12,192.168.0.0/16 | Local network |
| `TRANSMISSION_CREATE_TUN_DEVICE` | false | Create TUN device |
| `TRANSMISSION_PEER_DNS` | false | Use VPN DNS |
| `TRANSMISSION_DHT_ENABLED` | false | Enable DHT |
| `TRANSMISSION_LPD_ENABLED` | false | Enable LPD |
| `TRANSMISSION_PEX_ENABLED` | false | Enable PEX |
| `TRANSMISSION_BLOCKLIST_ENABLED` | true | Enable blocklist |
| `TRANSMISSION_BLOCKLIST_URL` | http://list.iblocklist.com/?list=bt_level1&fileformat=p2p&archiveformat=gz | Blocklist URL |

---

## 📚 DOCUMENTATION
- [Official documentation](https://haugene.github.io/docker-transmission-openvpn/)
- [Supported VPN providers](https://haugene.github.io/docker-transmission-openvpn/supported-providers/)
- [Provider-specific instructions](https://haugene.github.io/docker-transmission-openvpn/provider-specific/)

---

## 🛠️ VPN PROVIDER SETUP
**Recommended:** [AirVPN](https://airvpn.org/?referred_by=674291) (port forwarding supported)

For AirVPN, generate your config at https://airvpn.org/generator/ and place it in `/runtipi/app-data/transmission-vpn/data/custom/`. Fill the app settings as follows:
- **OpenVPN > Username**: Your AirVPN email
- **OpenVPN > Password**: Your AirVPN password
- **OpenVPN > Default Provider Config**: Name of your generated file (without `.ovpn`)
- **OpenVPN > Provider**: Custom Config

For NordVPN and others, see [provider-specific instructions](https://haugene.github.io/docker-transmission-openvpn/provider-specific/).

---

## 📦 OVERRIDE WITH USER-CONFIG
You can override settings by creating a `docker-compose.yml` in your `user-config` directory:

| Directory | File |
|-----------|------|
| `/runtipi/user-config/transmission-vpn/` | `docker-compose.yml` |

Example for NordVPN:
```yaml
services:
  transmission-vpn:
    environment:
      - NORDVPN_COUNTRY=FR
      - NORDVPN_CATEGORY=legacy_p2p
      - NORDVPN_PROTOCOL=tcp
      - NORDVPN_SERVER=fr000.nordvpn.com
```

---

## 💾 SOURCE
* [haugene/transmission-openvpn](https://github.com/haugene/docker-transmission-openvpn)
* [Transmission](https://transmissionbt.com/)
* [AirVPN](https://airvpn.org/?referred_by=674291)

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by [JigSawFr](https://github.com/JigSawFr).

---

For any questions or issues, open an issue on the official GitHub repository.
