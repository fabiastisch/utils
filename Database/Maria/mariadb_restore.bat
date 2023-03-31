
set filename=2023-03-31_0808.sql

::set dumpPath=C:\Program Files\MariaDB 10.11\bin
set dumpPath=C:\Tools\mysql-8.0.32-winx64\bin\
set user=root
set passwort=password
set dbName=

"%dumpPath%mysql.exe" -u%user% -p%passwort% -e "CREATE DATABASE IF NOT EXISTS %dbName%;"


"%dumpPath%mysql.exe" -u%user% -p%passwort% %dbName% < %filename%

pause
