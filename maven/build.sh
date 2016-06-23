#!/bin/sh

PATH=$PATH:/var/opt/apache-maven-3.3.9/bin/:/var/opt/OpenJDK-1.8.0.92-bin/bin/
JAVA_HOME=/var/opt/OpenJDK-1.8.0.92-bin/

cd $BUILD_DIR
git clone $GIT_REPO
cd $PROJECT_DIR
mvn $MVN_OPTS