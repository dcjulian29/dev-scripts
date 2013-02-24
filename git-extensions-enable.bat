@echo off

echo Enabling Git Extensions...

for /f "usebackq delims=" %%O in (`where dev-path.bat`) do set BINPATH=%%~dpO
set DEVPATH=%BINPATH%development-tools

path %DEVPATH%\GitExtensions;%PATH%
