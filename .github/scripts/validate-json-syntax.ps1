#!/usr/bin/env pwsh

<#
.SYNOPSIS
    Validates JSON syntax for manual contributions
.DESCRIPTION
    This script validates JSON syntax for all changed JSON files in manual PRs.
    Ensures configuration files maintain proper JSON format before merge.
.OUTPUTS
    Exit code 0 for success, 1 for validation errors
#>

if (-not $env:CHANGED_FILES) {
    Write-Error "❌ Environment variable CHANGED_FILES is required"
    exit 1
}

Write-Output "📋 Validating JSON files for manual contribution..."

$hasErrors = $false
$changedFiles = $env:CHANGED_FILES -split ' '

foreach ($file in $changedFiles) {
    if ($file -match '\.(json)$') {
        Write-Output "🔍 Validating JSON syntax: $file"
        
        if (-not (Test-Path $file)) {
            Write-Output "❌ File not found: $file"
            $hasErrors = $true
            continue
        }
        
        try {
            $content = Get-Content $file -Raw | ConvertFrom-Json
            Write-Output "✅ Valid JSON: $file"
        }
        catch {
            Write-Output "❌ Invalid JSON: $file"
            Write-Output "Error: $($_.Exception.Message)"
            $hasErrors = $true
        }
    }
}

if ($hasErrors) {
    Write-Output ""
    Write-Output "❌ JSON validation failed - please fix syntax errors before merge"
    exit 1
} else {
    Write-Output ""
    Write-Output "✅ All JSON files are valid"
    exit 0
}
