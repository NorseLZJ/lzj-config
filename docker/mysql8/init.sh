#!/bin/bash

docker run \
        --name mysql_3307 \
        -p 3307:3306 \
        --restart always \
        -v $PWD/root:/root \
        -e MYSQL_ROOT_PASSWORD=123456 \
        -d mysql \
