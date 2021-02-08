# shell exec conn
#!/bin/bash

HOST="127.0.0.1"
PORT="3307"
USER="root"
PASS="123456"

DBNAME="test_db_test"       #数据库名称
TABLENAME="test_table_test" #数据库中表的名称

#创建数据库
create_db_sql="create database IF NOT EXISTS ${DBNAME}"
mysql -h${HOST} -P${PORT} -u${USER} -p${PASS} -e "${create_db_sql}"