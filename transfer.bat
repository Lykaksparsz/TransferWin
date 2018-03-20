@ECHO OFF
@REM Getting files by using arguments,
@REM And setting up.
SET "Files=%1"
SET /A TmpNumber=(%RANDOM%*100)/998+101
SET "CUrl=C:\transferwin\curl\bin\curl.exe"
SET "TempFiles=transfer%TmpNumber%"
@REM Creating temp file.
ECHO. >> "%cd%\%TempFiles%"
@REM Basename-ing Files.
for /F "delims=" %%i in (%FILE_path%) do SET "basenamed=%%~ni"
@REM Upload into transfer.sh.
%CUrl% --progress-bar --upload-file %Files% https://transfer.sh/%basenamed% >> %TempFiles%
@REM Display URL Results
TYPE %TempFiles%
@REM Cleaning up (by removing temp files).
DEL /F /Q %TempFiles%
