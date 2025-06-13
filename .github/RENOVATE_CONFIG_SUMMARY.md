# 🔄 Renovate & CI/CD Configuration - tipi-store

## 📋 Configuration Summary

### 🗂️ File Standardization
- **config.json** : Standardized key order (id, available, port, name, etc.)
- **docker-compose.json** : String format ports, consistent structure
- **description.md** : Structured emoji format and standardized sections

### 🔄 Renovate Configuration (`renovate.json`)
```json
{
  "schedule": ["* */1 * * *"],          // Hourly checks
  "timezone": "Europe/Paris",           // French timezone
  "prConcurrentLimit": 10,              // Max 10 simultaneous PRs
  "prHourlyLimit": 0,                   // No hourly limit
  "allowedVersions": "<100"             // Blocks year versions (2021.x.x)
}
```

### 🏷️ Docker Registry Management
- **Migration** : `lscr.io/linuxserver/*` → `ghcr.io/linuxserver/*`
- **Filtering** : Semantic versions only (blocks 2021.x.x, 2022.x.x, etc.)
- **Control** : Specific rules for LinuxServer images

### 🚦 Automated CI/CD Workflow
**File** : `.github/workflows/update-configs-renovate.yml`

#### Workflow Steps :
1. **Detection** : Changes in `apps/*/docker-compose.json`
2. **Backup** : Backup existing `tipi_version` versions
3. **Update** : Automatic synchronization of `config.json`
4. **Validation** : Consistency verification
5. **Commit** : Automatic push of changes
6. **Analysis** : Major update detection (5 patterns)
7. **Automerge** : Automatic merge if minor/patch + CI OK

#### 🔍 Major Update Detection (5 Patterns)
1. **"major" keyword** in Renovate tables
2. **Version jump** (ex: `1.x.x` → `2.x.x`)
3. **Renovate table format** with "major" in "Update"/"Change"
4. **Breaking changes** mentioned (BREAKING CHANGE/breaking change)
5. **Specific table** with arrows and "major"

#### 🏷️ Label System
- **`approved-to-merge`** : Auto-added for minor/patch updates
- **`major-update`** : Added for major updates
- **`needs-review`** : Requires manual review

### 🔧 PowerShell Scripts
- **`backup-config.ps1`** : Backup tipi versions
- **`update-config.ps1`** : Automatic config updates
- **`validate-config.ps1`** : Consistency validation

### 🎯 Optimized Workflow

#### For Minor/Patch Updates :
```
Renovate PR → CI Validation → Auto-merge → Deployed
```

#### For Major Updates :
```
Renovate PR → Major Detection → Labels → Manual Review → Manual Merge
```

### 🔐 Security & Control
- **Major protection** : No automerge for major versions
- **CI required** : All checks must pass
- **Rollback** : Easy rollback capability
- **Detailed logs** : Complete debug in workflows

### 📈 Performance
- **Parallelization** : Maximum 10 simultaneous PRs
- **Optimal frequency** : Hourly checks
- **Smart filtering** : Avoids problematic versions

---

## 🚀 Benefits of this Configuration

1. **Complete automation** of dependency updates
2. **Enhanced security** with major change detection
3. **Consistency** across all application files
4. **Improved visibility** with detailed logs
5. **Flexibility** with manual override capability
6. **Optimized performance** for large monorepo

This configuration ensures automated and secure maintenance of the tipi store while preserving stability and quality of the offered applications.
