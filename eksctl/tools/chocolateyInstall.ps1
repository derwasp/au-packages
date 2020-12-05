
$installDir = Split-Path $MyInvocation.MyCommand.Definition
Write-Host "eksctl is going to be installed in '$installDir'"

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName            = 'eksctl'
  url64bit               = 'https://github.com/weaveworks/eksctl/releases/download/0.33.0/eksctl_Windows_amd64.zip'
  checksum64             = 'a0609c25af0baaad0a056593e76d7cf16345062cf40426ab6c8328b96bee29fc'
  checksumType64         = 'sha256'
  unzipLocation          = $installDir
}
Install-ChocolateyZipPackage @packageArgs
