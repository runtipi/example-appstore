---
mode: agent
---

# 🚀 Add a new application to tipi-store

Add the **{{APPLICATION_NAME}}** application (link to documentation/official site) based on other applications in the tipi-store.

## 📋 Required specifications

### 🏗️ Mandatory structure
- `apps/[app-name]/config.json` - Tipi configuration with detailed form_fields
- `apps/[app-name]/docker-compose.json` - Optimized Docker configuration
- `apps/[app-name]/metadata/description.md` - Standardized documentation
- `apps/[app-name]/metadata/logo.jpg` - Official logo downloaded

### 🔧 Technical validations
- **Docker Image**: Verify official image, correct tags, WITHOUT "v" prefix
- **Environment variables**: Check PUID/PGID support via official documentation
- **tipi_version**: Always 1 for a new application
- **Timestamps**: Use https://currentmillis.com for `created_at` and `updated_at`
- **uid/gid**: Remove from config.json if PUID/PGID not supported by image
- **Schema compliance**: Follow official Runtipi schemas (app-info.json, dynamic-compose.json)
- **Volume structure**: Use `${APP_DATA_DIR}/data` for single volume, `${APP_DATA_DIR}/data/<folder>` for multiple volumes

### 📝 config.json configuration
```json
{
  "name": "AppName",
  "id": "app-name",
  "available": true,
  "short_desc": "Short description",
  "author": "OriginalAuthor",
  "port": 8080,
  "categories": ["category1", "category2"],
  "description": "Detailed description...",
  "tipi_version": 1,
  "version": "x.y.z",
  "source": "https://github.com/...",
  "exposable": true,
  "supported_architectures": ["arm64", "amd64"],
  "created_at": 1750582018046,
  "updated_at": 1750582018046,
  "dynamic_config": true,
  "form_fields": [
    {
      "type": "text|password|email|number|boolean|fqdn|ip|url|random",
      "label": "Descriptive label",
      "hint": "Helpful explanation",
      "required": true,
      "env_variable": "APP_VARIABLE_NAME",
      "default": "value", // Use native types: true/false for boolean, 8 for number
      "min": 1, // For number type
      "max": 100, // For number type
      "options": [{"label": "Display", "value": "internal"}] // For select lists
    }
  ]
}
```

**Form field best practices:**
- Use native data types: `true`/`false` for booleans, `8` for numbers, not strings
- Include `min`/`max` validation for number fields
- Provide helpful `hint` for each field
- Group related fields with consistent labeling (e.g., "DNS Settings >", "Security >")
- Use `options` array for predefined choices
```

### 🐳 docker-compose.json configuration
- Environment variables aligned with form_fields
- Appropriate volumes according to application
- Verified official image
- Correct internal port
- Health checks when applicable
- Port mappings via `addPorts` for external services
- Use native data types (boolean, number) not strings
- Follow volume pattern: single=`${APP_DATA_DIR}/data`, multiple=`${APP_DATA_DIR}/data/<folder>`

### 📖 description.md documentation
Standardized format with mandatory sections:
```markdown
# APP_NAME

[GitHub badges]

Short description.

---

## 📖 SYNOPSIS
## ✨ MAIN FEATURES  
## 🌟 ADVANTAGES
## 🐳 DOCKER IMAGE DETAILS
## 📁 VOLUMES
## 🗃️ DEFAULT PARAMETERS
## 📝 ENVIRONMENT
## ⚠️ IMPORTANT
## 💾 SOURCE
## ❤️ PROVIDED WITH LOVE
```

### 🎨 Official logo
- Download from official site/GitHub
- Named `logo.jpg`
- Reasonable size (< 100KB recommended)

## 🔍 Mandatory verification points

### 1. Official schemas compliance
- [ ] Validate against `https://schemas.runtipi.io/app-info.json`
- [ ] Validate against `https://schemas.runtipi.io/dynamic-compose.json`
- [ ] Use VS Code with schema validation enabled

### 2. Docker Image
- [ ] Verify image existence on official registry
- [ ] Confirm available versions/tags
- [ ] Verify absence of "v" prefix in tags
- [ ] Test supported environment variables
- [ ] Check for PUID/PGID support in documentation

### 3. Environment variables
- [ ] Read official documentation thoroughly
- [ ] Verify PUID/PGID support (often not supported)
- [ ] List all configurable variables
- [ ] Define appropriate default values
- [ ] Use native data types in form_fields

### 4. Ports and volumes
- [ ] Application default port
- [ ] Required volumes for persistence
- [ ] Correct container paths
- [ ] Follow volume naming convention
- [ ] Add health checks when possible
- [ ] Configure external ports via `addPorts` if needed

### 5. Optimal form fields
- [ ] All important parameters configurable
- [ ] Explanatory hints for each field
- [ ] Appropriate types (text, password, boolean, number)
- [ ] Predefined options if applicable
- [ ] Sensible default values with native types
- [ ] Min/max validation for numbers
- [ ] Grouped labeling for related settings

## 🛠️ Schema validation setup

Configure VS Code for automatic validation by ensuring `.vscode/settings.json` contains:

```json
{
  "json.schemas": [
    {
      "fileMatch": [
        "**/apps/*/config.json"
      ],
      "url": "https://schemas.runtipi.io/app-info.json"
    },
    {
      "fileMatch": [
        "**/apps/*/docker-compose.json"
      ],
      "url": "https://schemas.runtipi.io/dynamic-compose.json"
    }
  ]
}
```

This provides real-time validation and IntelliSense for both config.json and docker-compose.json files.

## 📋 Creation process

1. **Preliminary research**
   - Analyze official documentation and GitHub repository
   - Identify official Docker image and verify tags
   - List environment variables and their types
   - Check PUID/PGID support in documentation
   - Review health check possibilities

2. **Schema validation setup**
   - Ensure VS Code has schema validation configured
   - Reference official Runtipi schemas for validation
   - Prepare data type mappings (string → boolean/number)

3. **Structure creation**
   - Create `apps/[app-name]` and `metadata/` folders
   - Generate config.json with complete form_fields using native types
   - Create optimized docker-compose.json with health checks
   - Follow volume naming conventions

4. **Documentation and assets**
   - Write description.md following standard format
   - Download official logo (< 100KB recommended)
   - Update volume paths in documentation

5. **Integration and testing**
   - Add to main README (table + counter)
   - Add to apps README (`apps/README.md`) in appropriate category
   - Test JSON syntax validation
   - Verify schema compliance

6. **Final validation**
   - Run schema validation tools
   - Test environment variables consistency
   - Validate complete structure
   - Verify all native data types are used correctly

## 🎯 Objective

"Perfect" configuration allowing:
- One-click installation
- Complete configuration via interface
- Compliance with tipi-store standards
- Clear and professional documentation
- Perfect integration in the ecosystem

## ⚠️ Important constraints

- **Never uid/gid** in config.json if PUID/PGID not supported
- **tipi_version always 1** for new apps
- **Current timestamps** via currentmillis.com
- **Verified Docker image** and correct tags
- **Standardized documentation** according to established format
- **Exhaustive form fields** for optimal configuration
- **Native data types**: Use `true`/`false` for booleans, numbers for numeric values
- **Volume conventions**: Single volume = `${APP_DATA_DIR}/data`, Multiple = `${APP_DATA_DIR}/data/<folder>`
- **Schema compliance**: All files must validate against official Runtipi schemas
- **Health checks**: Add when applicable for better monitoring
- **Port management**: Use `addPorts` for external service ports (not web UI)

## 📚 Valid categories

When choosing categories for your application, use only these valid values:
- `network` - Network tools, DNS, VPN, proxies
- `media` - Media servers, streaming, entertainment
- `development` - Development tools, IDEs, version control
- `automation` - Home automation, IoT, smart home
- `social` - Communication, chat, social networks
- `utilities` - General purpose tools, system utilities
- `photography` - Photo management, editing, galleries
- `security` - Security tools, monitoring, firewalls
- `featured` - Featured/recommended applications
- `books` - E-books, reading, libraries
- `data` - Databases, data management, analytics
- `music` - Music servers, players, management
- `finance` - Financial tools, budgeting, accounting
- `gaming` - Gaming servers, game management
- `ai` - AI tools, machine learning, automation

**Example combinations:**
- Plex: `["media", "featured"]`
- Sonarr: `["media", "automation"]`

## 🎯 Common patterns and examples

### Volume patterns
```json
// Single volume
"volumes": [
  {
    "hostPath": "${APP_DATA_DIR}/data",
    "containerPath": "/app/data"
  }
]

// Multiple volumes
"volumes": [
  {
    "hostPath": "${APP_DATA_DIR}/data/config",
    "containerPath": "/app/config"
  },
  {
    "hostPath": "${APP_DATA_DIR}/data/logs",
    "containerPath": "/app/logs"
  }
]
```

### Health check examples
```json
// DNS service
"healthCheck": {
  "test": "nslookup google.com 127.0.0.1:53 || exit 1",
  "interval": "30s",
  "timeout": "10s",
  "retries": 3,
  "startPeriod": "40s"
}

// Web service
"healthCheck": {
  "test": "curl -f http://localhost:8080/health || exit 1",
  "interval": "30s",
  "timeout": "10s",
  "retries": 3
}
```

### Form field examples
```json
// Boolean field (native type)
{
  "type": "boolean",
  "label": "Enable feature",
  "hint": "Enable this feature for enhanced functionality",
  "env_variable": "APP_ENABLE_FEATURE",
  "default": true
}

// Number field with validation
{
  "type": "number",
  "label": "Port number",
  "hint": "Port for the service (1024-65535)",
  "min": 1024,
  "max": 65535,
  "env_variable": "APP_PORT",
  "default": 8080
}

// Select field
{
  "type": "text",
  "label": "Log level",
  "hint": "Application logging level",
  "options": [
    {"label": "Debug", "value": "debug"},
    {"label": "Info", "value": "info"},
    {"label": "Warning", "value": "warn"},
    {"label": "Error", "value": "error"}
  ],
  "required": true,
  "env_variable": "APP_LOG_LEVEL",
  "default": "info"
}
```