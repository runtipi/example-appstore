#!/usr/bin/env pwsh

<#
.SYNOPSIS
    Diagnose why Renovate workflow is not triggering
.DESCRIPTION
    This script analyzes the workflow configuration and GitHub settings to identify
    why the update-configs-renovate workflow is not executing for Renovate PRs.
#>

param(
    [string]$PrNumber = "38",
    [string]$RepoPath = "."
)

Write-Host "🔍 Diagnostic du problème de workflow Renovate" -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan

# Check current directory
$currentDir = Get-Location
Write-Host "📂 Répertoire actuel: $currentDir" -ForegroundColor Yellow

# Check if we're in a git repository
if (-not (Test-Path ".git")) {
    Write-Error "❌ Pas dans un dépôt Git. Naviguez vers le répertoire du dépôt."
    exit 1
}

# Check workflow file exists
$workflowFile = ".github/workflows/update-configs-renovate.yml"
if (-not (Test-Path $workflowFile)) {
    Write-Error "❌ Fichier workflow non trouvé: $workflowFile"
    exit 1
}

Write-Host "✅ Fichier workflow trouvé: $workflowFile" -ForegroundColor Green

# Check workflow triggers
Write-Host "`n📋 Analyse des déclencheurs du workflow:" -ForegroundColor Cyan
$workflowContent = Get-Content $workflowFile -Raw
if ($workflowContent -match "on:\s*\n\s*push:|on:\s*\n\s*pull_request:") {
    Write-Host "✅ Déclencheurs configurés (push/pull_request)" -ForegroundColor Green
} else {
    Write-Host "❌ Déclencheurs non trouvés ou mal configurés" -ForegroundColor Red
}

# Check if condition exists
if ($workflowContent -match "if:\s*github\.actor\s*==\s*'renovate\[bot\]'") {
    Write-Host "✅ Condition Renovate trouvée: github.actor == 'renovate[bot]'" -ForegroundColor Green
} else {
    Write-Host "❌ Condition Renovate non trouvée ou mal configurée" -ForegroundColor Red
}

# Check recent commits for Renovate activity
Write-Host "`n🔍 Recherche de l'activité Renovate récente:" -ForegroundColor Cyan
try {
    $renovateCommits = git log --oneline --author="renovate" --since="7 days ago" 2>$null
    if ($renovateCommits) {
        Write-Host "✅ Commits Renovate trouvés dans les 7 derniers jours:" -ForegroundColor Green
        $renovateCommits | ForEach-Object { Write-Host "  - $_" -ForegroundColor Gray }
    } else {
        Write-Host "⚠️  Aucun commit Renovate trouvé dans les 7 derniers jours" -ForegroundColor Yellow
    }
} catch {
    Write-Host "❌ Erreur lors de la recherche des commits Renovate: $_" -ForegroundColor Red
}

# Check for Renovate branches
Write-Host "`n🔍 Recherche des branches Renovate:" -ForegroundColor Cyan
try {
    $renovateBranches = git branch -a | Where-Object { $_ -match "renovate" }
    if ($renovateBranches) {
        Write-Host "✅ Branches Renovate trouvées:" -ForegroundColor Green
        $renovateBranches | ForEach-Object { Write-Host "  - $_" -ForegroundColor Gray }
    } else {
        Write-Host "⚠️  Aucune branche Renovate trouvée" -ForegroundColor Yellow
    }
} catch {
    Write-Host "❌ Erreur lors de la recherche des branches: $_" -ForegroundColor Red
}

# Check GitHub Actions status
Write-Host "`n🔍 Vérification du statut GitHub Actions:" -ForegroundColor Cyan
try {
    $actionsEnabled = Test-Path ".github/workflows"
    if ($actionsEnabled) {
        Write-Host "✅ Répertoire .github/workflows existe" -ForegroundColor Green
        $workflowFiles = Get-ChildItem ".github/workflows" -Filter "*.yml" -Recurse
        Write-Host "📝 Fichiers de workflow trouvés:" -ForegroundColor Yellow
        $workflowFiles | ForEach-Object { Write-Host "  - $($_.Name)" -ForegroundColor Gray }
    }
} catch {
    Write-Host "❌ Erreur lors de la vérification: $_" -ForegroundColor Red
}

# Check for duplicate or conflicting workflows
Write-Host "`n🔍 Recherche de workflows en conflit:" -ForegroundColor Cyan
$potentialConflicts = @(
    ".github/workflows/auto-merge.yml",
    ".github/workflows/validate-configs.yml",
    ".github/workflows/renovate.yml"
)

foreach ($conflict in $potentialConflicts) {
    if (Test-Path $conflict) {
        Write-Host "⚠️  Workflow potentiellement en conflit trouvé: $conflict" -ForegroundColor Yellow
    }
}

# Check Renovate configuration
Write-Host "`n🔍 Vérification de la configuration Renovate:" -ForegroundColor Cyan
$renovateConfigs = @(
    ".github/renovate.json",
    "renovate.json",
    ".renovaterc.json"
)

foreach ($config in $renovateConfigs) {
    if (Test-Path $config) {
        Write-Host "✅ Configuration Renovate trouvée: $config" -ForegroundColor Green
        try {
            $renovateConfig = Get-Content $config | ConvertFrom-Json
            if ($renovateConfig.automerge -eq $false) {
                Write-Host "✅ automerge: false configuré (laisse le workflow gérer le merge)" -ForegroundColor Green
            } elseif ($renovateConfig.automerge -eq $true) {
                Write-Host "⚠️  automerge: true configuré (peut interférer avec le workflow)" -ForegroundColor Yellow
            }
        } catch {
            Write-Host "❌ Erreur lors de l'analyse de la configuration: $_" -ForegroundColor Red
        }
    }
}

# Recommendations
Write-Host "`n💡 Recommandations pour résoudre le problème:" -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan

Write-Host "1. Vérifiez que GitHub Actions est activé dans les paramètres du dépôt" -ForegroundColor Yellow
Write-Host "2. Vérifiez les permissions du token GITHUB_TOKEN" -ForegroundColor Yellow
Write-Host "3. Assurez-vous qu'il n'y a pas de workflows en conflit" -ForegroundColor Yellow
Write-Host "4. Vérifiez que Renovate utilise bien 'renovate[bot]' comme nom d'utilisateur" -ForegroundColor Yellow
Write-Host "5. Testez le workflow manuellement avec workflow_dispatch" -ForegroundColor Yellow

# Test workflow syntax
Write-Host "`n🔍 Test de la syntaxe du workflow:" -ForegroundColor Cyan
try {
    # Basic YAML syntax check (PowerShell doesn't have a built-in YAML parser)
    $yamlContent = Get-Content $workflowFile -Raw
    if ($yamlContent -match "name:|on:|jobs:") {
        Write-Host "✅ Structure YAML de base valide" -ForegroundColor Green
    } else {
        Write-Host "❌ Structure YAML invalide" -ForegroundColor Red
    }
} catch {
    Write-Host "❌ Erreur lors du test de syntaxe: $_" -ForegroundColor Red
}

Write-Host "`n🏁 Diagnostic terminé" -ForegroundColor Cyan
