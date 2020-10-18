$ErrorActionPreference = 'Stop'
$url64 = 'https://github.com/FreeFem/FreeFem-sources/releases/download/v4.7-1/FreeFEM-4.7-1-win7-64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = $url64
  softwareName   = 'freefem*'
  checksum64     = '1e4934d93d806405484579ff665e0c056ea9b9827ea79a417c7019436a5333de'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
