@echo off

setlocal
call C:\bin\development-tools\_dev_settings.cmd

set DN=%DEVF%\nuget-packages
set DST=%DN%\_packages\

pushd %DN%

for /f "tokens=*" %%e in ('dir /b /s *.nupkg') do (
  echo %%e| findstr "_packages" >nul
  if ERRORLEVEL 1 (
    if not exist %DST%%%~ne.nupkg (
      echo -- %%e
      copy %%e %DST%
    )
  )
)
