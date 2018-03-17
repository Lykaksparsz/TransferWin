@ECHO OFF
SET "Files=%cd%\%1"
SET /A TmpNumber=(%RANDOM%*100)/998+101
SET "CUrl=C:\transferwin\curl\bin\curl.exe"
SET "TempFiles=transfer%TmpNumber%"
ECHO. >> "%cd%\%TempFiles%"
for /F "delims=" %%i in (%FILE_path%) do SET "basenamed=%%~ni"
%CUrl% --progress-bar --upload-file %Files% https://transfer.sh/%basenamed% >> %TempFiles%
TYPE %TempFiles%
DEL /F /Q %TempFiles%