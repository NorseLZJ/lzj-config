# shell exec conn
host='192.168.1.85'
port='3306'
user='root'
pass='123456'

c_test_db='CREATE DATABASE test IF NOT EXISTS;'

mysql -h${host} -P$port-u$user -p$pass -e ${c_test_db}
