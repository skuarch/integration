#!/bin/bash

echo "---------------------------------------------------------"
echo "[COMMAND] mvn install"
echo

mvn clean

if [ "$?" -ne 0 ]; then
    echo "[RESULT] Maven clean Unsuccessful!"
    exit 1
fi

while true; do
    read -p "[INPUT] Do you want to add all the files to the repository (git add *)? " yn
        case $yn in
            [Yy]* ) git add *; break;;
            [Nn]* ) echo "[RESULT] do the git add command manually"; exit 1;;
            * ) echo "[INPUT] Please answer yes or no.";;
        esac
done

echo "---------------------------------------------------------"
echo "[COMMAND] git commit"
echo "[INPUT] please enter the commit message"
read commitMessage
git commit -m"$commitMessage"

if [ "$?" -ne 0 ]; then
    echo "[RESULT] Maven install Unsuccessful"
    exit 1
fi

git push -u origin master

exit 0