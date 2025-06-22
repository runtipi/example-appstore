# PAPERLESS-NGX

[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/11notes/docker-paperless-ngx) [<img src="https://img.shields.io/github/issues/paperless-ngx/paperless-ngx?color=7842f5">](https://github.com/paperless-ngx/paperless-ngx/issues) [<img src="https://img.shields.io/docker/v/11notes/paperless-ngx/latest?label=version&color=green">](https://hub.docker.com/r/11notes/paperless-ngx)

A community-supported supercharged version of paperless: scan, index and archive all your physical documents with Active Directory authentication support.

---

## 📖 SYNOPSIS
Paperless-ngx is a document management system that transforms your physical documents into a searchable online archive so you can keep, well, less paper. It's the official successor to the original Paperless and Paperless-ng projects, featuring automatic OCR processing, machine learning powered suggestions, full-text search capabilities, and a modern Angular-based web interface. Perfect for digitizing invoices, receipts, contracts, tax documents, and any paper-based information.

---

## ✨ MAIN FEATURES  
- **Automatic OCR processing** - Extract text from scanned documents and images
- **Machine learning suggestions** - AI-powered document categorization and tagging
- **Full-text search** - Search through document content, not just titles
- **Advanced filtering** - Filter by tags, correspondents, document types, dates
- **Modern web interface** - Clean, responsive Angular-based UI
- **Multiple file formats** - Support for PDF, images, Office documents
- **Email import** - Import documents directly from email
- **API access** - REST API for automation and integrations
- **Multi-user support** - User accounts with permission management
- **Audit logging** - Track all document operations for compliance

---

## 🌟 ADVANTAGES
- **Zero vendor lock-in** - Open source with data export capabilities
- **Privacy focused** - Self-hosted solution, your documents stay private
- **Highly configurable** - Extensive customization options
- **Active community** - Regular updates and community support
- **Enterprise ready** - Suitable for personal and business use
- **Multiple language support** - OCR in 100+ languages
- **Workflow automation** - Rules for automatic document processing

---

## 🐳 DOCKER IMAGE DETAILS
- **Enhanced with Active Directory support** - LDAP authentication via django-python3-ldap
- **Coordinated 11notes ecosystem** - Redis and PostgreSQL from same maintainer
- **Security optimized** - Enhanced with enterprise authentication features
- **Based on [11notes/paperless-ngx](https://github.com/11notes/docker-paperless-ngx)**
- **Built on official Paperless-ngx** - Latest stable version with AD enhancements
- Built via a secure, pinned CI/CD process, immune to upstream attacks
- Auto update feature: the latest version is automatically built and published
- Special thanks to [11notes](https://github.com/11notes) for the optimized containers with AD support!

---

## 📁 VOLUMES
| Host folder | Container folder | Comment |
| ----------- | ---------------- | ------- |
| `/runtipi/app-data/paperless-ngx/data/consume` | `/usr/src/paperless/consume` | Drop folder for new documents |
| `/runtipi/app-data/paperless-ngx/data/originals` | `/usr/src/paperless/media/documents/originals` | Original uploaded documents |
| `/runtipi/app-data/paperless-ngx/data/archive` | `/usr/src/paperless/media/documents/archive` | Processed/archived documents |
| `/runtipi/app-data/paperless-ngx/data/data` | `/usr/src/paperless/data` | Application data and search index |
| `/runtipi/app-data/paperless-ngx/data/export` | `/usr/src/paperless/export` | Document exports |
| `/runtipi/app-data/paperless-ngx/data/thumbnails` | `/usr/src/paperless/media/documents/thumbnails` | Document thumbnails |
| `/runtipi/app-data/paperless-ngx/data/redis-etc` | `/redis/etc` | Redis configuration |
| `/runtipi/app-data/paperless-ngx/data/redis-var` | `/redis/var` | Redis data |
| `/runtipi/app-data/paperless-ngx/data/postgres` | `/postgres/var` | PostgreSQL database |

---

## 🗃️ DEFAULT PARAMETERS
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | docker | User name |
| `uid` | 1000 | User identifier |
| `gid` | 1000 | Group identifier |
| `home` | /usr/src/paperless | Home directory of user docker |

---

## 📝 ENVIRONMENT
| Parameter | Default value | Description |
| --- | --- | --- |
| `TZ` | Europe/Paris | Timezone |
| `REDIS_PASSWORD` | paperless_redis | Redis authentication password |
| `PAPERLESS_REDIS` | redis://:password@paperless-redis:6379 | Redis connection string with authentication |
| `PAPERLESS_DBHOST` | paperless-db | Database host |
| `PAPERLESS_DBNAME` | postgres | Database name |
| `PAPERLESS_DBUSER` | postgres | Database user |
| `PAPERLESS_DBPASS` | paperless | Database password |
| `PAPERLESS_ADMIN_USER` |  | Admin username (optional) |
| `PAPERLESS_ADMIN_PASSWORD` |  | Admin password (optional) |
| `PAPERLESS_ADMIN_MAIL` |  | Admin email address |
| `PAPERLESS_SECRET_KEY` |  | Django secret key (auto-generated if empty) |
| `PAPERLESS_URL` |  | Application URL |
| `PAPERLESS_OCR_LANGUAGE` | eng | Primary OCR language |
| `PAPERLESS_OCR_LANGUAGES` | eng | Available OCR languages |
| `PAPERLESS_CONSUMER_POLLING` | 60 | Polling interval in seconds |
| `PAPERLESS_CONSUMER_POLLING_DELAY` | 30 | Processing delay in seconds |
| `PAPERLESS_CONSUMER_POLLING_RETRY_COUNT` | 3 | Retry attempts for failed documents |
| `PAPERLESS_CONSUMER_RECURSIVE` | false | Process subdirectories |
| `PAPERLESS_AUDIT_LOG_ENABLED` | true | Enable audit logging |
| `PAPERLESS_DOCUMENTS_PER_PAGE` | 25 | Documents per page in UI |

---

## ⚠️ IMPORTANT
- **Document Security**: Documents are stored in plain text without encryption. Run only on trusted networks.
- **Admin Account**: Create admin credentials via the web interface or environment variables
- **OCR Languages**: Install additional language packs if needed for your documents
- **Consume Folder**: Drop new documents in the consume folder for automatic processing
- **Backup Strategy**: Regular backups are essential - documents and database should be backed up
- **Resource Usage**: OCR processing can be CPU intensive, ensure adequate resources
- **File Permissions**: Ensure proper permissions on mounted volumes (uid/gid 1000)

### Getting Started:
1. Access Paperless-ngx at `http://your-tipi-ip:8000`
2. Create admin account if not set via environment variables
3. Configure OCR languages and document types
4. Drop documents in the consume folder or upload via web interface
5. Review and tag processed documents

---

## 💾 SOURCE
* [Paperless-ngx Team/paperless-ngx](https://github.com/paperless-ngx/paperless-ngx) - Original Paperless-ngx
* [11notes/docker-paperless-ngx](https://github.com/11notes/docker-paperless-ngx) - Optimized Docker image

---

## ❤️ PROVIDED WITH LOVE
This app is provided with love by the Paperless-ngx community for digital document management and organization.

---

For any questions or issues, open an issue on the official GitHub repositories.
