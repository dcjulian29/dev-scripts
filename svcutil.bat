@echo off

call C:\bin\development-tools\_find-sdk-directories.cmd WINDOWS
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

%WSDK%\svcutil.exe %*