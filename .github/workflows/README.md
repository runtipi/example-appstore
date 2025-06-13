# 🔄 GitHub Actions Workflows

This directory contains automated workflows for the tipi-store monorepo.

## 📁 Workflows

### `update-configs-renovate.yml`
**Purpose**: Automated handling of Renovate dependency updates with intelligent major version detection.

#### Triggers
- **Pull Requests**: Automatically runs when `renovate[bot]` creates PRs
- **Push Events**: Triggers on main/master branch pushes
- **Manual Dispatch**: Can be triggered manually from GitHub Actions UI

#### Workflow Steps

1. **🔍 Detection**: Identifies changes in `apps/*/docker-compose.json` files
2. **💾 Backup**: Creates backup of existing `tipi_version` values
3. **🔄 Update**: Synchronizes `config.json` files with new Docker versions
4. **✅ Validation**: Ensures consistency between docker-compose and config files
5. **📝 Commit**: Automatically commits and pushes configuration updates
6. **🎯 Analysis**: Analyzes PR content for major version updates using 5 detection patterns
7. **🚀 Automerge**: Automatically merges minor/patch updates after CI validation

#### Major Version Detection Patterns

The workflow uses 5 sophisticated patterns to detect major updates:

1. **Keyword Detection**: Searches for "major" in Renovate update tables
2. **Version Jump Analysis**: Detects semantic version jumps (e.g., 1.x.x → 2.x.x)
3. **Table Format Recognition**: Identifies Renovate's standard table format with major changes
4. **Breaking Change Keywords**: Looks for "BREAKING CHANGE" or "breaking change" mentions
5. **Arrow Pattern Matching**: Recognizes version arrows with major classification

#### Label Management

- **`approved-to-merge`**: Auto-applied to minor/patch updates ready for merge
- **`major-update`**: Applied to major version updates requiring manual review
- **`needs-review`**: Added to PRs that need human intervention

#### Security Features

- **🛡️ Major Version Protection**: Prevents automatic merging of potentially breaking changes
- **🔒 CI Validation Required**: All checks must pass before any merge
- **📊 Detailed Logging**: Complete audit trail with debug information
- **🔄 Rollback Capability**: Easy reversion through version backups

#### Configuration

The workflow is specifically configured for:
- **Renovate Bot Only**: Only executes for `renovate[bot]` actor
- **Docker Compose Focus**: Monitors `apps/*/docker-compose.json` changes
- **PowerShell Scripts**: Uses Windows PowerShell for cross-platform compatibility
- **GitHub CLI Integration**: Leverages `gh` CLI for PR management

## 🚀 Usage

### Automatic Operation
The workflow runs automatically when Renovate creates dependency update PRs. No manual intervention required for minor/patch updates.

### Manual Operation
```bash
# Trigger workflow manually
gh workflow run "Update & Validate Metadata & Configs of Upgraded Apps"
```

### Monitoring
```bash
# View workflow runs
gh run list --workflow="update-configs-renovate.yml"

# View specific run details
gh run view <run-id>
```

## 🔧 Customization

To modify the workflow behavior:

1. **Update Detection Patterns**: Modify the PowerShell patterns in the "Check if update is major version" step
2. **Change Labels**: Update label names in the label management steps
3. **Adjust Security**: Modify conditions for automerge approval
4. **Add Notifications**: Include Slack/Discord notifications for major updates

## 📊 Metrics & Monitoring

The workflow provides detailed logs for:
- PR body content analysis
- Pattern matching results
- Version comparison details
- Automerge decisions
- Error handling and debugging

## 🔗 Related Files

- [`../scripts/`](../scripts/): PowerShell scripts used by this workflow
- [`../RENOVATE_CONFIG_SUMMARY.md`](../RENOVATE_CONFIG_SUMMARY.md): Complete configuration documentation
- [`../../renovate.json`](../../renovate.json): Renovate configuration file
