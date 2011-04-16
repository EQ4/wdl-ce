REM - batch file to build 32&64 bit VS2010 project and zip the resulting dlls
REM - requires 7zip in C:\Program Files\7-Zip\7z.exe

echo "making IPlugControlsDemo win distribution..."

IF EXIST "%programfiles(x86)%" (GOTO 64-Bit) ELSE (GOTO 32-Bit)

:32-Bit
ECHO 32-Bit O/S detected
call "C:\Program Files\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"
GOTO END

:64-Bit
ECHO 64-Bit Host O/S detected
call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"
GOTO END

:END
msbuild IPlugControlsDemo.vcxproj /p:configuration=release /p:platform=win32
msbuild IPlugControlsDemo.vcxproj /p:configuration=release /p:platform=x64

"C:\Program Files\7-Zip\7z.exe" a IPlugControlsDemo-win-32bit.zip .\build-win\bin32\IPlugControlsDemo.dll
"C:\Program Files\7-Zip\7z.exe" a IPlugControlsDemo-win-64bit.zip .\build-win\bin64\IPlugControlsDemo.dll

