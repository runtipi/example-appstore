# Check that each app has the required files and valid config/docker-compose

$appsPath = Join-Path $PSScriptRoot '../apps'
$apps = Get-ChildItem -Path $appsPath -Directory | Select-Object -ExpandProperty Name

$requiredFiles = @('config.json', 'docker-compose.json', 'metadata/logo.jpg', 'metadata/description.md')
$forbidden = @('tmp', 'temp', 'backup', '.bak', '.tmp', '.swp', '.DS_Store', 'Thumbs.db')
$errors = 0

Write-Host "Checking required files for each app..."
foreach ($app in $apps) {
    foreach ($file in $requiredFiles) {
        $filePath = Join-Path $appsPath $app | Join-Path -ChildPath $file
        if (-not (Test-Path $filePath)) {
            Write-Host "❌ $app is missing $file" -ForegroundColor Red
            $errors++
        }
        else {
            Write-Host "✔ $app has $file" -ForegroundColor Green
        }
    }
}

Write-Host "\nValidating config.json and docker-compose.json for each app..."
foreach ($app in $apps) {
    $configPath = Join-Path $appsPath $app 'config.json'
    $composePath = Join-Path $appsPath $app 'docker-compose.json'
    if (Test-Path $configPath) {
        try {
            $config = Get-Content $configPath -Raw | ConvertFrom-Json
            Write-Host "✔ $app config.json is valid JSON" -ForegroundColor Green
        }
        catch {
            Write-Host "❌ $app config.json is not valid JSON" -ForegroundColor Red
            $errors++
        }
    }
    if (Test-Path $composePath) {
        try {
            $compose = Get-Content $composePath -Raw | ConvertFrom-Json
            Write-Host "✔ $app docker-compose.json is valid JSON" -ForegroundColor Green
        }
        catch {
            Write-Host "❌ $app docker-compose.json is not valid JSON" -ForegroundColor Red
            $errors++
        }
    }
}

# Advanced JSON Schema validation (config.json and docker-compose.json)
# Requires ajv-cli installed globally (npm install -g ajv-cli)
$ajv = "ajv"
$schemas = @(
    @{ file = 'config.json'; schema = 'https://schemas.runtipi.io/app-info.json' },
    @{ file = 'docker-compose.json'; schema = 'https://schemas.runtipi.io/dynamic-compose.json' }
)
Write-Host "\nValidating JSON files against their schemas..."
foreach ($app in $apps) {
    foreach ($s in $schemas) {
        $filePath = Join-Path $appsPath $app $s.file
        if (Test-Path $filePath) {
            $cmd = "$ajv validate -s $($s.schema) -d $filePath --strict=false"
            Invoke-Expression $cmd | Out-Null
            if ($LASTEXITCODE -ne 0) {
                Write-Host "❌ $app $($s.file) does not match schema" -ForegroundColor Red
                $errors++
            }
            else {
                Write-Host "✔ $app $($s.file) matches schema" -ForegroundColor Green
            }
        }
    }
}

Write-Host "\nChecking for forbidden/unexpected files or folders in each app..."
foreach ($app in $apps) {
    $appPath = Join-Path $appsPath $app
    $allFiles = Get-ChildItem -Path $appPath -Recurse -File -Force | Select-Object -ExpandProperty Name
    foreach ($forbid in $forbidden) {
        $forbiddenMatches = $allFiles | Where-Object { $_ -like "*$forbid*" }
        foreach ($match in $forbiddenMatches) {
            Write-Host "❌ $app contains forbidden file or folder: $match" -ForegroundColor Red
            $errors++
        }
    }
}

if ($errors -gt 0) {
    Write-Host "\n$errors error(s) found." -ForegroundColor Red
    exit 1
}
else {
    Write-Host "\nAll checks passed!" -ForegroundColor Green
    exit 0
}
