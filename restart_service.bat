rem Just change the service name and should work.

SET SERVICE=tomcat7-64_PCITY

net stop %SERVICE%
timeout /t 60 /nobreak
net start %SERVICE%