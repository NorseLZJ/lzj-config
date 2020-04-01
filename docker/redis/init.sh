#!/bin/bash

docker run \
        --name redis1 \
        -p 6380:6379\
        --restart always \
        -v $PWD/root:/root \
        -v $PWD/data:/data \
        -d redis


