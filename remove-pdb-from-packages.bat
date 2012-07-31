@echo off

if not exist "%CD%\Packages" goto EOF

pushd Packages
FOR /F "tokens=*" %%G IN ('DIR /B /S *.pdb') DO (
  echo %%G
  rm -f %%G
)
popd

:EOF
