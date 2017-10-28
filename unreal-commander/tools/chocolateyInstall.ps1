

$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName            = 'unreal-commander'
  fileType               = 'exe'
  url                    = 'http://x-diesel.net/download/evolution/uncomsetup3.57(build1244).exe'

  checksum               = 'bb76ec7d342b6e4f76d1babeaf34cc3d4383659912a9fe404678e29da7227358'

  checksumType           = 'sha256'

  silentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes         = @(0, 3010, 1641)
  softwareName           = 'Unreal Commander*'
  unzipLocation          = '$(Split-Path -parent $MyInvocation.MyCommand.Definition)'

}
Install-ChocolateyPackage @packageArgs
