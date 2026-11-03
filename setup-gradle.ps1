# Run from PowerShell: .\setup-gradle.ps1
# Downloads official Gradle 8.13 into this project's .tools folder.
$ErrorActionPreference = 'Stop'
$taskRoot = $PSScriptRoot
$taskTools = Join-Path $taskRoot '.tools'
New-Item -ItemType Directory -Force -Path $taskTools | Out-Null
$taskZip = Join-Path $taskTools 'gradle-8.13-bin.zip'
$taskUrl = 'https://services.gradle.org/distributions/gradle-8.13-bin.zip'
Invoke-WebRequest -Uri $taskUrl -OutFile $taskZip
$taskExpected = (Invoke-RestMethod -Uri ($taskUrl + '.sha256')).Trim()
$taskActual = (Get-FileHash -LiteralPath $taskZip -Algorithm SHA256).Hash
if ($taskActual -ne $taskExpected) { throw 'Gradle checksum mismatch. Download was not extracted.' }
Expand-Archive -LiteralPath $taskZip -DestinationPath $taskTools -Force
Write-Host 'Gradle installed. Open this folder in Android Studio, configure the local Gradle distribution as .tools/gradle-8.13, then sync.'
Write-Host 'To generate the standard wrapper after installing JDK and Android SDK:'
Write-Host '.\.tools\gradle-8.13\bin\gradle.bat wrapper --gradle-version 8.13'
