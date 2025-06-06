# Generate changelog links and content for all changed apps (to be called in CI)
# Usage: pwsh .github/scripts/generate-changelog.ps1

param(
    [string[]]$ChangedApps
)

$githubToken = $env:GITHUB_TOKEN

$links = @()
$changelogs = @()

foreach ($appPath in $ChangedApps) {
    $configPath = Join-Path $appPath 'config.json'
    if (Test-Path $configPath) {
        $config = Get-Content $configPath | ConvertFrom-Json
        $repo = $config.source
        $version = $config.version
        $name = $config.name
        if ($repo -and $version) {
            # Clean the URL if needed (remove trailing slash)
            if ($repo.EndsWith('/')) { $repo = $repo.Substring(0, $repo.Length - 1) }
            $url = "$repo/releases/tag/$version"
            $links += "- [$name]($url) ($version)"

            # Try to fetch the changelog via the GitHub API
            if ($repo -match "github.com/([^/]+)/([^/]+)") {
                $owner = $matches[1]
                $repoName = $matches[2]
                $apiUrl = "https://api.github.com/repos/$owner/$repoName/releases/tags/$version"
                $headers = @{ 'User-Agent' = 'tipi-bot' }
                if ($githubToken) { $headers['Authorization'] = "token $githubToken" }
                try {
                    $response = Invoke-RestMethod -Uri $apiUrl -Headers $headers
                    if ($response.body) {
                        $changelog = $response.body
                    }
                    elseif ($response.assets -and $response.assets.Count -gt 0) {
                        $changelog = "_No changelog found, but assets are present on the release._"
                    }
                    else {
                        $changelog = "_Changelog not found via GitHub API._"
                    }
                    $changelogs += "#### $name ($version)\n$url\n\n$changelog\n"
                }
                catch {
                    $changelogs += "#### $name ($version)\n$url\n\n_Error while fetching changelog from GitHub API._\n"
                }
            }
            else {
                $changelogs += "#### $name ($version)\n$url\n\n_Non-GitHub source, changelog not fetched automatically._\n"
            }
        }
    }
}

if ($links.Count -gt 0) {
    $out = "### Changelogs for updated apps:`n" + ($links -join "`n") + "`n\n---\n" + ($changelogs -join "`n---\n")
    $out | Set-Content .github/renovate-changelogs.md
    Write-Host $out
}
else {
    Write-Host "No changelog links generated."
}
