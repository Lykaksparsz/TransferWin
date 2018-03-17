@ECHO OFF
ECHO Downloading curl binary zip ... (This may take a while.)
bitsadmin /transfer "TransferWin" https://dl.uxnr.de/build/curl/curl_winssl_msys2_mingw32_stc/curl-7.59.0/curl-7.59.0.zip %cd%\curl.zip
ECHO Unzipping ...
"%cd%\7zip\7za.exe" e -y -o"%cd%\curl" "%cd%\curl.zip"
ECHO Clearing up ...
DEL /F /Q curl.zip
RD /S /Q "%cd%\7zip"
ECHO TransferWin successfully installed!
ECHO Press any key to Finish installation.
PAUSE>NUL
DEL /F /Q install.bat