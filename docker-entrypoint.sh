#!/bin/sh

if [ ! -e "/data/.first_start" ]
then 
    echo "first run, copying files and generating RCON password"
    touch /data/.first_start
    cp /opt/minecraft/paper.jar /data/paper.jar
    cp /opt/minecraft/start-server.sh /data/start-server.sh

    echo "eula=true" > /data/eula.txt
    RCON_PASSWORD=$(openssl rand -base64 14)
    echo "RCON password is $RCON_PASSWORD"
    printf "rcon.password=$RCON_PASSWORD\nenable-rcon=true" > /data/server.properties

fi

cd /data

(exec "./start-server.sh")

