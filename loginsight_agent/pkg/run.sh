#!/bin/bash

# Configures and runs LogInsight agent
# Note that you must at minimum supply the LI_HOST
# The LI_INI_FILE is the path to a .ini file that will be
#  added to the existing ini file.  The LI_INI_FILE can be added
#  using a volume.


if [ -e $LI_INI_FILE ]
then
	echo "Adding to liagent.ini"
	cat $LI_INI_FILE >> /var/lib/loginsight-agent/liagent.ini
else
	echo "Error: File not found: $LI_INI_FILE"
	exit 1
fi

if [[ ! -z $TAG_REPLACE ]]
then
    sed -i "s/tags=.*/tags=$TAG_REPLACE/" /var/lib/loginsight-agent/liagent.ini
fi

if [ ! -z $LI_HOST ]
then
    echo "INFO: Setting Log Insight host: $LI_HOST"
    sed -i "/;hostname=LOGINSIGHT/c\hostname=$LI_HOST" /var/lib/loginsight-agent/liagent.ini
fi


/etc/rc.d/init.d/liagentd restart

sleep 5

/etc/rc.d/init.d/liagentd restart

tail -f /dev/null


