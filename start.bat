@echo off
color 0b
mode con:cols=50 lines=20
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
set GAMENAME=RPGMSD
title %GAMENAME%
set select=1
set max=2
:titlescreen
cls
echo %GAMENAME%
echo.&&echo.&&echo.
if %select%==1 (
	call :ColorText 0f "Play"&&echo.
) else (echo Play)
echo.
if %select%==2 (
	call :ColorText 0f "New Game"&&echo.
) else (echo New Game)
echo.



echo.
choice /c:wsd > NUL
goto titlescreen


goto :eof

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof
