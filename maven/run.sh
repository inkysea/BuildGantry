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

if $SETTINGS_XML_REPO != null; then
    curl $SETTINGS_XML_REPO
fi

if $SETTINGS_XML_FILE != null; then
    cp $SETTINGS_XML_FILE ~.m2/settings.xml
fi

cd $PROJECT_DIR
mvn $MVN_OPTS