#!/usr/bin/env pwsh

<#
.SYNOPSIS
    Detects major version updates in Renovate PRs
.DESCRIPTION
    This script analyzes Renovate PR body content to detect major version updates
    using 5 sophisticated patterns. Used by the CI/CD workflow to determine
    whether to auto-merge or require manual review.
.PARAMETER PrBody
    The PR body content to analyze (typically from github.event.pull_request.body)
.OUTPUTS
    Sets GITHUB_OUTPUT with is_major=true/false
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$PrBody
)

Write-Output "🔍 Analyzing PR for major version update..."
Write-Output "=== PR Body Analysis ==="
Write-Output $PrBody
Write-Output "========================="

$isMajor = $false

# Pattern 1: Check for "major" keyword in update type column
if ($PrBody -match "\|\s*major\s*\|" -or $PrBody -match "Type.*major") {
    $isMajor = $true
    Write-Output "✓ Major version detected: 'major' keyword found in table"
}

# Pattern 2: Check for version jump pattern (e.g., 1.x.x -> 2.x.x)
# Look for version numbers with arrow between them, but be more careful about context
if ($PrBody -match '(\d+)\.\d+\.\d+.*→.*(\d+)\.\d+\.\d+') {
    $fromMajor = [int]$matches[1]
    $toMajor = [int]$matches[2]
    # Only consider it major if it's a significant jump and in right context
    if ($toMajor -gt $fromMajor -and $fromMajor -lt 10 -and $toMajor -lt 10) {
        $isMajor = $true
        Write-Output "✓ Major version detected: version jump from $fromMajor.x.x to $toMajor.x.x"
    }
}

# Pattern 3: Check for Renovate update table format
if ($PrBody -match "Update.*Change.*Notes" -and $PrBody -match "major") {
    $isMajor = $true
    Write-Output "✓ Major version detected: found in Renovate update table"
}

# Pattern 4: Check for semver major bump indicators
if ($PrBody -match "BREAKING.*CHANGE" -or $PrBody -match "breaking.*change") {
    $isMajor = $true
    Write-Output "✓ Major version detected: breaking change mentioned"
}

# Pattern 5: Check for specific Renovate table format with arrows
if ($PrBody -match "\d+\.\d+\.\d+.*→.*\d+\.\d+\.\d+" -and $PrBody -match "major") {
    $isMajor = $true
    Write-Output "✓ Major version detected: Renovate update table with major change"
}

# Output result for GitHub Actions
if ($env:GITHUB_OUTPUT) {
    Write-Output "is_major=$isMajor" >> $env:GITHUB_OUTPUT
}

# Console output
if ($isMajor) {
    Write-Output "🚫 MAJOR UPDATE DETECTED - Automerge will be SKIPPED"
    exit 0  # Not an error, just a major update
}
else {
    Write-Output "✅ Minor/Patch update - Automerge will proceed"
    exit 0
}
