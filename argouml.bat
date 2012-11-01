@echo off

C:\bin\run-java start javaw -Duser.home=%CD% -Xms64m -Xmx512m -cp argouml.jar org.argouml.application.Main %1 %2 %3 %4 %5 %6 %7 %8

if errorlevel 1 pause
