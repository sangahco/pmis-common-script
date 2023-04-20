rem Just change the service name and should work.
rem for net drive edms
rem edms.PathRoot=\\\\<IP>\\<FOLDER>\\edms

SET SERVICE=tomcat7

net use z: /USER:<USER> \\<IP>\<FOLDER> /persistent:yes <PWD>
net stop %SERVICE%
timeout /t 60 /nobreak
net start %SERVICE%