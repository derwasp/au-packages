

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName            = 'eksctl'
  url64bit               = 'https://github.com/weaveworks/eksctl/releases/download/0.1.23/eksctl_Windows_amd64.zip'
  checksum64             = 'd0edb944a15189520d407028c2eaae37aff966e6f1c10bedfd75e79e7fda3558'
  checksumType64         = 'sha256'
  unzipLocation          = '$(Split-Path -parent $MyInvocation.MyCommand.Definition)'
}
Install-ChocolateyZipPackage @packageArgs
