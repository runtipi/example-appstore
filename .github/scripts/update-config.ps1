# Update config.json only for changed apps (PR Renovate)
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
            $mainVersion = (Get-Content $config | ConvertFrom-Json).version
        }
        $configJson = Get-Content $config | ConvertFrom-Json
        $tipiVersion = $configJson.tipi_version
        if ($tipiVersion -match '^[0-9]+$') {
            $newTipiVersion = [int]$tipiVersion + 1
        }
        else {
            $newTipiVersion = 1
        }
        # updatedAt must be an integer (no decimals) and support large timestamps
        $updatedAt = [long]([double]::Parse((Get-Date -UFormat %s)) * 1000)
        $configJson.tipi_version = $newTipiVersion
        $configJson.version = $mainVersion
        $configJson.updated_at = $updatedAt
        $configJson | ConvertTo-Json -Depth 10 | Set-Content $config
    }
}
