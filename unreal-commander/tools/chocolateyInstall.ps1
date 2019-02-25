

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName            = 'unreal-commander'
  fileType               = 'exe'
  url                    = 'http://unrealcommander.org/download/evolution/uncomsetup3.57(build1401).exe'

  checksum               = 'f3922e93f1d1565bfd8cca501b2ba87233ed3aec42607a587012224f14d3e925'

  checksumType           = 'sha256'

  silentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes         = @(0, 3010, 1641)
  softwareName           = 'Unreal Commander*'
  unzipLocation          = '$(Split-Path -parent $MyInvocation.MyCommand.Definition)'

}
Install-ChocolateyPackage @packageArgs
