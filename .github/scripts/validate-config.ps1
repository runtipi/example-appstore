# Check config.json update consistency for changed apps
$errors = 0
$changed = $env:CHANGED_FILES -split '\s+'
foreach ($compose in $changed) {
    $app = Split-Path $compose -Parent
    $config = Join-Path $app 'config.json'
    if (Test-Path $config -PathType Leaf) {
        $composeJson = Get-Content $compose | ConvertFrom-Json
        $mainService = $composeJson.services | Where-Object { $_.isMain -eq $true }
        if ($mainService -and $mainService.image) {
            $mainImage = $mainService.image
            $mainVersion = $mainImage.Split(':')[-1]
        }
        else {
            $mainVersion = $null
        }
        $configJson = Get-Content $config | ConvertFrom-Json
        $configVersion = $configJson.version
        $configUpdatedAt = $configJson.updated_at
        $configTipiVersion = $configJson.tipi_version

        # Check version consistency
        if ($mainVersion -and $configVersion -ne $mainVersion) {
            Write-Host "❌ Version mismatch in $($app): config.json version '$($configVersion)' != docker-compose version '$($mainVersion)'"
            $errors++
        }
        else {
            Write-Host "✔ Version match in $($app): $($configVersion)"
        }

        # Check that updated_at was updated (must be greater than previous value if available)
        $previousTipiVersionFile = "$config.prev"
        $prevUpdatedAt = $null
        if (Test-Path $previousTipiVersionFile) {
            $prevUpdatedAt = (Get-Content $previousTipiVersionFile | ConvertFrom-Json).updated_at
            if ([int64]$configUpdatedAt -le [int64]$prevUpdatedAt) {
                Write-Host "❌ updated_at field in $($app) is not greater than previous: $($configUpdatedAt) (previous: $($prevUpdatedAt))"
                $errors++
            }
            else {
                Write-Host "✔ updated_at field in $($app) is greater than previous: $($configUpdatedAt) (previous: $($prevUpdatedAt))"
            }
        }
        else {
            # Fallback: Check that updated_at is recent (timestamp > 0 and < now + 1min)
            $now = [int][double]::Parse((Get-Date -UFormat %s)) * 1000
            if ($configUpdatedAt -lt ($now - 60000) -or $configUpdatedAt -gt ($now + 60000)) {
                Write-Host "❌ updated_at field in $($app) is not recent: $($configUpdatedAt) (now: $($now))"
                $errors++
            }
            else {
                Write-Host "✔ updated_at field in $($app) is recent: $($configUpdatedAt)"
            }
        }

        # Check that tipi_version was incremented by 1 (compare with previous version if available)
        if (Test-Path $previousTipiVersionFile) {
            $prevTipiVersion = (Get-Content $previousTipiVersionFile | ConvertFrom-Json).tipi_version
            if ([int]$configTipiVersion -ne ([int]$prevTipiVersion + 1)) {
                Write-Host "❌ tipi_version in $($app) did not increment by 1: $($configTipiVersion) (previous: $($prevTipiVersion))"
                $errors++
            }
            else {
                Write-Host "✔ tipi_version in $($app) incremented by 1: $($configTipiVersion) (previous: $($prevTipiVersion))"
            }
        }
        else {
            Write-Host "⚠ No previous tipi_version found for $($app), skipping tipi_version check."
        }
    }
}
if ($errors -gt 0) {
    Write-Error "Some config.json files are not consistent. See errors above."
    exit 1
}
else {
    Write-Host "All config.json files are consistent."
}
