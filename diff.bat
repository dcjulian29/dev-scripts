@echo off
setlocal
SET CYGWIN=%CYGWIN% nodosfilewarning

set PATH=C:\cygwin\bin;%PATH%

C:\cygwin\bin\diff.exe %*
