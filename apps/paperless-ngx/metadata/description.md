# 📄 PAPERLESS-NGX

[![GitHub Stars](https://img.shields.io/github/stars/paperless-ngx/paperless-ngx?style=flat-square&logo=github)](https://github.com/paperless-ngx/paperless-ngx)
[![Docker Pulls](https://img.shields.io/docker/pulls/paperlessngx/paperless-ngx?style=flat-square&logo=docker)](https://hub.docker.com/r/paperlessngx/paperless-ngx)
[![License](https://img.shields.io/github/license/paperless-ngx/paperless-ngx?style=flat-square)](https://github.com/paperless-ngx/paperless-ngx/blob/main/LICENSE)

Paperless-ngx is a community-supported open-source document management system that transforms your physical documents into a searchable online archive so you can keep, well, less paper.

---

## 📖 SYNOPSIS

Paperless-ngx is a powerful document management system designed to help you organize, store, and search your documents digitally. It performs OCR on scanned documents, automatically extracts metadata, and provides a modern web interface for managing your paperless office.

## ✨ MAIN FEATURES

- **🔍 Full-text search** with auto-completion and relevance sorting
- **🤖 OCR processing** for image-based documents with selectable text
- **🏷️ Smart organization** with tags, correspondents, and document types
- **📧 Email integration** to automatically process documents from email
- **🔍 Barcode processing** with ASN (Archive Serial Number) support
- **🧠 Machine learning** powered document matching and auto-tagging
- **📱 Modern web interface** with responsive design and dashboard
- **📁 Multiple file formats** support (PDF, images, Office documents)
- **🔒 Multi-user support** with permission management
- **🔄 API access** for automation and integrations
- **📊 Statistics and reporting** dashboard
- **🗑️ Trash management** with document recovery options
- **📝 Post-processing scripts** for custom workflows

## 🌟 ADVANTAGES

- **Open Source**: Community-driven development with active support
- **Self-hosted**: Complete control over your data and privacy
- **Scalable**: Optimized for multi-core systems and large document collections
- **Flexible**: Customizable workflows and document processing rules
- **Reliable**: Built-in sanity checker ensures document archive integrity
- **Modern**: Single-page application with intuitive user interface

## 🐳 DOCKER IMAGE DETAILS

- **Image**: `ghcr.io/paperless-ngx/paperless-ngx:2.16.2`
- **Architecture**: AMD64, ARM64
- **Base**: Official Paperless-ngx image
- **Size**: ~1.2GB (includes OCR dependencies)
- **Security**: Regular updates and security patches

### 📦 Additional Services

- **PostgreSQL 16.6**: Primary database for metadata storage
- **Redis 7**: Message broker for background tasks
- **Gotenberg 8**: PDF conversion and document processing
- **Tika**: Office document parsing (optional)

## 📁 VOLUMES

| Path | Container Path | Description |
|------|----------------|-------------|
| `${APP_DATA_DIR}/data/paperless_data` | `/usr/src/paperless/data` | Application data and configuration |
| `${APP_DATA_DIR}/data/paperless_media` | `/usr/src/paperless/media` | Processed documents storage |
| `${APP_DATA_DIR}/data/paperless_export` | `/usr/src/paperless/export` | Document export directory |
| `${APP_DATA_DIR}/data/paperless_consume` | `/usr/src/paperless/consume` | Watch folder for new documents |
| `${APP_DATA_DIR}/data/paperless_trash` | `/usr/src/paperless/trash` | Deleted documents recovery |
| `${APP_DATA_DIR}/data/paperless_postprocessor` | `/usr/src/paperless/postprocessor` | Post-processing scripts |
| `${APP_DATA_DIR}/data/paperless_scripts` | `/custom-cont-init.d` | Custom initialization scripts |
| `${APP_DATA_DIR}/data/postgres` | `/var/lib/postgresql/data` | PostgreSQL database files |
| `${APP_DATA_DIR}/data/redis` | `/data` | Redis persistence data |

## 🗃️ DEFAULT PARAMETERS

- **Port**: 8012 (Main app)
- **Primary OCR Language**: English
- **OCR Languages**: English (configurable)
- **Timezone**: UTC
- **Tika Server**: Disabled (for performance)
- **Barcode Processing**: Disabled
- **Database**: PostgreSQL 16.6
- **Cache**: Redis 7
- **Task Workers**: 2
- **Threads per Worker**: 4
- **Consumer Polling**: 5 seconds
- **Update Checks**: Enabled

## 📝 ENVIRONMENT

### 🔧 Required Configuration

- **Administrator Username**: Main admin user account
- **Administrator Password**: Secure password (min 8 characters)

### ⚙️ Optional Settings

- **Tika Server**: Enable for Office document support (.doc, .xlsx, .odt)
- **Timezone**: Application timezone (e.g., Europe/Paris)
- **OCR Languages**: Multiple language support (e.g., fra+eng+deu)
- **OCR Settings**: Mode, output type, rotation, page limits
- **OCR Advanced**: Deskewing, cleaning, PDF/A conversion
- **Barcode Processing**: Enable document processing via barcodes
- **Barcode Advanced**: TIFF support, tag assignment, DPI settings
- **ASN Barcodes**: Archive Serial Number barcode support
- **Performance**: Task workers, threads, memory limits, timeouts
- **Consumer Settings**: Recursive processing, duplicate deletion
- **Trash Management**: Retention period for deleted documents
- **Scheduled Tasks**: Email checking, training, indexing frequencies
- **Security**: Custom secret key for enhanced security

### 🌐 Language Support

Available OCR languages:
- English (eng) - Default
- French (fra)
- German (deu)
- Spanish (spa)
- Italian (ita)
- Luxembourgish (ltz)
- Multiple languages can be combined (e.g., fra+eng+deu)

## ⚠️ IMPORTANT

### 🕐 Installation Notes

- **Be patient** during installation - it may take several minutes to download all dependencies
- **Wait after installation** - Paperless-ngx needs time to initialize the database
- **First access** may take 30-60 seconds to load completely

### 🔧 Tika Configuration

- **Performance Impact**: Tika server requires additional resources (CPU/Memory)
- **Office Documents**: Required for .doc, .xlsx, .odt file processing
- **Recommendation**: Disable if you don't need Office document support

### 🔒 Security Considerations

- Use strong passwords for the administrator account
- Configure proper firewall rules if exposing externally
- Regular backups of the `${APP_DATA_DIR}` directory
- Keep the application updated for security patches

### 🤖 OCR Features

- **Multiple OCR modes**: Skip, Redo, Force for different document types
- **PDF/A conversion**: Long-term archival format support
- **Automatic rotation**: Correct 90°, 180°, 270° rotations
- **Page limits**: Process only first N pages for performance
- **Archive control**: Skip archived versions for documents with text
- **Language combinations**: Multiple languages (e.g., fra+eng+deu)
- **Quality optimization**: Deskewing and cleaning options

### 🔍 Advanced Barcode Features

- **TIFF support**: Process barcodes in TIFF images
- **Tag assignment**: Automatic tag creation from barcodes
- **DPI configuration**: Adjustable resolution for small barcodes
- **Upscaling**: Enhance barcode detection quality
- **ASN processing**: Archive Serial Number workflows
- **Custom patterns**: Configurable barcode recognition

### 🗑️ Trash & Maintenance

- **Configurable retention**: 1-365 days for deleted documents
- **Automatic cleanup**: Scheduled trash emptying
- **Recovery options**: Documents recoverable before permanent deletion
- **Scheduled tasks**: Configurable email, training, and indexing

### ⚡ Performance Tuning

- **Worker configuration**: Adjustable task workers and threads
- **Memory limits**: Prevent resource exhaustion on large documents
- **Timeout settings**: Extended processing time for weak hardware
- **Cron scheduling**: Customizable background task frequencies

## 💾 SOURCE

- **Official Website**: https://docs.paperless-ngx.com
- **GitHub Repository**: https://github.com/paperless-ngx/paperless-ngx
- **Documentation**: https://docs.paperless-ngx.com
- **Community**: https://github.com/paperless-ngx/paperless-ngx/discussions

## ❤️ PROVIDED WITH LOVE

Paperless-ngx integration for Tipi by the community.
Original application developed by Daniel Quinn, Jonas Winkler, and the Paperless-ngx team.
