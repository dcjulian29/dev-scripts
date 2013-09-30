@echo off
setlocal

set OLDDIR=%CD%

if [%1] == [] goto CURDIR

pushd "%1"
if exist Data goto CONT

echo.
echo the directory specified does not contain a RavenDB database.
echo.

goto EOF

:CURDIR

if exist Data goto CONT

echo.
echo Please execute this command from the RavenDB database directory.
echo.

goto EOF

:CONT

%WINDIR%\System32\esentutl.exe /r RVN /l logs /s system

:EOF

if [%CD%] == [%OLDDIR%] goto SKIPPOP

popd

:SKIPPOP

endlocal
