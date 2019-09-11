
$installDir = Split-Path $MyInvocation.MyCommand.Definition
Write-Host "eksctl is going to be installed in '$installDir'"

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName            = 'eksctl'
  url64bit               = 'https://github.com/weaveworks/eksctl/releases/download/0.5.3/eksctl_Windows_amd64.zip'
  checksum64             = '5d561b004338d80eaf6f885e4eec7e539ae64bd915723c7029f637965fcda666'
  checksumType64         = 'sha256'
  unzipLocation          = $installDir
}
Install-ChocolateyZipPackage @packageArgs
