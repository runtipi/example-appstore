# BYPARR
An alternative to [FlareSolverr](https://github.com/FlareSolverr/FlareSolverr) as a drop-in replacement, built with [seleniumbase](https://seleniumbase.io/) and [FastAPI](https://fastapi.tiangolo.com).

# SYNOPSIS 📖
**What can I do with this?** 

> This software does not **guarantee** (only greatly increases the chance) that any challenge will be bypassed. While this tool passes the initial browser check, Cloudflare and other captcha providers likely require valid network traffic originating from the user’s public IP address to mark a connection as legitimate. If any website does not pass the challenge, please run troubleshooting steps and check if other websites work before you create an GitHub issue.

> Support for NAS devices (like Synology) is minimal. Please report issues, but do not expect it to be fixed quickly. The only ARM device I have is a free Ampere Oracle VM, so I can only test ARM support on that. See [#22](https://github.com/ThePhaseless/Byparr/issues/22) and [#3](https://github.com/ThePhaseless/Byparr/issues/3)

> Thanks to FastAPI implementation, now you can also see the API documentation at `/docs` or `/` (redirect to `/docs`) endpoints.

# ENVIRONMENT 📝
| Parameter | Value | Default |
| --- | --- | --- |
| `TZ` | [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | |
| `USE_HEADLESS`       | `SeleniumBase default` | Use headless  chromium.  
| `PROXY`              | None                   | Proxy to use in format: `protocol://username:password@host:port`. |

# SOURCE 💾
* [ThePhaseless/Byparr](https://github.com/ThePhaseless/Byparr)

# DISCLAIMER™️
This image is provided to you at your own risk. Always make backups before updating an image to a different version. Check the releases for breaking changes.
