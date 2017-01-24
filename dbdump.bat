@echo off
title Daily Oracle DB Backup

set d=%date:~0,4%%date:~5,2%%date:~8,2%
set t=%time:~0,2%%time:~3,2%%time:~6,2%

set "DATE=%d%_%t%"

rem Oracle SID
set "ORACLE_SID=%1"
rem User or scheme name
set "ORACLE_SCHEMA=%2"

set "ORACLE_ADMIN_USER="
set "ORACLE_ADMIN_PWD="

rem Change with the oracle dump folder or create a symbolic link somewhere else
set "EXPORT_FOLDER=D:\dbdump"

set "BACKUP_PREFIX=%ORACLE_SCHEMA%_export"

set "DUMPFILE=%DATE%-%BACKUP_PREFIX%.dmp"
set "LOGFILE=%DATE%-%BACKUP_PREFIX%.log"

set "ZIPCOMMAND=7z.exe"

echo ORACLE_SID = %ORACLE_SID%
echo ORACLE_SCHEMA = %ORACLE_SCHEMA%

echo Backup up database...
expdp %ORACLE_ADMIN_USER%/%ORACLE_ADMIN_PWD% directory=DATA_PUMP_DIR schemas=%ORACLE_SCHEMA% dumpfile=%DUMPFILE% logfile=%LOGFILE% rows=y consistent=y feedback=1000

echo Compressing backup files...
%ZIPCOMMAND% a "%EXPORT_FOLDER%\%DATE%-%ORACLE_SCHEMA%_export.7z" "%EXPORT_FOLDER%\%DATE%-%BACKUP_PREFIX%*"

echo Removing dump and log file...
del %EXPORT_FOLDER%\%DUMPFILE%
del %EXPORT_FOLDER%\%LOGFILE%

echo Removing backup older than 15 days...
forfiles /p "%EXPORT_FOLDER%" /s /m *-%BACKUP_PREFIX%.7z /c "cmd /c Del @path" /d -15

echo Script terminated


rem PAUSE