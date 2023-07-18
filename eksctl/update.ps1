import-module au
. $PSScriptRoot\..\_scripts\all.ps1

$releases    = 'https://github.com/eksctl-io/eksctl/releases'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64bit\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
        }
    }
}

# function global:au_BeforeUpdate { Get-RemoteFiles -Purge }
# function global:au_AfterUpdate  { Set-DescriptionFromReadme -SkipFirst 2 }

function global:au_GetLatest {

    $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases
    $version = $download_page.Links |
                ?{$_.href -like "*/releases/tag*"} |
                ?{$_.href -notlike "*/latest_release" } |
                %{
                        $fullUrl = $_.href
                        $releases_tags_str = "releases/tag/"
                        $index = $fullUrl.IndexOf($releases_tags_str)
                        $fullIndex = $index + $releases_tags_str.Length
                        $fullUrl.Substring($fullIndex)
                   } |
                ?{-not $_.Contains("-")} |
                Select -First 1

    $version = $version -replace "v",""
    $url = "https://github.com/eksctl-io/eksctl/releases/download/v$version/eksctl_Windows_amd64.zip"

    return @{
        URL64        = $url
        Version      = $version
        ReleaseNotes = "$releases/tag/${version}"
    }
}

update -ChecksumFor 64
