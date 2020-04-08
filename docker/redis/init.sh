#!/bin/bash


if [ "$1" = 'init' ]; 
then
docker run \
    --name redis1 \
    -p 6381:6379\
    --restart always \
    -v $PWD/root:/root \
    -v $PWD/data:/data \
    -d redis
echo 
elif [ "$1" = 'in' ]; 
then
docker exec -it redis1 /bin/bash
elif [ "$1" = 'conn' ]; 
then
docker exec -it redis1 redis-cli 
else
echo "no match option!!!"
fi


