@echo off

setlocal


::"(ls $($env:ChocolateyInstall\lib | select basename).basename | % {'cinst ' + $_.split('\.')[0]} | sort -unique"

set PCMD=KABsAHMAIAAkAGUAbgB2ADoAQwBoAG8AYwBvAGwAYQB0AGUAeQBJAG4AcwB0AGEAbABsAFwAbABpAGIAIAB8ACAAcwBlAGwAZQBjAHQAIABiAGEAcwBlAG4AYQBtAGUAKQAuAGIAYQBzAGUAbgBhAG0AZQAgAHwAIAAlACAAewAnAGMAaQBuAHMAdAAgACcAIAArACAAJABfAC4AcwBwAGwAaQB0ACgAJwBcAC4AJwApAFsAMABdAH0AIAB8ACAAcwBvAHIAdAAgAC0AdQBuAGkAcQB1AGUA

call %~dp0\..\binaries\pshell-encoded.cmd %PCMD%

endlocal

:EOF
