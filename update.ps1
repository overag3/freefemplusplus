param([string]$IncludeStream, [switch]$Force)

import-module au

$latestrelease = 'https://github.com/FreeFem/FreeFem-sources/releases/latest'

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url64\s*=\s*)('.*')"              = "`$1'$($Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')"         = "`$1'$($Latest.Checksum64)'"
            "(^\s*checksumType64\s*=\s*)('.*')"     = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $latestrelease -UseBasicParsing
    $regex = 'FreeFEM-.*-win7-64\.exe$'
    $url = ($download_page.Links | Where-Object href -match $regex | Select-Object -First 1 -ExpandProperty href) -split '/', 5 | Select-Object -Last 1
    $version = Get-Version $url

    $releases = $latestrelease.Substring(0, $latestrelease.LastIndexOf('/'))
    return @{
        Version          = $version
        URL64              = "$releases/$url"
    }

}

update -ChecksumFor 64
