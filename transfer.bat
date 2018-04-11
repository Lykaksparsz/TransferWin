@ECHO OFF
@REM Getting files by using arguments,
@REM And setting up.
SET "MainFolder=%~dp0"
SET "Files=%cd%\%1"
SET /A TmpNumber=(%RANDOM%*100)/998+101
SET "CUrl=%MainFolder%\curl\bin\curl.exe"
SET "TempFiles=transfer%TmpNumber%"
@REM Creating temp file.
ECHO. >> "%MainFolder%\%TempFiles%"
@REM Basename-ing Files.
for /F "delims=" %%i in ("%Files%") do SET "basenamed=%%~ni"
@REM Upload into transfer.sh.
%CUrl% --progress-bar --upload-file "%Files%" https://transfer.sh/%basenamed% >> %TempFiles%
@REM Display URL Results
TYPE %TempFiles%
@REM Cleaning up (by removing temp files).
DEL /F /Q %TempFiles%
