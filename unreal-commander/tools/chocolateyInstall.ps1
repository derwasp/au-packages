

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName            = 'unreal-commander'
  fileType               = 'exe'
  url                    = 'https://unrealcommander.com/download/evolution/uncomsetup3.57(build1495).exe'

  checksum               = '0940208d8f9d1703e0b770c5f9d16cec51164b5ee2343b3a42ed0a9d9fad6991'

  checksumType           = 'sha256'

  silentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes         = @(0, 3010, 1641)
  softwareName           = 'Unreal Commander*'
  unzipLocation          = '$(Split-Path -parent $MyInvocation.MyCommand.Definition)'

}
Install-ChocolateyPackage @packageArgs
