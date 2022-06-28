import-module au

$release = 'https://x-diesel.com/download/uncomsetup.exe'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {

    $request = [System.Net.WebRequest]::Create($release)
    $request.AllowAutoRedirect = $false

    $wr = $request.GetResponse()
    $wr
    $url = $wr.Headers["Location"]
    $url

    $url -match 'uncomsetup(.+)\.([0-9]+)(.*)\(build(.+)\)\.'
    $version = $Matches[1] + "." + $Matches[2] + "." + $Matches[4]

    @{
        URL32   = $url
        Version = $version
    }
}

update -ChecksumFor 32
