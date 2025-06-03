@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set "downloadDir=%USERPROFILE%\Downloads\VrataHosek"
if not exist "%downloadDir%" mkdir "%downloadDir%"

set "baseURL=https://justleader.eu/Music/Vrata%%20Hosek/P%%C3%%ADsni%%C4%%8Dky%%20pln%%C3%%A9%%20n%%C4%%9Bhy"

REM Read from filenames.txt
for /f "usebackq delims=" %%F in ("filenames.txt") do (
    set "filename=%%F"
    call :urlEncode "%%F" encoded
    echo Downloading: !filename!
    curl -s -o "!downloadDir!\!filename!" "!baseURL!/!encoded!"
)

echo.
echo ✅ Done! Files saved to: !downloadDir!
exit /b

:urlEncode
setlocal EnableDelayedExpansion
set "str=%~1"

:: Basic encoding for URL safety (only encoding spaces for now — extend if needed)
set "str=!str: =%%20!"
set "str=!str:(=%%28!"
set "str=!str:)=%%29!"
set "str=!str:č=%%C4%%8D!"
set "str=!str:š=%%C5%%A1!"
set "str=!str:ř=%%C5%%99!"
set "str=!str:í=%%C3%%AD!"
set "str=!str:á=%%C3%%A1!"
set "str=!str:ž=%%C5%%BE!"
set "str=!str:é=%%C3%%A9!"
set "str=!str:ě=%%C4%%9B!"
set "str=!str:ý=%%C3%%BD!"
set "str=!str:ů=%%C5%%AF!"
set "str=!str:ú=%%C3%%BA!"
set "str=!str:ď=%%C4%%8F!"
set "str=!str:ť=%%C5%%A5!"
set "str=!str:ň=%%C5%%88!"
set "str=!str:Á=%%C3%%81!"
set "str=!str:É=%%C3%%89!"
set "str=!str:Ř=%%C5%%98!"
set "str=!str:Č=%%C4%%8C!"
set "str=!str:Š=%%C5%%A0!"
set "str=!str:Ž=%%C5%%BD!"
set "str=!str:Ý=%%C3%%9D!"
set "str=!str:Ú=%%C3%%9A!"
set "str=!str:Í=%%C3%%8D!"

endlocal & set "%~2=%str%"
exit /b