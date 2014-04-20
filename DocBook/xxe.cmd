set DOCDIR=%CD%

pushd %TOOLDEV%\DocBook\dobudish

rmdir /s /q documents 2> null

mkdir documents

call %TOOLBIN%\junction.bat documents\%DOCNAME% %DOCDIR%\%DOCNAME% > nul

call %TOOLBIN%\path-java.bat

call %TOOLDEV%\DocBook\xxe\bin\xxe.bat -read documents\%DOCNAME%\input\%DOCNAME%.xml

echo Continuing will remove the temporary working document directory...
pause

rmdir /s /q documents

popd
