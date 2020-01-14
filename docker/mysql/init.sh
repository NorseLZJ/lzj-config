#!/bin/bash

docker run \
        --name mysql-3307 \
        -p 3307:3306 \
        -v $PWD/mysql/conf.d:/etc/mysql/conf.d \
        -v $PWD/mysql/logs:/logs \
        -v $PWD/mysql/data:/var/lib/mysql \
        -e MYSQL_ROOT_PASSWORD=123456 \
        -d \
        mysql/mysql-server:latest
