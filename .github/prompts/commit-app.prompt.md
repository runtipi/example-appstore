---
mode: agent
---

# 📝 Commit application changes to tipi-store

Handle proper Git workflow and commit formatting for tipi-store application changes, following **Keep a Changelog** standards with **Gitmoji** prefixes.

## 🔄 Git workflow decision tree

### 🆕 New application integration
```bash
# 1. Create dedicated feature branch
git checkout -b feat/add-[app-name]
git push -u origin feat/add-[app-name]

# 2. Make changes and commit
git add apps/[app-name]/
git commit -m "🎉 Added: [app-name] application to tipi-store"
git commit -m "✨ Added: comprehensive configuration options for [app-name]"
git commit -m "📚 Docs: add complete [app-name] documentation"

# 3. Push and create PR
git push origin feat/add-[app-name]
# Create Pull Request for review
```

### 🔧 Existing application modification
```bash
# 1. Work directly on main or create feature branch for major changes
git checkout main
git pull origin main

# 2. Make changes locally
# 3. Before commit: increment tipi_version and update timestamp
# 4. Commit with proper format
git add apps/[app-name]/
git commit -m "[gitmoji] [category]: [description] for [app-name]"
git push origin main
```

## 📋 Pre-commit checklist

### ✅ Mandatory verifications before any commit
- [ ] **tipi_version incremented** (+1 from previous version)
- [ ] **updated_at timestamp** updated to current millis
- [ ] **Schema validation** passed (config.json + docker-compose.json)
- [ ] **Environment variables** correctly prefixed with APP_NAME_*
- [ ] **Documentation updated** to reflect configuration changes
- [ ] **Files staged** correctly (only modified app files)

### 🔍 Additional checks for new apps
- [ ] **Branch created** with `feat/add-[app-name]` format
- [ ] **All required files** present (config.json, docker-compose.json, description.md, logo.jpg)
- [ ] **README files updated** (main README.md + apps/README.md)
- [ ] **Official image verified** and ghcr.io preferred when available
- [ ] **PUID/PGID support** properly validated against original docker-compose.yml

## 🎨 Commit message standards

### 📝 Format: `[Gitmoji] [Category]: [Description] for [app-name]`

#### 🎯 Keep a Changelog categories
- **Added** - New features, apps, configurations
- **Changed** - Improvements, migrations, updates  
- **Fixed** - Bug fixes, corrections, compliance
- **Removed** - Deprecated features, cleanup
- **Security** - Security improvements, image updates
- **Docs** - Documentation, guides, descriptions

#### 🎨 Gitmoji mapping by category

```bash
# 🎉 ADDED - New applications and major features
🎉 Added: [app-name] application to tipi-store
✨ Added: webhook support configuration for [app-name]
📦 Added: environment variable [VAR_NAME] for [app-name]
🔧 Added: health check configuration for [app-name]

# ⚡ CHANGED - Improvements and modifications
⚡ Changed: migrate [app-name] to ghcr.io container registry
🔄 Changed: prefix all environment variables with [APP_NAME]_ in [app-name]
📈 Changed: improve health checks for [app-name]
🎨 Changed: optimize configuration structure for [app-name]

# 🔧 FIXED - Bug fixes and corrections
🔧 Fixed: remove unsupported PUID/PGID from [app-name] config
🐛 Fixed: correct boolean types in [app-name] form fields
🩹 Fixed: schema validation errors in [app-name] config
🚑 Fixed: critical configuration issue in [app-name]

# 🗑️ REMOVED - Deprecations and cleanup
🗑️ Removed: deprecated [VARIABLE_NAME] from [app-name]
🔥 Removed: unused volume mounts in [app-name]
💥 Removed: breaking change - [description] in [app-name]

# 🔒 SECURITY - Security improvements
🔒 Security: update [app-name] image to latest secure tag
🛡️ Security: enhance API key validation in [app-name]
🔐 Security: improve environment variable handling in [app-name]

# 📚 DOCS - Documentation updates
📚 Docs: update [app-name] environment variables section
📝 Docs: add PUID/PGID usage notes to [app-name] description
📖 Docs: improve [app-name] configuration guide
```

## 💡 Commit message examples by scenario

### 🆕 New application commits
```bash
# Initial integration
git commit -m "🎉 Added: paperless-ai application to tipi-store"

# Configuration and features
git commit -m "✨ Added: comprehensive API configuration for paperless-ai"
git commit -m "📦 Added: webhook support and custom prompts for paperless-ai"
git commit -m "🔧 Added: health checks and volume persistence for paperless-ai"

# Documentation
git commit -m "📚 Docs: add complete paperless-ai setup and configuration guide"
git commit -m "📝 Docs: document paperless-ai environment variables and usage"

# Fixes during development
git commit -m "🔧 Fixed: schema validation for paperless-ai config"
git commit -m "🐛 Fixed: correct PUID/PGID support validation in paperless-ai"
```

### 🔄 Application refactoring commits
```bash
# Migration improvements
git commit -m "⚡ Changed: migrate sonarr to ghcr.io container registry"
git commit -m "🔄 Changed: prefix all environment variables with SONARR_ in sonarr"

# Configuration fixes
git commit -m "🔧 Fixed: remove unsupported PUID/PGID from beszel config"
git commit -m "🐛 Fixed: correct boolean types in prowlarr form fields"
git commit -m "🩹 Fixed: schema compliance issues in tautulli config"

# Feature additions
git commit -m "✨ Added: webhook configuration support for overseerr"
git commit -m "📦 Added: custom timeout settings for radarr API"

# Documentation updates
git commit -m "📚 Docs: update plex environment variables documentation"
git commit -m "📝 Docs: add advanced configuration notes for transmission-vpn"

# Security improvements
git commit -m "🔒 Security: update recyclarr image to latest version"
git commit -m "🛡️ Security: enhance API validation in autobrr"

# Cleanup
git commit -m "🗑️ Removed: deprecated DEBUG_MODE variable from lubelogger"
git commit -m "🔥 Removed: unused configuration options in homebox"
```

## 📊 Multi-commit benefits

### ✅ **Advantages of multiple commits:**
- **Clearer history**: Each commit addresses one specific concern
- **Easier reviews**: Reviewers can understand changes step by step
- **Better debugging**: `git bisect` works more effectively with atomic commits
- **Selective rollbacks**: Can revert specific changes without affecting others
- **Improved traceability**: Clear understanding of what changed and why
- **Incremental progress**: Can pause/resume work at logical boundaries
- **Collaborative development**: Multiple people can work on different aspects

### 🎯 **Commit granularity guidelines:**
#### 🔬 **Atomic commits** (1 logical change each):
```bash
✨ Added: webhook URL configuration for sonarr
⚡ Changed: migrate sonarr to ghcr.io container registry  
🔧 Fixed: remove unsupported PUID/PGID from sonarr config
📚 Docs: update sonarr environment variables section
🔧 Fixed: increment tipi_version for sonarr changes
```

#### ⚠️ **Avoid mixed commits** (multiple unrelated changes):
```bash
# ❌ BAD - mixes multiple concerns
🔧 Fixed: update sonarr variables, migrate to ghcr.io, fix docs, and increment version

# ✅ GOOD - separate logical commits
⚡ Changed: prefix all environment variables with SONARR_ in sonarr
⚡ Changed: migrate sonarr to ghcr.io container registry
📚 Docs: update sonarr environment variables documentation
🔧 Fixed: increment tipi_version for sonarr refactoring
```

### 🚀 **Usage examples with multiple commits:**
#### Example 1: Using the multi-commit script
```bash
./multi-commit-app.sh prowlarr \
  'changed:variables:prefix all env vars with PROWLARR_' \
  'changed:docker:migrate to ghcr.io container registry' \
  'fixed:types:correct boolean field types' \
  'docs:update:environment variables documentation' \
  'fixed:version:increment tipi_version for changes'
```

#### Example 2: Interactive workflow
```bash
./interactive-commit.sh tautulli
# Guides you through each logical commit step by step
```

#### Example 3: Manual multi-commit workflow
```bash
# Stage and commit variable changes
git add apps/overseerr/config.json apps/overseerr/docker-compose.json
git commit -m "🔄 Changed: prefix all environment variables with OVERSEERR_ in overseerr"

# Stage and commit Docker changes
git add apps/overseerr/docker-compose.json  
git commit -m "⚡ Changed: migrate overseerr to ghcr.io container registry"

# Stage and commit documentation
git add apps/overseerr/metadata/description.md
git commit -m "📚 Docs: update overseerr configuration and setup guide"

# Stage and commit version increment
git add apps/overseerr/config.json
git commit -m "🔧 Fixed: increment tipi_version for overseerr improvements"
```

## 🎯 Enhanced workflow summary

---

**Objective**: Maintain a clean, professional Git history with clear traceability of all application changes in the tipi-store.
