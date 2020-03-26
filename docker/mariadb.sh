#!/bin/bash

docker run \
        --name s1_mariadb \
        -p 3308:3306 \
        --restart always \
        -v $PWD/root:/root \
        -e MYSQL_ROOT_PASSWORD=123456 \
        -d mariadb:latest \

