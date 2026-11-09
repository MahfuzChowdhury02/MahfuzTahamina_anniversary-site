@echo off
rem Opens the anniversary site through a small local web server so the YouTube music can play.
rem Keep the small "anniversary-site server" window open while you watch; close it to stop.
cd /d "%~dp0"
set PORT=5180
set PY=
where python >nul 2>nul && set PY=python
if not defined PY where py >nul 2>nul && set PY=py
if not defined PY goto nopy
start "anniversary-site server" /min %PY% -m http.server %PORT%
timeout /t 2 /nobreak >nul
start "" http://localhost:%PORT%/
exit /b

:nopy
echo Python was not found, so the local server can't start.
echo Install Python from https://www.python.org/downloads/ (tick "Add to PATH"), then run this again.
echo Or put your own song at music\song.mp3 - then index.html plays music even when double-clicked.
pause
