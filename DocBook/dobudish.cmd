set DOCDIR=%CD%

if %2 == create mkdir %1

pushd %TOOLDEV%\DocBook\dobudish

rmdir /s /q documents 2> null

mkdir documents

call %TOOLBIN%\junction.bat documents\%DOCNAME% %DOCDIR%\%DOCNAME% > nul

call %TOOLBIN%\path-java.bat

call generator.bat %*

rmdir /s /q documents

popd
