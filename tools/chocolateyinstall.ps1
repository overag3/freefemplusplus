$ErrorActionPreference = 'Stop'
$url64      = 'https://github.com/FreeFem/FreeFem-sources/releases/download/v4.6/FreeFEM-4.6-win7-64.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64bit      = $url64
  softwareName  = 'freefem*'
  checksum64    = '41C9D562AD5A834B2D3B71F4692C6CF3FA16D3B12B71D7D77593CABEF9B74E20'
  checksumType64= 'sha256'
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs