rem Just change the service name and should work.

SET SERVICE=tomcat7

net use z: /USER:<USER> \\<IP>\pidownload /persistent:yes <PWD>
net stop %SERVICE%
timeout /t 60 /nobreak
net start %SERVICE%