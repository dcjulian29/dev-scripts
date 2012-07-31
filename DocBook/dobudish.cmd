@echo off

setlocal

set ODIR=%CD%

pushd %SystemDrive%\bin\development-tools\DocBook\dobudish

rmdir /s /q documents 2> null

mkdir documents

call %SystemDrive%\bin\junction.bat documents\%1 %ODIR%\%1 > nul

call %SystemDrive%\bin\Run-Java.bat generator.bat %*

rmdir /s /q documents

popd

endlocal
