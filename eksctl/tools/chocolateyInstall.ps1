

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName            = 'eksctl'
  url64bit               = ''
  checksum64             = ''
  checksumType64         = 'sha256'
  unzipLocation          = '$(Split-Path -parent $MyInvocation.MyCommand.Definition)'
}
Install-ChocolateyZipPackage @packageArgs
