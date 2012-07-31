@echo off

setlocal

set PATH=%SystemDrive%\bin\development-tools\DocBook\xxe\bin;%PATH%

pushd %SystemDrive%\bin\development-tools\DocBook\xxe\bin\

%SystemDrive%\bin\Run-Java.bat xxe.bat %*

popd
