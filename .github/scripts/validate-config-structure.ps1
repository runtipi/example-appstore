#!/usr/bin/env pwsh

<#
.SYNOPSIS
    Validates config.json structure for manual contributions
.DESCRIPTION
    This script validates the structure and required fields of config.json files
    in manual PRs to ensure they meet tipi-store requirements.
.OUTPUTS
    Exit code 0 for success, 1 for validation errors
#>

if (-not $env:CHANGED_FILES) {
    Write-Error "❌ Environment variable CHANGED_FILES is required"
    exit 1
}

Write-Output "🔍 Validating config.json structure for manual contribution..."

$hasErrors = $false
$changedFiles = $env:CHANGED_FILES -split ' '

foreach ($file in $changedFiles) {
    if ($file -match 'config\.json$') {
        Write-Output "🔍 Validating config structure: $file"
        
        if (-not (Test-Path $file)) {
            Write-Output "❌ Config file not found: $file"
            $hasErrors = $true
            continue
        }
        
        try {
            $config = Get-Content $file -Raw | ConvertFrom-Json
            
            # Check required fields
            $requiredFields = @('id', 'available', 'port', 'name', 'description', 'tipi_version')
            $missingFields = @()
            
            foreach ($field in $requiredFields) {
                if (-not $config.PSObject.Properties.Name.Contains($field)) {
                    $missingFields += $field
                    $hasErrors = $true
                }
            }
            
            if ($missingFields.Count -gt 0) {
                Write-Output "❌ Missing required fields in $file : $($missingFields -join ', ')"
            }
            
            # Check port is numeric
            if ($config.port -and $config.port -notmatch '^\d+$') {
                Write-Output "❌ Port must be numeric in $file (found: '$($config.port)')"
                $hasErrors = $true
            }
            
            # Check boolean fields
            if ($config.PSObject.Properties.Name.Contains('available') -and $config.available -isnot [bool]) {
                Write-Output "❌ 'available' field must be boolean in $file"
                $hasErrors = $true
            }
            
            # Check tipi_version format (basic validation)
            if ($config.tipi_version -and $config.tipi_version -notmatch '^[\d\.\w\-]+$') {
                Write-Output "❌ Invalid tipi_version format in $file"
                $hasErrors = $true
            }
            
            if (-not $hasErrors) {
                Write-Output "✅ Valid config structure: $file"
            }
        }
        catch {
            Write-Output "❌ Error parsing config file $file : $($_.Exception.Message)"
            $hasErrors = $true
        }
    }
}

if ($hasErrors) {
    Write-Output ""
    Write-Output "❌ Config validation failed - please fix structure errors before merge"
    Write-Output "📋 Required fields: id, available, port, name, description, tipi_version"
    Write-Output "📋 Field requirements:"
    Write-Output "   - port: must be numeric"
    Write-Output "   - available: must be boolean"
    Write-Output "   - tipi_version: alphanumeric with dots and hyphens"
    exit 1
}
else {
    Write-Output ""
    Write-Output "✅ All config files have valid structure"
    exit 0
}
