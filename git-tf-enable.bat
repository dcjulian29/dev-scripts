@echo off

echo Enabling git-tf...

for /f "usebackq delims=" %%O in (`where dev-path.bat`) do set BINPATH=%%~dpO
set DEVPATH=%BINPATH%development-tools

path %DEVPATH%\git-tf;%PATH%
