
$installDir = Split-Path $MyInvocation.MyCommand.Definition
Write-Host "dmg2img is going to be installed in '$installDir'"

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName            = 'dmg2img'
  url                    = ''
  checksum               = ''
  checksumType           = 'sha256'
  unzipLocation          = $installDir
}
Install-ChocolateyZipPackage @packageArgs
