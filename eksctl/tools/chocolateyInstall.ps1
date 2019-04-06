
$installDir = Split-Path $MyInvocation.MyCommand.Definition
Write-Host "eksctl is going to be installed in '$installDir'"

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName            = 'eksctl'
  url64bit               = 'https://github.com/weaveworks/eksctl/releases/download/0.1.28/eksctl_Windows_amd64.zip'
  checksum64             = '9a7ed10cdb22250347c7b0abb0a70ba140f7ec9c167b6dd187949164992a08ba'
  checksumType64         = 'sha256'
  unzipLocation          = $installDir
}
Install-ChocolateyZipPackage @packageArgs
