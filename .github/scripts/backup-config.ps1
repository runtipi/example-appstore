# Backup previous config.json tipi_version for changed apps
$changed = $env:CHANGED_FILES -split '\s+'
foreach ($compose in $changed) {
    $app = Split-Path $compose -Parent
    $config = Join-Path $app 'config.json'
    $backup = "$config.prev"
    if (Test-Path $config -PathType Leaf) {
        Copy-Item $config $backup -Force
    }
}
