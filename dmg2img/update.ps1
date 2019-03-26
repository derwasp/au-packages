import-module au
. $PSScriptRoot\..\_scripts\all.ps1

$releases    = 'http://vu1tur.eu.org/tools/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum)'"
        }
    }
}

# function global:au_BeforeUpdate { Get-RemoteFiles -Purge }
# function global:au_AfterUpdate  { Set-DescriptionFromReadme -SkipFirst 2 }

function global:au_GetLatest {
    # example url:
    # http://vu1tur.eu.org/tools/dmg2img-1.6.7-win32.zip
    $re  = "dmg2img-(.*)-win32.zip"

    $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href
    $url = $releases + $url
    $url -match $re
    $version = $Matches[1]

    return @{
        URL          = $url
        Version      = $version
        ReleaseNotes = "http://vu1tur.eu.org/tools/"
    }
}

update -ChecksumFor 32
