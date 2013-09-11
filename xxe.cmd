@echo off
setlocal
call %~dp0_dev_settings.cmd

call %SYSTEMDRIVE%\bin\path-java.bat

set PATH=%DEVT%\DocBook\xxe\bin;%PATH%

pushd %DEVT%\DocBook\xxe\bin\

xxe.bat %*

popd

:EOF

endlocal
