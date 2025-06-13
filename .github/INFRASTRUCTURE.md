# 🛠️ .github Directory

This directory contains the CI/CD infrastructure and automation tools for the tipi-store monorepo.

## 📁 Directory Structure

```
.github/
├── workflows/                          # GitHub Actions workflows
│   ├── update-configs-renovate.yml    # Renovate automation (major version detection)
│   ├── validate-configs.yml           # Manual contribution validation
│   ├── test.yml                       # Application testing
│   ├── lint.yml                       # Code linting
│   └── README.md                      # Workflow documentation
├── scripts/                           # PowerShell automation scripts
│   ├── backup-config.ps1              # Config backup utility
│   ├── update-config.ps1              # Version synchronization
│   ├── validate-config.ps1            # Config consistency check
│   ├── commit-and-push-configs.ps1    # Git operations
│   ├── check-major-version.ps1        # Major update detection
│   ├── validate-json-syntax.ps1       # JSON validation
│   ├── validate-config-structure.ps1  # Config structure validation
│   ├── validate-metadata.ps1          # Metadata completeness check
│   ├── validate-docker-compose.sh     # Docker Compose validation
│   ├── test-major-detection.ps1       # Testing utility
│   ├── test-validate-workflow.ps1     # Workflow testing
│   ├── test-apps.ps1                  # Application testing
│   ├── generate-changelog.ps1         # Changelog generation
│   └── README.md                      # Script documentation
├── RENOVATE_CONFIG_SUMMARY.md         # Renovate configuration details
└── INFRASTRUCTURE.md                  # This file
```

## 🔄 Automated Workflows

### `workflows/update-configs-renovate.yml`
**Purpose**: Automated handling of Renovate dependency updates with intelligent major version detection

**Features**:
- Detects changes in `apps/*/docker-compose.json`
- Automatically updates corresponding `config.json` files
- Validates configuration consistency
- Detects major version updates for manual review
- Auto-merges minor/patch updates after CI validation

**Triggers**:
- Pull requests from `renovate[bot]`
- Manual workflow dispatch

### `workflows/validate-configs.yml`
**Purpose**: Comprehensive validation of application configurations for manual contributions

**Features**:
- Validates JSON syntax for all configuration files
- Checks config.json structure and required fields
- Ensures metadata completeness (description.md, logo.jpg)
- Validates Docker Compose configuration syntax
- Excludes Renovate bot PRs (handled by separate workflow)

**Triggers**:
- Pull requests modifying app configurations (non-Renovate)
- Manual workflow dispatch

### `workflows/test.yml` & `workflows/lint.yml`
**Purpose**: Code quality assurance and application testing

## 🔧 PowerShell Scripts

### `scripts/backup-config.ps1`
Backs up existing `tipi_version` values before updates to ensure rollback capability.

### `scripts/update-config.ps1`
Synchronizes `config.json` files with new Docker image versions from `docker-compose.json` changes.

### `scripts/validate-config.ps1`
Validates consistency between `docker-compose.json` and `config.json` files to catch configuration drift.

## 📚 Documentation

### `RENOVATE_CONFIG_SUMMARY.md`
Comprehensive documentation covering:
- Complete Renovate configuration setup
- CI/CD workflow details
- Major update detection patterns
- Security controls and automation policies
- Performance optimizations

**[📖 View Full Configuration Documentation](./RENOVATE_CONFIG_SUMMARY.md)**

## 🚦 Automation Flow

```mermaid
graph LR
    A[Renovate PR] --> B{Major Update?}
    B -->|No| C[Auto-merge]
    B -->|Yes| D[Manual Review]
    C --> E[Deployed]
    D --> F[Manual Merge]
    F --> E
```

## 🏷️ Label System

- **`approved-to-merge`**: Auto-added for minor/patch updates
- **`major-update`**: Added for major version updates
- **`needs-review`**: Requires manual review before merge

## 🔐 Security Features

- **Major version protection**: Prevents automatic merging of potentially breaking changes
- **CI validation required**: All checks must pass before merge
- **Detailed logging**: Complete audit trail of all automation actions
- **Rollback capability**: Easy reversion through version backups

---

## 🚀 Getting Started

1. **Review Configuration**: Check `RENOVATE_CONFIG_SUMMARY.md` for complete setup details
2. **Monitor Workflows**: Watch GitHub Actions for automated updates
3. **Handle Major Updates**: Manually review PRs with `major-update` label
4. **Customize Scripts**: Modify PowerShell scripts as needed for your workflow

For detailed configuration and troubleshooting, see the [complete documentation](./RENOVATE_CONFIG_SUMMARY.md).
