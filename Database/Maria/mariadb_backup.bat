::@echo off

set dumpPath=C:\Program Files\MariaDB 10.11\bin
set user=root
set passwort=
set dbName=
:: Backups Folder must be created
set outputFolder=backups\
set winrarPath=C:\Program Files\WinRAR\

:: Set Date
set hour=%time:~0,2%
if "%time:~0,1%"==" " set hour=0%time:~1,1%
set filename=%date:~6,4%-%date:~3,2%-%date:~0,2%_%hour%%time:~3,2%
:: End Date

"%dumpPath%\mysqldump.exe" -u%user% -p%passwort% --single-transaction --hex-blob %dbName% > %outputFolder%%filename%.sql

"%winrarPath%winrar" a  %outputFolder%%filename%.rar %outputFolder%%filename%.sql
del %outputFolder%%filename%.sql
echo Done
:: upload
curl -u username:passwort -T %outputFolder%%filename%.rar "http://ipaddress/nextcloud/remote.php/dav/files/username/foldername/%filename%.rar"

::pause
