#!/usr/bin/env pwsh

<#
.SYNOPSIS
    Test the Renovate workflow by creating a test PR
.DESCRIPTION
    This script creates a test scenario to verify that the update-configs-renovate workflow
    is working correctly by simulating a Renovate-like change.
#>

param(
    [string]$AppName = "huntarr",
    [string]$TestVersion = "v7.9.0-test"
)

Write-Host "🧪 Test du workflow Renovate" -ForegroundColor Cyan
Write-Host "=============================" -ForegroundColor Cyan

# Check if we're in the right directory
if (-not (Test-Path "apps/$AppName")) {
    Write-Error "❌ Application '$AppName' non trouvée dans le répertoire apps/"
    exit 1
}

# Check current branch
$currentBranch = git branch --show-current
Write-Host "📍 Branche actuelle: $currentBranch" -ForegroundColor Yellow

if ($currentBranch -ne "main") {
    Write-Host "⚠️  Pas sur la branche main. Basculement..." -ForegroundColor Yellow
    git checkout main
    git pull origin main
}

# Create test branch
$testBranch = "test-renovate-workflow-$AppName-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
Write-Host "🌿 Création de la branche de test: $testBranch" -ForegroundColor Green

git checkout -b $testBranch

# Read current docker-compose.json
$dockerComposeFile = "apps/$AppName/docker-compose.json"
if (-not (Test-Path $dockerComposeFile)) {
    Write-Error "❌ Fichier docker-compose.json non trouvé: $dockerComposeFile"
    exit 1
}

Write-Host "📝 Modification du fichier docker-compose.json..." -ForegroundColor Yellow

# Read and parse JSON
$dockerCompose = Get-Content $dockerComposeFile -Raw | ConvertFrom-Json

# Find the image property and update the version
$services = $dockerCompose.services
$serviceKey = $services | Get-Member -Type NoteProperty | Select-Object -First 1 -ExpandProperty Name
$currentImage = $services.$serviceKey.image

if ($currentImage -match '^(.+):(.+)$') {
    $imageName = $matches[1]
    $currentVersion = $matches[2]
    $newImage = "$imageName:$TestVersion"
    
    Write-Host "🔄 Mise à jour de l'image:" -ForegroundColor Cyan
    Write-Host "  Avant: $currentImage" -ForegroundColor Gray
    Write-Host "  Après: $newImage" -ForegroundColor Green
    
    # Update the image
    $services.$serviceKey.image = $newImage
    
    # Save the updated JSON
    $dockerCompose | ConvertTo-Json -Depth 10 | Set-Content $dockerComposeFile -Encoding UTF8
    
    Write-Host "✅ Fichier docker-compose.json mis à jour" -ForegroundColor Green
} else {
    Write-Error "❌ Format d'image non reconnu: $currentImage"
    exit 1
}

# Commit the change
Write-Host "💾 Commit des modifications..." -ForegroundColor Yellow
git add $dockerComposeFile
git commit -m "chore(deps): update $imageName docker tag to $TestVersion (TEST)"

# Push the branch
Write-Host "📤 Push de la branche de test..." -ForegroundColor Yellow
git push origin $testBranch

Write-Host "`n🎯 Étapes suivantes:" -ForegroundColor Cyan
Write-Host "1. Créez une PR depuis la branche '$testBranch' vers 'main'" -ForegroundColor Yellow
Write-Host "2. Définissez l'auteur de la PR comme 'renovate[bot]' (si possible)" -ForegroundColor Yellow
Write-Host "3. Observez si le workflow 'update-configs-renovate' se déclenche" -ForegroundColor Yellow
Write-Host "4. Vérifiez les logs dans l'onglet Actions de GitHub" -ForegroundColor Yellow

Write-Host "`n🔗 Commandes utiles:" -ForegroundColor Cyan
Write-Host "   Créer PR: gh pr create --title 'TEST: chore(deps): update $imageName docker tag to $TestVersion' --body 'Test automatique du workflow Renovate'" -ForegroundColor Gray
Write-Host "   Voir logs: gh run list --workflow='update-configs-renovate.yml'" -ForegroundColor Gray
Write-Host "   Nettoyer: git checkout main && git branch -D $testBranch && git push origin --delete $testBranch" -ForegroundColor Gray

Write-Host "`n✅ Branche de test créée et poussée avec succès!" -ForegroundColor Green
