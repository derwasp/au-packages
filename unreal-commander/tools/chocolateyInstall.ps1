

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName            = 'unreal-commander'
  fileType               = 'exe'
  url                    = 'http://unrealcommander.biz/download/evolution/uncomsetup3.57(build1260).exe'

  checksum               = 'b3f8e21c5fbac7fbe06e771a741c3548c08543ba98d8817d91c8bff70ca2fbd1'

  checksumType           = 'sha256'

  silentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes         = @(0, 3010, 1641)
  softwareName           = 'Unreal Commander*'
  unzipLocation          = '$(Split-Path -parent $MyInvocation.MyCommand.Definition)'

}
Install-ChocolateyPackage @packageArgs
