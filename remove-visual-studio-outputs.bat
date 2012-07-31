@echo off

if not exist "%CD%\src" goto EOF

pushd "%CD%\src"

FOR /D /R . %%G in (debug,release,obj) DO (
  @if exist "%%G" (
    echo %%G 
    rmdir /S /Q "%%G"
  )
)

popd

:EOF
