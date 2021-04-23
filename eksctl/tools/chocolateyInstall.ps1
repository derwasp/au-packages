
$installDir = Split-Path $MyInvocation.MyCommand.Definition
Write-Host "eksctl is going to be installed in '$installDir'"

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName            = 'eksctl'
  url64bit               = 'https://github.com/weaveworks/eksctl/releases/download/0.46.0/eksctl_Windows_amd64.zip'
  checksum64             = '7f3373c09f814f38d1b5c6607f1367e2b7d4d491c33ea4b2e93308f606f32da5'
  checksumType64         = 'sha256'
  unzipLocation          = $installDir
}
Install-ChocolateyZipPackage @packageArgs
