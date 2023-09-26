#!/bin/bash

# apt install open-jdk-17-jdk
# /sbin/adduser minecraft 
# /sbin/usermod -aG sudo minecraft
# mkdir $HOME/minecraft

if [ -z "$1" ] 
    then
    echo "No version specified"
    exit 2
fi


wget https://launchermeta.mojang.com/mc/game/version_manifest.json

if [ -z $(grep -o '"url": "[^"]*' version_manifest.json | grep -o '[^"]*$' | grep -o ".*${1}.json") ]
    then
    echo "Version not found"
    exit 2
fi

wget -O ver.json $(grep -o '"url": "[^"]*' version_manifest.json | grep -o '[^"]*$' | grep -o ".*${1}.json")

wget $(grep -o '[^"]*server.jar' ver.json)
echo "Download done"


rm -f ver.json version_manifest.json
mkdir server
mv server.jar server/server.jar
echo "eula=true" > server/eula.txt   
#grep -o '"url": "[^"]*' version_manifest.json | grep -o '[^"]*$' | grep -o '.*1.19.2.json'
#grep -o '[^"]*server.jar' 1.19.2.json

