#!/bin/bash
echo "undeploying"
rm -rf /opt/apache-tomcat-8.0.36/webapps/integration*
echo "start mvn clean"
mvn clean test
echo "finish mvn clean"
sleep 1;
echo "deploying war to tomcat"
echo "running mvn install"
mvn install

if [ "$?" -ne 0 ]; then
	echo "mvn install unsuccessfully";
fi

cp target/integration.war /opt/apache-tomcat-8.0.36/webapps/

echo "running phantom"
rm -rf phantomjs/screenshots/*
./phantomjs.sh