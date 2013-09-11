@echo off

setlocal

call %SYSTEMDRIVE%\bin\path-java.bat

set PATH=%SystemDrive%\bin\development-tools\DocBook\xxe\bin;%PATH%

pushd %SystemDrive%\bin\development-tools\DocBook\xxe\bin\

xxe.bat %*

popd

:EOF

endlocal
