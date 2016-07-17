#!/bin/sh

PATH=$PATH:/var/opt/apache-maven-3.3.9/bin/:/var/opt/OpenJDK-1.8.0.92-bin/bin/
JAVA_HOME=/var/opt/OpenJDK-1.8.0.92-bin/


cd $BUILD_DIR

if [ -e $GIT_REPO ]
then
    git clone $GIT_REPO
else
	echo "INFO: Git repo no defined."
fi


mkdir ~/.m2

if [ ! -z $SETTINGS_XML_REPO ]
 then
    echo "INFO: Applying settings.xml"
    curl $SETTINGS_XML_REPO
fi

if [ ! -z $SETTINGS_XML_FILE ]
 then
    echo "INFO: Applying settings.xml"
    cp $SETTINGS_XML_FILE ~.m2/settings.xml
fi

cd $PROJECT_DIR
mvn $MVN_OPTS