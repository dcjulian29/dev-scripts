@echo off
setlocal

:: %1 is the name of the package

if not exist "%1" goto :C1

echo.
echo That folder already exist.
echo.

goto EOF

:C1

mkdir %1
pushd %1

(
echo ^<?xml version="1.0" encoding="utf-8"?^>
echo ^<package xmlns="http://schemas.microsoft.com/packaging/2010/07/nuspec.xsd"^>
echo   ^<metadata^>
echo     ^<id^>__REPLACE__^</id^>
echo     ^<version^>__REPLACE__^</version^>
echo     ^<authors^>__REPLACE__^</authors^>
echo     ^<owners^>Julian Easterling^</owners^>
echo     ^<projectUrl^>__REPLACE__^</projectUrl^>
echo     ^<licenseUrl^>__REPLACE__^</licenseUrl^>
echo     ^<requireLicenseAcceptance^>false^</requireLicenseAcceptance^>
echo     ^<description^>__REPLACE__^</description^>
echo     ^<tags^>__REPLACE__^</tags^>
echo     ^<!--^<dependencies^>
echo       ^<dependency id="" version="" /^>
echo     ^</dependencies^>--^>
echo   ^</metadata^>
echo ^</package^>
) > Package.nuspec

mkdir tools
cd tools

(
echo $packageName = "__REPLACE__"
echo $installerType = "__EXE_MSI_OR_MSU__"
echo $installerArgs = "/s /S /q /Q /quiet /silent /SILENT /VERYSILENT"
echo $url = "__REPLACE__"
echo $url64 = "__REPLACE__"
echo.
echo $appDir = "$($env:ChocolateyInstall)\apps\$($packageName)"
echo $toolDir = "$(Split-Path -parent $MyInvocation.MyCommand.Path)"
echo.
echo if ^($psISE^) {
echo     Import-Module -name "$env:ChocolateyInstall\chocolateyinstall\helpers\chocolateyInstaller.psm1"
echo     $ErrorActionPreference = "Stop"
echo }
echo.
echo try
echo {
echo     Install-ChocolateyPackage $packageName $installerType $installerArgs $url $url64
echo.
echo     Write-ChocolateySuccess $packageName
echo }
echo catch
echo {
echo     Write-ChocolateyFailure $packageName $^($_.Exception.Message^)
echo     throw
echo }
) > chocolateyInstall.ps1

(
echo $packageName = "__REPLACE__"
echo $packageWildCard = "*$($package)*";
echo $appDir = "$($env:ChocolateyInstall)\apps\$($packageName)"
echo.
echo try
echo {
echo     # For Portable-Apps
echo     if ^(Test-Path $appDir^)
echo     {
echo       Remove-Item "$($appDir)" -Recurse -Force
echo     }
echo.    
echo     # For Installed Applications ***TODO: Figure out how to elevate these two steps...
echo     $app = Get-WmiObject -Class Win32_Product ^| Where-Object { $_.Name -like $packageWildCard }
echo     if ^($app -not $null^) {
echo         $result = $app.Uninstall^(^);
echo     }
echo.
echo     Write-ChocolateySuccess $packageName
echo }
echo catch
echo {
echo     Write-ChocolateyFailure $packageName $^($_.Exception.Message^)
echo     throw
echo }
) > chocolateyUninstall.ps1


:EOF

endlocal
