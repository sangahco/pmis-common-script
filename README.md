# PMIS Common Script

Some of this script can be added to crontab for scheduling the execution of those script, 
daily or weekly.

Every user in the system has its own crontab scheduler, 
so before continuing always check the current user,
and think if this user should run the script or maybe someone else, 
than just type in console the following command:

    $ crontab -e
    
    
At the top of the crontab file always put the following lines:

    SHELL=/bin/bash
    BASH_ENV=/home/<USERHERE>/.bashrc
    
Doing this we tell to crontab that the following scripts have to be run using the bash shell
and it should use the environment of that user.

Than just add the script you want to schedule the run with:

    # daily schedule
    00 02 * * * /home/oracle/script/dbbackup.sh
    
    # weekly schedule (on sunday)
    10 02 * * 0 /home/sangah/script/hub/docker-auto.sh restart