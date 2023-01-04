docker run -d -p 1521:1521 --name oracle12c -v /home/oracle/.oracle-data:/u01/app/oracle -e DBCA_TOTAL_MEMORY=16384 --network=epss_default  sangah/oracle12c
