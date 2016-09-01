#!/bin/bash

FILE="./target/integration.war"
USER="admin"
PASSWORD="admin"
HOST="localhost"
PORT=3030
UPDATED=false

while true; do
    
  #[ $(git rev-parse HEAD) = $(git ls-remote $(git rev-parse --abbrev-ref @{u} | sed 's/\// /g') | cut -f1) ] && UPDATED=true || UPDATED=false;
  echo "repository is updated: "$UPDATED;
  if [ $UPDATED = false ]; then
	echo "git pull";
	git pull;

    mvn clean

    mvn install

    if [ "$?" -ne 0 ]; then
        echo "mvn install unsuccessfully";
        exit 1;
    fi

    mvn package
    
    if [ "$?" -ne 0 ]; then
        echo "mvn package unsuccessfully";
        exit 1;
    fi

    echo "**deploying";
    curl --upload-file $FILE "http://$USER:$PASSWORD@$HOST:$PORT/manager/deploy?path=/debug&update=true"   

  fi
  sleep 1;
   
done

## deploy to tomcat
#curl --upload-file $FILE "http://$USER:$PASSWORD@$HOST:$PORT/manager/deploy?path=/debug&update=true"
