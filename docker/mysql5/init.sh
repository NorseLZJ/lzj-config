#!/bin/env bash

docker run --name mysql02  \
	-p 3308:3306 \
	-v $PWD/data:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD=123456 -d mysql:5
	#--restart always \
	#-v $PWD/conf:/etc/mysql/mysql.conf.d \

