@echo off

setlocal

call C:\bin\development-tools\_dev_settings.cmd

set YEAR=%date:~-4,4%
set MONTH=%date:~-10,2%
set DAY=%date:~-7,2%

set FILTER=/version:D%YEAR%-%MONTH%-%DAY%~
::Versionspec:
::    Date/Time         D"any .Net Framework-supported format"
::                      or any of the date formats of the local machine
::    Changeset number  Cnnnnnn
::    Label             Llabelname
::    Latest version    T
::    Workspace         Wworkspacename;workspaceowner
::set TFCMD=%TFCMD% /version:%FILTER%

call %DEVT%\tfs-history.bat %1 %FILTER% *
