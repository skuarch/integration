#!/bin/bash

FILE="./target/integration.war"
USER="admin"
PASSWORD="admin"
HOST="localhost"
PORT=8080
UPDATED=false

while true; do
    
  [ $(git rev-parse HEAD) = $(git ls-remote $(git rev-parse --abbrev-ref @{u} | sed 's/\// /g') | cut -f1) ] && UPDATED=true || UPDATED=false    
  echo $UPDATED
  sleep 1;
   
done

## deploy to tomcat
#curl --upload-file $FILE "http://$USER:$PASSWORD@$HOST:$PORT/manager/deploy?path=/debug&update=true"
