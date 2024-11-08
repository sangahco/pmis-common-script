@echo off
title Daily Oracle DB Backup

CD /d %~dp0

set d=%date:~0,4%%date:~5,2%%date:~8,2%
set t=%time:~0,2%%time:~3,2%%time:~6,2%

set BACKUP_DATE=%d%_%t%
set BACKUP_DATE=%BACKUP_DATE: =0%

rem Oracle SID
set "ORACLE_SID=%1"
rem User or scheme name
set "ORACLE_SCHEMA=%2"

rem Change with the oracle dump folder or create a symbolic link somewhere else
set "EXPORT_FOLDER=D:\dbdump"

set "BACKUP_PREFIX=%ORACLE_SCHEMA%_export"

set "DUMPFILE=%BACKUP_DATE%-%BACKUP_PREFIX%.dmp"
set "LOGFILE=%BACKUP_DATE%-%BACKUP_PREFIX%.log"

set "ZIPCOMMAND=7z.exe"

echo ORACLE_SID = %ORACLE_SID%
echo ORACLE_SCHEMA = %ORACLE_SCHEMA%

echo Backup up database...
expdp \"/ as sysdba\" directory=DATA_PUMP_DIR dumpfile=%DUMPFILE% logfile=%LOGFILE% content=ALL status=30 version=12 full=yes
rem consistent=y this option can cause error ORA-00922

echo Compressing backup files...
%ZIPCOMMAND% a "%EXPORT_FOLDER%\%BACKUP_DATE%-%ORACLE_SCHEMA%_export.7z" "%EXPORT_FOLDER%\%BACKUP_DATE%-%BACKUP_PREFIX%*"

echo Removing dump and log file...
del %EXPORT_FOLDER%\%DUMPFILE%
del %EXPORT_FOLDER%\%LOGFILE%

echo Removing backup older than 15 days...
forfiles /p "%EXPORT_FOLDER%" /s /m *-%BACKUP_PREFIX%.7z /c "cmd /c Del @path" /d -60

echo Script terminated


rem PAUSE