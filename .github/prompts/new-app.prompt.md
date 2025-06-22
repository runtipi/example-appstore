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
- **Image preference**: Prefer GitHub Container Registry (ghcr.io) over Docker Hub when available
- **Environment variables**: Check PUID/PGID support via official documentation AND docker-compose.yml
- **Variable prefixing**: Always prefix env_variables with APP_NAME (e.g., PAPERLESS_AI_*)
- **tipi_version**: Always 1 for a new application, increment by +1 before each commit to GitHub
- **Timestamps**: Use https://currentmillis.com for `created_at` and `updated_at`
- **uid/gid**: Add to config.json ONLY if PUID/PGID supported by image
- **Schema compliance**: Follow official Runtipi schemas (app-info.json, dynamic-compose.json)
- **Volume structure**: Use `${APP_DATA_DIR}/data` for single volume, `${APP_DATA_DIR}/data/<folder>` for multiple volumes
- **Documentation verification**: Always check wiki/documentation for missing features (webhooks, API keys, etc.)

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
- **Variable naming**: Always prefix with APP_NAME (e.g., PAPERLESS_AI_API_URL)
- Use native data types: `true`/`false` for booleans, `8` for numbers, not strings
- Include `min`/`max` validation for number fields
- Provide helpful `hint` for each field
- Group related fields with consistent labeling (e.g., "DNS Settings >", "Security >")
- Use `options` array for predefined choices
- **Short descriptions**: Keep short_desc concise (e.g., "AI document analyzer")
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
- [ ] **Prefer GitHub Container Registry (ghcr.io) packages over Docker Hub when available**
- [ ] Verify image existence on official registry
- [ ] Confirm available versions/tags
- [ ] Verify absence of "v" prefix in tags
- [ ] Test supported environment variables
- [ ] **Check PUID/PGID support in BOTH documentation AND original docker-compose.yml**
- [ ] **Examine original .env.example for additional variables**

### 3. Environment variables
- [ ] **Always prefix ALL variables with APP_NAME (e.g., PAPERLESS_AI_*)**
- [ ] Read official documentation thoroughly
- [ ] **Check wiki/documentation for advanced features (webhooks, API keys, system prompts)**
- [ ] Verify PUID/PGID support (often not supported)
- [ ] **Examine original .env.example file for comprehensive variable list**
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
   - **Check for GitHub Container Registry packages (ghcr.io) first, then Docker Hub**
   - **Check wiki/documentation for ALL features (webhooks, integrations, API endpoints)**
   - Identify official Docker image and verify tags
   - **Examine original docker-compose.yml AND .env.example files**
   - List environment variables and their types
   - Check PUID/PGID support in documentation AND docker files
   - Review health check possibilities

2. **Schema validation setup**
   - Ensure VS Code has schema validation configured
   - Reference official Runtipi schemas for validation
   - Prepare data type mappings (string → boolean/number)

3. **Structure creation**
   - Create `apps/[app-name]` and `metadata/` folders
   - **Generate config.json with ALL variables prefixed with APP_NAME**
   - Generate config.json with complete form_fields using native types
   - **Add uid/gid ONLY if PUID/PGID supported (verify in original docker-compose.yml)**
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
   - **Verify ALL environment variables are prefixed with APP_NAME**
   - **Check description.md is updated with correct variable names**
   - Validate complete structure
   - Verify all native data types are used correctly

7. **Pre-commit preparation**
   - **Increment tipi_version by +1 before committing to GitHub**
   - Update `updated_at` timestamp with current millis
   - Final schema validation check
   - **Create feature branch for new app: `feat/add-[app-name]`**
   - Follow commit standards (see commit-app.prompt.md)
   - Push to repository and create Pull Request

## 🔄 Git workflow for new applications

```bash
# New application workflow:
1. Create feature branch: git checkout -b feat/add-[app-name]
2. Make all changes for the new app
3. Test functionality locally
4. Before committing:
   - Increment tipi_version to 1 in config.json
   - Update updated_at timestamp
   - Run final validations
5. Follow commit message standards from commit-app.prompt.md
6. Push branch and create Pull Request for review

# Example workflow:
git checkout -b feat/add-paperless-ai
# ... make all changes ...
git add apps/paperless-ai/
git commit -m "🎉 Added: paperless-ai application to tipi-store"
git commit -m "✨ Added: comprehensive configuration options for paperless-ai"
git commit -m "📚 Docs: add complete paperless-ai documentation"
git push origin feat/add-paperless-ai
# Create Pull Request
```

### 📝 Commit message standards (see commit-app.prompt.md)

For detailed commit standards, branch management, and automated workflows, refer to the dedicated **commit-app.prompt.md** file which covers:
- Branch strategy for new apps vs. modifications
- Complete Gitmoji + Keep a Changelog mapping
- Pre-commit checklists and validation
- Automated commit scripts
- Pull Request workflow

## 🎯 Objective

"Perfect" configuration allowing:
- One-click installation
- Complete configuration via interface
- Compliance with tipi-store standards
- Clear and professional documentation
- Perfect integration in the ecosystem

## ⚠️ Important constraints

- **Docker image preference**: Always prefer GitHub Container Registry (ghcr.io) over Docker Hub when available
- **Environment variable prefixing**: ALWAYS prefix ALL env_variables with APP_NAME (e.g., PAPERLESS_AI_*)
- **PUID/PGID verification**: Check original docker-compose.yml, add uid/gid ONLY if supported
- **Documentation completeness**: Always verify wiki/docs for missing features (API keys, webhooks, etc.)
- **Never uid/gid** in config.json if PUID/PGID not supported
- **tipi_version always 1** for new apps, **increment by +1** before each commit to GitHub
- **Current timestamps** via currentmillis.com
- **Verified Docker image** and correct tags
- **Standardized documentation** according to established format
- **Exhaustive form fields** for optimal configuration
- **Native data types**: Use `true`/`false` for booleans, numbers for numeric values
- **Volume conventions**: Single volume = `${APP_DATA_DIR}/data`, Multiple = `${APP_DATA_DIR}/data/<folder>`
- **Schema compliance**: All files must validate against official Runtipi schemas
- **Health checks**: Add when applicable for better monitoring
- **Port management**: Use `addPorts` for external service ports (not web UI)
- **Final documentation check**: Ensure description.md reflects ALL configuration options

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

### MANDATORY verification checklist (based on paperless-ai experience)
1. **Check for GitHub Container Registry (ghcr.io) packages first**
2. **Check original docker-compose.yml for PUID/PGID support**
3. **Examine .env.example for complete variable list**
4. **Review wiki/documentation for advanced features**
5. **Prefix ALL variables with APP_NAME**
6. **Verify documentation matches final configuration**

### Variable naming pattern
```json
// CORRECT - Always prefix with app name
{
  "env_variable": "PAPERLESS_AI_API_URL",
  "env_variable": "PAPERLESS_AI_CUSTOM_MODEL",
  "env_variable": "PAPERLESS_AI_SCAN_INTERVAL"
}

// INCORRECT - No prefix
{
  "env_variable": "API_URL",
  "env_variable": "CUSTOM_MODEL", 
  "env_variable": "SCAN_INTERVAL"
}
```

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

### PUID/PGID verification examples
```yaml
# If found in original docker-compose.yml:
environment:
  - PUID=1000
  - PGID=1000
# Then ADD to config.json: "uid": 1000, "gid": 1000

# If NOT found in original docker-compose.yml:
# Then DO NOT add uid/gid to config.json
```

### Advanced features detection
```bash
# Always check these sources:
1. /wiki documentation for webhooks, API keys
2. .env.example for complete variable list  
3. Original docker-compose.yml for PUID/PGID
4. Dockerfile for exposed ports and volumes
```

### Docker image preference examples
```json
// PREFERRED - GitHub Container Registry
{
  "image": "ghcr.io/linuxserver/plex:latest",
  "image": "ghcr.io/paperless-ngx/paperless-ngx:latest",
  "image": "ghcr.io/sct/overseerr:latest"
}

// ACCEPTABLE - Docker Hub (when ghcr.io not available)
{
  "image": "linuxserver/plex:latest",
  "image": "clusterzx/paperless-ai:latest",
  "image": "hotio/sonarr:latest"
}

// How to verify GitHub packages:
// 1. Check repository /packages tab
// 2. Look for "Container registry" section
// 3. Verify ghcr.io/[owner]/[repo] format
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