
$installDir = Split-Path $MyInvocation.MyCommand.Definition
Write-Host "dmg2img is going to be installed in '$installDir'"

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName            = 'dmg2img'
  url                    = 'http://vu1tur.eu.org/tools/dmg2img-1.6.7-win32.zip'
  checksum               = 'c33595575b08d04ab3cd1d7bc0339fc7ffa473d5969ce29a2a206d08dc4f42a4'
  checksumType           = 'sha256'
  unzipLocation          = $installDir
}
Install-ChocolateyZipPackage @packageArgs
