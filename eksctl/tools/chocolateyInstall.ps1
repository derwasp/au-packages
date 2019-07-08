
$installDir = Split-Path $MyInvocation.MyCommand.Definition
Write-Host "eksctl is going to be installed in '$installDir'"

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName            = 'eksctl'
  url64bit               = 'https://github.com/weaveworks/eksctl/releases/download/0.1.39/eksctl_Windows_amd64.zip'
  checksum64             = '84f10d1329021233f90be294a88a2d5bb83c618cb3e06e20cb2962e52522ccf2'
  checksumType64         = 'sha256'
  unzipLocation          = $installDir
}
Install-ChocolateyZipPackage @packageArgs
