![banner](store.png?raw=true)

# JigSaw ~ Runtipi.io Custom AppStore ⛺

![CI](https://github.com/JigSawFr/tipi-store/actions/workflows/ci.yml/badge.svg)

This is a custom repository for the Runtipi.io App Store.
It contains a variety of apps.

# UNIQUE VALUE PROPOSITION 💶
**Why should I run these apps and not the other app(s) in stores that already exist?** Good question!

> [!IMPORTANT]
>* These app's runs as 1000:1000 by default, most other apps run everything as root
>* These app's image are created via a secure, pinned CI/CD process and immune to upstream attacks, most other images have upstream dependencies that can be exploited
>* These app's contains a proper health check that verifies the app is actually working, most other app's images have either no health check or only check if a port is open or ping works
>* This repository has an auto update feature that will automatically build the latest version if released.
>* These app's images are smaller than most other AppStore's images


## Apps Available (6) 🏁

| Logo                                                                     | Name                                                         | Description                                  |
| :----------------------------------------------------------------------: | ------------------------------------------------------------ | -------------------------------------------- |
| <img src="apps/byparr/metadata/logo.jpg" width="64" height="64">       | [Byparr](https://github.com/ThePhaseless/Byparr)           | Alternative to Flaresolverr
| <img src="apps/radarr/metadata/logo.jpg" width="64" height="64">       | [Radarr](https://github.com/Radarr/Radarr)           | Run Radarr smaller, lightweight and more secure (Eleven Notes ™️)      |
| <img src="apps/sonarr/metadata/logo.jpg" width="64" height="64">       | [Sonarr](https://github.com/Sonarr/Sonarr)           | Run Sonarr smaller, lightweight and more secure (Eleven Notes ™️)      |
| <img src="apps/plex/metadata/logo.jpg" width="64" height="64">       | [Plex](https://github.com/linuxserver/docker-plex)           | Run Plex smaller, lightweight and more secure (LinuxServer ™️)   
| <img src="apps/prowlarr/metadata/logo.jpg" width="64" height="64">       | [Prowlarr](https://github.com/Prowlarr/Prowlarr)           | Run Prowlarr smaller, lightweight and more secure (Eleven Notes ™️)      |
| <img src="apps/recyclarr/metadata/logo.jpg" width="64" height="64">       | [Recyclarr](https://github.com/recyclarr/recyclarr)           | Automatically sync TRaSH guides with your Sonarr and Radarr instances |

## Installation

Using the appstore is simple.

1. In the Runtipi dashboard, open settings and go to the "App Stores" tab.
2. Click "Add App Store" and fill in the form with a nice name and the URL `https://github.com/JigSawFr/tipi-store`.
3. Submit the form. You can now go to the App Store and select the one you just created from the dropdown.
4. Choose an app and install it. Have fun!

> [!WARNING]
> If you use this appstore, please keep in mind that it is a hobby project and I have very limited spare time for it. I'll try my best to keep apps up to date and in a working configuration, but I can make no guarantees. I will not be constantly responding to user support requests. I may also delete or deprecate an app at any time.