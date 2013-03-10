:Determine where the TF.exe command is and set variable

set PDIR="%ProgramFiles(x86)%"

if [%PDIR%] == [""] goto B32

GOTO C1

:B32

set PDIR="%ProgramFiles%"

:C1

set TFCMD=
set PDIR=%PDIR:"=%

if exist "%PDIR%\Microsoft Visual Studio 11.0\Common7\IDE\TF.exe" goto TF11
if exist "%PDIR%\Microsoft Visual Studio 10.0\Common7\IDE\TF.exe" goto TF10

echo Could not find TFS program. Is it installed?
echo.
exit /b 1

:TF11

set TFCMD="%PDIR%\Microsoft Visual Studio 11.0\Common7\IDE\TF.exe"
goto EOF

:TF10

set TFCMD="%PDIR%\Microsoft Visual Studio 10.0\Common7\IDE\TF.exe"
goto EOF

:TFvNext

::Yada Yada Yada

:EOF
