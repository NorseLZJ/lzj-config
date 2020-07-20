#!/bin/bash

if [ "$1" = 'init' ]; 
then
docker run \
    --name nsq2 \
    -p 4150:4150 \
    -p 4151:4151 \
    -p 4160:4160 \
    -p 4161:4161 \
    --restart always \
    -d s_nsqd1  

echo 
elif [ "$1" = 'in' ]; 
then
docker exec -it nsq2 /bin/sh
elif [ "$1" = 'conn' ]; 
then
echo "conn"
# get ip :docker inspect mysql1 | grep IPAddress
else
echo "no match option!!!"
fi
