#!/bin/bash

if [ "$1" = 'init' ]; 
then
docker run \
    --name centos1 \
    --restart always \
    -v $PWD/root:/root \
    -it \
    centos 
echo 
elif [ "$1" = 'in' ]; 
then
echo "in"
docker exec -it centos1 /bin/sh
elif [ "$1" = 'conn' ]; 
then
echo "conn"
# get ip :docker inspect mysql_3307 | grep IPAddress
#mycli -h 172.17.0.3 -p 3307 -u root  
else
echo "no match option!!!"
fi

