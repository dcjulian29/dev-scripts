call %~dp0_dev_settings.cmd
set TFCMD=

if exist "%PDIR%\Microsoft Visual Studio 12.0\Common7\IDE\TF.exe" goto TF12
if exist "%PDIR%\Microsoft Visual Studio 11.0\Common7\IDE\TF.exe" goto TF11
if exist "%PDIR%\Microsoft Visual Studio 10.0\Common7\IDE\TF.exe" goto TF10

echo Could not find TFS program. Is it installed?
echo.
exit /b 1

:TF12

set TFCMD="%PDIR%\Microsoft Visual Studio 12.0\Common7\IDE\TF.exe"
goto EOF

:TF11

set TFCMD="%PDIR%\Microsoft Visual Studio 11.0\Common7\IDE\TF.exe"
goto EOF

:TF10

set TFCMD="%PDIR%\Microsoft Visual Studio 10.0\Common7\IDE\TF.exe"
goto EOF

:EOF
