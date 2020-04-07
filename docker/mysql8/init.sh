#!/bin/bash

if [ "$1" = 'init' ]; 
then
docker run \
    --name mysql_3307 \
    -p 3307:3306 \
    --restart always \
    -v $PWD/root:/root \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -d mysql
echo 
elif [ "$1" = 'in' ]; 
then
docker exec -it mysql_3307 /bin/bash
elif [ "$1" = 'conn' ]; 
then
# get ip :docker inspect mysql_3307 | grep IPAddress
mycli -h 172.17.0.3 -p 3307 -u root  
else
echo "no match option!!!"
fi

# 备份数据库
#mysqldump -h 172.17.0.2 -P 3306 -u 'root' -p --databases server > /root/dump/server.sql
#mysqldump -h 172.17.0.2 -P 3306 -u 'root' -p --databases main > /root/dump/main.sql
#mysqldump -h 172.17.0.2 -P 3306 -u 'root' -p --databases statdb > /root/dump/statdb.sql

# 从备份还原数据库(一定要进入到容器里边操作)
# mysql>> create databases main;
# mysql>> use main;
# mysql>> source /root/dir/??.sql;

# 配置远程登录 
# 1:CREATE USER 'root'@'%' IDENTIFIED BY 'root';
# 2:GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; (所有权限)
# 3:flush privileges;

# 4:CREATE USER 'lzj'@'%' IDENTIFIED BY '123456';
# 5:GRANT SELECT ON *.* TO 'lzj'@'%' WITH GRANT OPTION; (只读权限)

