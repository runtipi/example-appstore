#!/usr/bin/env pwsh

<#
.SYNOPSIS
    Validates metadata files for application configurations
.DESCRIPTION
    This script checks that all required metadata files are present for changed applications.
    It ensures each app has the necessary config.json, docker-compose.json, description.md, and logo.jpg files.
.PARAMETER ChangedFiles
    Space-separated list of changed files from GitHub Actions
.OUTPUTS
    Exit code 0 for success, 1 for validation errors
#>

param(
    [string]$ChangedFiles = $env:CHANGED_FILES
)

# Validate environment
if (-not $ChangedFiles) {
    Write-Error "❌ Environment variable CHANGED_FILES is required"
    exit 1
}

Write-Output "📋 Validating metadata files for changed applications..."
Write-Output "Changed files: $ChangedFiles"

$hasErrors = $false
$changedFiles = $ChangedFiles -split ' '
$changedApps = @()

# Extract app names from changed files
foreach ($file in $changedFiles) {
    if ($file -match 'apps/([^/]+)/') {
        $appName = $matches[1]
        if ($changedApps -notcontains $appName) {
            $changedApps += $appName
            Write-Output "📦 Detected changed app: $appName"
        }
    }
}

if ($changedApps.Count -eq 0) {
    Write-Output "ℹ️  No applications detected in changed files"
    exit 0
}

foreach ($app in $changedApps) {
    Write-Output "`n🔍 Checking metadata for app: $app"
    
    # Define required files for each application
    $requiredFiles = @(
        @{
            Path        = "apps/$app/config.json"
            Description = "Application configuration"
        },
        @{
            Path        = "apps/$app/docker-compose.json" 
            Description = "Docker Compose configuration"
        },
        @{
            Path        = "apps/$app/metadata/description.md"
            Description = "Application description"
        },
        @{
            Path        = "apps/$app/metadata/logo.jpg"
            Description = "Application logo"
        }
    )
    
    $appHasErrors = $false
    
    foreach ($requiredFile in $requiredFiles) {
        if (-not (Test-Path $requiredFile.Path)) {
            Write-Output "❌ Missing required file: $($requiredFile.Path) ($($requiredFile.Description))"
            $hasErrors = $true
            $appHasErrors = $true
        }
        else {
            Write-Output "✅ Found: $($requiredFile.Path)"
            
            # Additional validation for specific file types
            if ($requiredFile.Path -match '\.json$') {
                try {
                    $jsonContent = Get-Content $requiredFile.Path -Raw | ConvertFrom-Json
                    Write-Output "  📄 JSON syntax is valid"
                }
                catch {
                    Write-Output "  ❌ JSON syntax error: $($_.Exception.Message)"
                    $hasErrors = $true
                    $appHasErrors = $true
                }
            }
            
            if ($requiredFile.Path -match 'description\.md$') {
                $mdContent = Get-Content $requiredFile.Path -Raw
                if ($mdContent.Length -lt 50) {
                    Write-Output "  ⚠️  Description seems very short (less than 50 characters)"
                }
            }
            
            if ($requiredFile.Path -match 'logo\.jpg$') {
                $logoSize = (Get-Item $requiredFile.Path).Length
                if ($logoSize -gt 500KB) {
                    Write-Output "  ⚠️  Logo file is quite large ($('{0:N1}' -f ($logoSize/1KB)) KB)"
                }
            }
        }
    }
    
    if (-not $appHasErrors) {
        Write-Output "✅ All metadata files valid for app: $app"
    }
}

if ($hasErrors) {
    Write-Output "`n❌ Metadata validation failed - some required files are missing or invalid"
    Write-Output "💡 Ensure each application has all required metadata files:"
    Write-Output "   - config.json (application configuration)"
    Write-Output "   - docker-compose.json (Docker Compose setup)"
    Write-Output "   - metadata/description.md (application description)"
    Write-Output "   - metadata/logo.jpg (application logo)"
    exit 1
}
else {
    Write-Output "`n✅ All required metadata files are present and valid"
    exit 0
}
