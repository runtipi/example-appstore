# Test script for major version detection logic
# This script simulates different Renovate PR body formats to test our detection patterns

Write-Output "🧪 Testing Major Version Detection Logic"
Write-Output "========================================"

# Test cases with different Renovate PR body formats
$testCases = @(
    @{
        name = "Minor update (patch)"
        body = @"
| Package | Update | Change | Notes |
|---------|--------|--------|-------|
| linuxserver/plex | minor | `1.32.5.7516` → `1.32.5.7517` | [sourcegraph](https://sourcegraph.com/search) |
"@
        expected = $false
    },
    @{
        name = "Major update"
        body = @"
| Package | Update | Change | Notes |
|---------|--------|--------|-------|
| linuxserver/plex | major | `1.32.5.7516` → `2.0.0.1234` | [sourcegraph](https://sourcegraph.com/search) |
"@
        expected = $true
    },    @{
        name = "Version jump (1.x → 2.x)"
        body = @"
| Package | Change |
|---------|--------|
| ghcr.io/linuxserver/overseerr | `1.33.2` → `2.0.0` |
"@
        expected = $true
    },
    @{
        name = "Renovate table format with major jump"
        body = @"
| Package | Update | Change | Notes |
|---------|--------|--------|-------|
| ghcr.io/linuxserver/overseerr | major | `1.33.2` → `2.0.0` | [sourcegraph](https://sourcegraph.com/search) |
"@
        expected = $true
    },
    @{
        name = "Breaking change mentioned"
        body = @"
## Release Notes
This update contains **BREAKING CHANGES** that require manual intervention.
"@
        expected = $true
    },
    @{
        name = "Simple patch update"
        body = @"
| Package | Update | Change | Notes |
|---------|--------|--------|-------|
| ghcr.io/linuxserver/tautulli | patch | `2.13.4` → `2.13.5` | |
"@
        expected = $false
    }
)

# Test each case
foreach ($test in $testCases) {
    Write-Output ""
    Write-Output "🔍 Testing: $($test.name)"
    Write-Output "Expected: $(if ($test.expected) { 'MAJOR' } else { 'NOT MAJOR' })"
    
    $isMajor = $false
    $prBody = $test.body
    
    # Pattern 1: Check for "major" keyword in update type column
    if ($prBody -match "\|\s*major\s*\|" -or $prBody -match "Type.*major") {
        $isMajor = $true
        Write-Output "✓ Pattern 1 matched: 'major' keyword found in table"
    }    # Pattern 2: Check for version jump pattern (e.g., 1.x.x -> 2.x.x)
    # Look for version numbers with arrow between them, but be more careful about context
    Write-Output "  Checking Pattern 2 with regex: '(\d+)\.\d+\.\d+.*→.*(\d+)\.\d+\.\d+'"
    if ($prBody -match '(\d+)\.\d+\.\d+.*→.*(\d+)\.\d+\.\d+') {
        $fromMajor = [int]$matches[1]
        $toMajor = [int]$matches[2]
        Write-Output "  Found versions: $fromMajor -> $toMajor"
        # Only consider it major if it's a significant jump and in right context
        if ($toMajor -gt $fromMajor -and $fromMajor -lt 10 -and $toMajor -lt 10) {
            $isMajor = $true
            Write-Output "✓ Pattern 2 matched: version jump from $fromMajor.x.x to $toMajor.x.x"
        } else {
            Write-Output "  Version jump not significant enough or out of range"
        }
    } else {
        Write-Output "  Pattern 2 did not match"
    }
    
    # Pattern 3: Check for Renovate update table format
    if ($prBody -match "Update.*Change.*Notes" -and $prBody -match "major") {
        $isMajor = $true
        Write-Output "✓ Pattern 3 matched: found in Renovate update table"
    }
    
    # Pattern 4: Check for semver major bump indicators
    if ($prBody -match "BREAKING.*CHANGE" -or $prBody -match "breaking.*change") {
        $isMajor = $true
        Write-Output "✓ Pattern 4 matched: breaking change mentioned"
    }
    
    # Pattern 5: Check for specific Renovate table format with arrows
    if ($prBody -match "\d+\.\d+\.\d+.*→.*\d+\.\d+\.\d+" -and $prBody -match "major") {
        $isMajor = $true
        Write-Output "✓ Pattern 5 matched: Renovate update table with major change"
    }
    
    $result = if ($isMajor) { "MAJOR" } else { "NOT MAJOR" }
    $status = if ($isMajor -eq $test.expected) { "✅ PASS" } else { "❌ FAIL" }
    
    Write-Output "Result: $result $status"
}

Write-Output ""
Write-Output "🎯 Testing completed!"
