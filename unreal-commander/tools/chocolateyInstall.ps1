

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName            = 'unreal-commander'
  fileType               = 'exe'
  url                    = 'http://unrealcommander.com/download/evolution/uncomsetup3.57(build1289).exe'

  checksum               = 'a07a1ec7d162cbba9a77c875a87ddfef5c91925ac30c835503e566e87e7a348a'

  checksumType           = 'sha256'

  silentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes         = @(0, 3010, 1641)
  softwareName           = 'Unreal Commander*'
  unzipLocation          = '$(Split-Path -parent $MyInvocation.MyCommand.Definition)'

}
Install-ChocolateyPackage @packageArgs
