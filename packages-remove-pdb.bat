@echo off

if not exist "%CD%\Packages" goto EOF

setlocal EnableDelayedExpansion

pushd Packages

set ROOTPATH=%CD%
set CUT=

:LOOP
if not "!ROOTPATH!" == "" (
  set /a CUT += 1
  set ROOTPATH=!ROOTPATH:~1!
  goto LOOP
)

set /a CUT += 1

for /F "tokens=*" %%G in ('dir /B /S *.pdb') do (
  set FILENAME=%%~fG
  set FILENAME=!FILENAME:~%CUT%!

  echo == !FILENAME!

  del /F /Q "%%G"
)

popd

endlocal

:EOF
