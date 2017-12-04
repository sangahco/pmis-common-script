#!/usr/bin/env sh

set -e

TOMCAT_INSTANCE_HOME="$1"

if [ ! -d $TOMCAT_INSTANCE_HOME ]; then
    echo "$TOMCAT_INSTANCE_HOME not found"
    exit 1
fi

if [ -f $TOMCAT_INSTANCE_HOME/bin/setenv.sh ]; then
    . $TOMCAT_INSTANCE_HOME/bin/setenv.sh
fi

if [ -z $CATALINA_PID ]; then
    export CATALINA_PID=/var/run/tomcat_catalina.pid
fi

startScript=$TOMCAT_INSTANCE_HOME/bin/startup.sh
shutdownScript=$TOMCAT_INSTANCE_HOME/bin/shutdown.sh

if [ -f "$CATALINA_PID" ]; then
    tomcatPID=`cat "$CATALINA_PID"`
    if [ $(ps -p $tomcatPID | wc -l) -gt 1 ]; then
        echo "Attempting to shutdown Tomcat . . ."
        $shutdownScript || true
        sleep 10

        echo "Killing Tomcat using process id of $tomcatPID . . ."
        kill -9 $tomcatPID || true

        echo "Waiting for process $tomcatPID to end . . ."
        while [ $(ps -p $tomcatPID | wc -l) -gt 1 ]; do sleep 1; done
        echo "Process $tomcatPID has ended . . ." 
    fi
	
	# remove pid file or tomcat will not start
	rm $CATALINA_PID || true
fi

echo "Attempting to start Tomcat via $startScript . . ."
$startScript

echo "Process complete . . ."

exit $?
