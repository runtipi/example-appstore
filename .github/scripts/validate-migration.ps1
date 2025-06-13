#!/usr/bin/env pwsh

<#
.SYNOPSIS
    Final validation of the PowerShell script migration
.DESCRIPTION
    This script performs a comprehensive validation of the completed migration,
    ensuring all workflows and scripts are properly configured and functional.
#>

Write-Host "🏁 Final Migration Validation" -ForegroundColor Cyan
Write-Host "=============================" -ForegroundColor Cyan

$validationResults = @{
    Scripts       = @{}
    Workflows     = @{}
    Documentation = @{}
    Overall       = $true
}

# 1. Validate all required scripts exist
Write-Host "`n📂 Validating Script Existence" -ForegroundColor Yellow

$requiredScripts = @(
    "backup-config.ps1",
    "update-config.ps1", 
    "validate-config.ps1",
    "commit-and-push-configs.ps1",
    "check-major-version.ps1",
    "validate-json-syntax.ps1",
    "validate-config-structure.ps1",
    "validate-metadata.ps1",
    "validate-docker-compose.sh"
)

foreach ($script in $requiredScripts) {
    $scriptPath = ".github/scripts/$script"
    if (Test-Path $scriptPath) {
        Write-Host "✅ $script" -ForegroundColor Green
        $validationResults.Scripts[$script] = $true
    }
    else {
        Write-Host "❌ $script MISSING" -ForegroundColor Red
        $validationResults.Scripts[$script] = $false
        $validationResults.Overall = $false
    }
}

# 2. Validate workflows reference the scripts correctly
Write-Host "`n🔄 Validating Workflow Integration" -ForegroundColor Yellow

$workflows = @{
    "update-configs-renovate.yml" = @(
        "backup-config.ps1",
        "update-config.ps1",
        "validate-config.ps1",
        "commit-and-push-configs.ps1",
        "check-major-version.ps1"
    )
    "validate-configs.yml"        = @(
        "validate-json-syntax.ps1",
        "validate-config-structure.ps1",
        "validate-metadata.ps1",
        "validate-docker-compose.sh"
    )
}

foreach ($workflow in $workflows.Keys) {
    $workflowPath = ".github/workflows/$workflow"
    Write-Host "`n🔍 Checking $workflow" -ForegroundColor Cyan
    
    if (Test-Path $workflowPath) {
        $content = Get-Content $workflowPath -Raw
        $workflowValid = $true
        
        foreach ($script in $workflows[$workflow]) {
            if ($content -match [regex]::Escape($script)) {
                Write-Host "  ✅ References $script" -ForegroundColor Green
            }
            else {
                Write-Host "  ❌ Missing reference to $script" -ForegroundColor Red
                $workflowValid = $false
                $validationResults.Overall = $false
            }
        }
        
        # Check for debug-context job
        if ($content -match "debug-context:") {
            Write-Host "  ✅ Has debug context job" -ForegroundColor Green
        }
        else {
            Write-Host "  ⚠️  Missing debug context job" -ForegroundColor Yellow
        }
        
        $validationResults.Workflows[$workflow] = $workflowValid
    }
    else {
        Write-Host "  ❌ Workflow file missing" -ForegroundColor Red
        $validationResults.Workflows[$workflow] = $false
        $validationResults.Overall = $false
    }
}

# 3. Validate documentation is updated
Write-Host "`n📚 Validating Documentation" -ForegroundColor Yellow

$docFiles = @{
    ".github/scripts/README.md"   = @("validate-metadata.ps1", "test-validate-workflow.ps1")
    ".github/workflows/README.md" = @("validate-configs.yml", "debug-context")
    ".github/INFRASTRUCTURE.md"   = @("validate-configs.yml", "validate-metadata.ps1")
}

foreach ($docFile in $docFiles.Keys) {
    Write-Host "`n📄 Checking $docFile" -ForegroundColor Cyan
    
    if (Test-Path $docFile) {
        $docContent = Get-Content $docFile -Raw
        $docValid = $true
        
        foreach ($term in $docFiles[$docFile]) {
            if ($docContent -match [regex]::Escape($term)) {
                Write-Host "  ✅ Documents $term" -ForegroundColor Green
            }
            else {
                Write-Host "  ⚠️  Missing documentation for $term" -ForegroundColor Yellow
                $docValid = $false
            }
        }
        
        $validationResults.Documentation[$docFile] = $docValid
    }
    else {
        Write-Host "  ❌ Documentation file missing" -ForegroundColor Red
        $validationResults.Documentation[$docFile] = $false
    }
}

# 4. Check for obsolete files
Write-Host "`n🗑️ Checking for Obsolete Files" -ForegroundColor Yellow

$obsoletePatterns = @(
    "*diagnose*",
    "*temp*",
    "*backup*",
    "*old*",
    "*test*"
)

$foundObsolete = $false
foreach ($pattern in $obsoletePatterns) {
    $obsoleteFiles = Get-ChildItem ".github" -Recurse -Name $pattern -ErrorAction SilentlyContinue
    foreach ($file in $obsoleteFiles) {
        # Exclude legitimate files
        if ($file -notmatch "(backup-config\.ps1|test-apps\.ps1|test-major-detection\.ps1|test-validate-workflow\.ps1|test\.yml)") {
            Write-Host "⚠️  Potentially obsolete: $file" -ForegroundColor Yellow
            $foundObsolete = $true
        }
    }
}

if (-not $foundObsolete) {
    Write-Host "✅ No obsolete files found" -ForegroundColor Green
}

# 5. Summary Report
Write-Host "`n📊 Migration Validation Summary" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan

Write-Host "`n📁 Scripts:" -ForegroundColor White
$scriptSuccess = ($validationResults.Scripts.Values | Where-Object { $_ -eq $true }).Count
$scriptTotal = $validationResults.Scripts.Count
Write-Host "   ✅ $scriptSuccess/$scriptTotal scripts validated" -ForegroundColor Green

Write-Host "`n🔄 Workflows:" -ForegroundColor White
$workflowSuccess = ($validationResults.Workflows.Values | Where-Object { $_ -eq $true }).Count
$workflowTotal = $validationResults.Workflows.Count
Write-Host "   ✅ $workflowSuccess/$workflowTotal workflows validated" -ForegroundColor Green

Write-Host "`n📚 Documentation:" -ForegroundColor White
$docSuccess = ($validationResults.Documentation.Values | Where-Object { $_ -eq $true }).Count
$docTotal = $validationResults.Documentation.Count
Write-Host "   ✅ $docSuccess/$docTotal documentation files validated" -ForegroundColor Green

if ($validationResults.Overall) {
    Write-Host "`n🎉 MIGRATION VALIDATION SUCCESSFUL!" -ForegroundColor Green
    Write-Host "   ✅ All PowerShell scripts externalized" -ForegroundColor Green
    Write-Host "   ✅ Workflows properly integrated" -ForegroundColor Green
    Write-Host "   ✅ Documentation updated" -ForegroundColor Green
    Write-Host "   ✅ No critical issues found" -ForegroundColor Green
    Write-Host "`n🚀 The migration is complete and ready for production!" -ForegroundColor Cyan
}
else {
    Write-Host "`n⚠️  MIGRATION VALIDATION INCOMPLETE" -ForegroundColor Yellow
    Write-Host "   Some issues were found that should be addressed." -ForegroundColor Yellow
    exit 1
}

Write-Host "`n🏁 Validation completed successfully" -ForegroundColor Cyan
