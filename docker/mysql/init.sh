#!/bin/bash

docker run \
        --name mysql \
        -p 3307:3306 \
        --restart always \
        -v $PWD/root:/root \
        -e MYSQL_ROOT_PASSWORD=123456 \
        -d mysql/mysql-server:5.7 \

#--character-set-server=utf8mb4 \
#--collation-server=utf8mb4_unicode_ci \
#--bind-address=0.0.0.0 \
#--init-file=$PWD/my.cnf 


#docker run \
#        --name mysql1 \
#        -v $PWD/mysql/conf:/etc/mysql \
#        -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7

#docker run \
#        --name mysql-3307 \
#        -p 3307:3306 \
#        --restart always \
#        -v $PWD/mysql:/etc/mysql \
#        -e MYSQL_ROOT_PASSWORD=123456 \
#        -d \
#        mysql:5.7

# -v $PWD/my.cnf:/etc/my.cnf \
# -v $PWD/mysql/logs:/logs \
# -v $PWD/mysql/data:/var/lib/mysql \
