# Check that each app has the required files and valid config/docker-compose

# Detect the repository root (presence of README.md)
function Get-RepoRoot {
    $current = $PSScriptRoot
    while ($current -ne [System.IO.Path]::GetPathRoot($current)) {
        if (Test-Path (Join-Path $current 'README.md')) {
            return $current
        }
        $current = Split-Path $current -Parent
    }
    throw 'Could not find repository root (README.md missing)'
}

$repoRoot = Get-RepoRoot
$appsPath = Join-Path $repoRoot 'apps'
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

Write-Host ""
Write-Host "Validating config.json and docker-compose.json for each app..."
foreach ($app in $apps) {
    $configPath = Join-Path $appsPath $app 'config.json'
    $composePath = Join-Path $appsPath $app 'docker-compose.json'
    if (Test-Path $configPath) {
        try {
            Get-Content $configPath -Raw | ConvertFrom-Json | Out-Null
            Write-Host "✔ $app config.json is valid JSON" -ForegroundColor Green
        }
        catch {
            Write-Host "❌ $app config.json is not valid JSON" -ForegroundColor Red
            $errors++
        }
    }
    if (Test-Path $composePath) {
        try {
            Get-Content $composePath -Raw | ConvertFrom-Json | Out-Null
            Write-Host "✔ $app docker-compose.json is valid JSON" -ForegroundColor Green
        }
        catch {
            Write-Host "❌ $app docker-compose.json is not valid JSON" -ForegroundColor Red
            $errors++
        }
    }
}

# Prepare local directory for schemas
$schemasDir = Join-Path $repoRoot '.github/schemas'
if (-not (Test-Path $schemasDir)) {
    New-Item -ItemType Directory -Path $schemasDir | Out-Null
}

$schemas = @(
    @{ file = 'config.json'; schema = 'https://schemas.runtipi.io/app-info.json'; local = (Join-Path $schemasDir 'app-info.json') },
    @{ file = 'docker-compose.json'; schema = 'https://schemas.runtipi.io/dynamic-compose.json'; local = (Join-Path $schemasDir 'dynamic-compose.json') }
)

# Download schemas if needed
foreach ($s in $schemas) {
    if (-not (Test-Path $s.local)) {
        Write-Host "Downloading schema $($s.schema) ..."
        Invoke-WebRequest -Uri $s.schema -OutFile $s.local
    }
}

Write-Host ""
Write-Host "Validating JSON files against their schemas..."
# Advanced JSON Schema validation (config.json and docker-compose.json)
# Requires ajv-cli installed globally (npm install -g ajv-cli)
$ajv = "ajv"
foreach ($app in $apps) {
    foreach ($s in $schemas) {
        $filePath = Join-Path $appsPath $app $s.file
        if (Test-Path $filePath) {
            $ajvArgs = @('validate', '-s', $s.local, '-d', $filePath, '--strict=false')
            & $ajv @ajvArgs | Out-Null
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

Write-Host ""
Write-Host "Checking for forbidden/unexpected files or folders in each app..."
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
    Write-Host ""
    Write-Host "$errors error(s) found." -ForegroundColor Red
    exit 1
}
else {
    Write-Host ""
    Write-Host "All checks passed!" -ForegroundColor Green
    exit 0
}
