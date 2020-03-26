#!/bin/bash

mysqldump -h 172.17.0.2 -P 3306 -u 'root' -p --databases server > /root/dump/server.sql
mysqldump -h 172.17.0.2 -P 3306 -u 'root' -p --databases main > /root/dump/main.sql
mysqldump -h 172.17.0.2 -P 3306 -u 'root' -p --databases statdb > /root/dump/statdb.sql

