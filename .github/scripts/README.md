# 🔧 PowerShell Automation Scripts

This directory contains PowerShell scripts that automate configuration management for the tipi-store monorepo.

## 📁 Scripts Overview

### `backup-config.ps1`
**Purpose**: Creates backups of existing `tipi_version` values before updates.

#### Functionality
- Scans all changed applications from Renovate PRs
- Extracts current `tipi_version` from `config.json` files
- Stores backup values for potential rollback scenarios
- Provides safety net for configuration updates

#### Usage
```powershell
# Environment variable required: CHANGED_FILES
$env:CHANGED_FILES = "apps/plex/docker-compose.json apps/tautulli/docker-compose.json"
.\backup-config.ps1
```

#### Output
- Console logs showing backup operations
- Temporary storage of previous versions
- Error handling for missing or malformed files

---

### `update-config.ps1`
**Purpose**: Synchronizes `config.json` files with new Docker image versions from `docker-compose.json` changes.

#### Functionality
- Parses `docker-compose.json` files for image version changes
- Extracts new version numbers from Docker image tags
- Updates corresponding `tipi_version` fields in `config.json`
- Maintains configuration consistency across the monorepo

#### Version Extraction Logic
- Supports various Docker image tag formats
- Handles semantic versioning (e.g., `1.2.3`, `v1.2.3`)
- Processes date-based versions and custom tags
- Filters out invalid or malformed version strings

#### Usage
```powershell
# Environment variable required: CHANGED_FILES
$env:CHANGED_FILES = "apps/plex/docker-compose.json apps/tautulli/docker-compose.json"
.\update-config.ps1
```

#### Output
- Updated `config.json` files with new `tipi_version` values
- Console logs showing version changes
- Error reporting for failed updates

---

### `validate-config.ps1`
**Purpose**: Validates consistency between `docker-compose.json` and `config.json` files.

#### Functionality
- Cross-references Docker image versions with `tipi_version` values
- Identifies configuration drift and inconsistencies
- Ensures all applications maintain proper version synchronization
- Provides detailed validation reports

#### Validation Checks
- **Version Consistency**: Docker image version matches `tipi_version`
- **File Integrity**: Both configuration files exist and are readable
- **Format Validation**: JSON structure and required fields are present
- **Dependency Verification**: Related configurations are synchronized

#### Usage
```powershell
# Environment variable required: CHANGED_FILES
$env:CHANGED_FILES = "apps/plex/docker-compose.json apps/tautulli/docker-compose.json"
.\validate-config.ps1
```

#### Output
- Validation success/failure status
- Detailed error messages for inconsistencies
- Recommendations for fixing configuration issues

---

### `validate-metadata.ps1` *(New)*
**Purpose**: Validates that all required metadata files are present for changed applications.

#### Functionality
- Extracts application names from changed file paths
- Checks for required metadata files for each application
- Validates JSON syntax in config and docker-compose files
- Provides detailed reporting on missing or invalid files
- Includes file size warnings for logos and content length checks for descriptions

#### Required Files per Application
- `config.json` (application configuration)
- `docker-compose.json` (Docker Compose setup)
- `metadata/description.md` (application description)
- `metadata/logo.jpg` (application logo)

#### Usage
```powershell
# Environment variable required: CHANGED_FILES
$env:CHANGED_FILES = "apps/plex/config.json apps/tautulli/metadata/description.md"
.\validate-metadata.ps1
```

#### Output
- Validation status for each application
- Detailed error messages for missing files
- Warnings for potential issues (large logos, short descriptions)
- Exit code 0 for success, 1 for validation errors

---

### `test-major-detection.ps1` *(Development/Testing)*
**Purpose**: Tests the major version detection logic used in workflows.

#### Functionality
- Simulates various Renovate PR body formats
- Tests all 5 major update detection patterns
- Validates pattern matching accuracy
- Provides debugging information for detection logic

#### Test Cases
- Minor/patch updates (should not trigger major detection)
- Explicit major updates in Renovate tables
- Version jumps (e.g., 1.x.x → 2.x.x)
- Breaking change mentions
- Various table formats and edge cases

#### Usage
```powershell
.\test-major-detection.ps1
```

#### Output
- Test results with pass/fail status
- Pattern matching details
- Performance metrics for detection logic

---

### `test-validate-workflow.ps1` *(Development/Testing)*
**Purpose**: Tests the validate-configs workflow components and scripts.

#### Functionality
- Verifies all required validation scripts exist
- Tests JSON validation with real config files
- Tests config structure validation
- Tests metadata validation logic
- Validates workflow YAML syntax and structure
- Provides comprehensive testing summary

#### Usage
```powershell
.\test-validate-workflow.ps1
```

#### Output
- Component availability status
- Validation test results
- Script reuse matrix
- Overall migration success summary

## 🔄 Integration with Workflows

These scripts are automatically executed by the GitHub Actions workflow:

```yaml
# Example workflow step
- name: Update config.json only for changed apps
  shell: pwsh
  env:
    CHANGED_FILES: ${{ steps.changed_apps.outputs.all_changed_files }}
  run: |
    pwsh ./.github/scripts/update-config.ps1
```

## 🛠️ Development & Customization

### Adding New Scripts
1. Create new `.ps1` file in this directory
2. Follow existing naming conventions
3. Include proper error handling and logging
4. Update this README with script documentation
5. Add corresponding workflow step if needed

### Modifying Existing Scripts
1. Test changes locally before committing
2. Ensure backward compatibility with existing workflows
3. Update documentation for any parameter changes
4. Consider impact on rollback scenarios

### Best Practices
- Use consistent error handling patterns
- Provide detailed console output for debugging
- Handle edge cases gracefully
- Maintain compatibility with cross-platform PowerShell
- Include input validation for environment variables

## 🔍 Debugging

### Common Issues
- **Missing Environment Variables**: Ensure `CHANGED_FILES` is properly set
- **File Access Errors**: Check file permissions and paths
- **JSON Parsing Failures**: Validate JSON syntax before processing
- **Version Extraction Problems**: Test regex patterns with actual image tags

### Debug Output
All scripts provide verbose logging. Enable additional debugging:

```powershell
# Enable verbose output
$VerbosePreference = "Continue"
.\script-name.ps1
```

### Testing Locally
```powershell
# Set test environment
$env:CHANGED_FILES = "apps/test-app/docker-compose.json"

# Run individual scripts
.\backup-config.ps1
.\update-config.ps1
.\validate-config.ps1
```

## 📊 Performance Considerations

- Scripts are optimized for batch processing multiple applications
- JSON parsing is cached to avoid repeated file reads
- Regex patterns are compiled for better performance
- Error handling prevents cascading failures

## 🔗 Related Files

- [`../workflows/`](../workflows/): GitHub Actions workflows that use these scripts
- [`../RENOVATE_CONFIG_SUMMARY.md`](../RENOVATE_CONFIG_SUMMARY.md): Complete automation documentation
- [`../../renovate.json`](../../renovate.json): Renovate configuration
- [`../../apps/*/config.json`](../../apps/): Application configuration files managed by these scripts
