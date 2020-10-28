# -*- coding: utf-8 -*-
#!/usr/bin/python

import sys 
# 根据你的目录去改动 可以使用 whereis pymysql 或者 locate pymysql 查找你的目录
sys.path.append("/usr/local/lib/python3.8/dist-packages/")
import tarfile
import pymysql.cursors
import datetime
import os
import ftplib
import pymysql


def get_dbname_list(host,user,passwd,dbname,sql):

    ignoreList=['mysql','information_schema','performance_schema','sys']

    conn = pymysql.connect(host=host,user=user, passwd=passwd,db=dbname, charset='utf8')
    cursor = conn.cursor(cursor=pymysql.cursors.DictCursor)
    cursor.execute(sql)
    result = cursor.fetchall()
    db_name_list = []
    for i in result:
        dbName=i['Database']
        if (dbName in ignoreList):
            continue
        db_name_list.append(dbName)
    conn.commit()
    cursor.close()
    conn.close()
    return db_name_list
    
if __name__ == "__main__":
    today = datetime.date.today()
    oneday = datetime.timedelta(days=1)
    deleteDay = today - 10 * oneday

    db_host = '192.168.1.180'
    db_user = 'root'
    db_pwd = '123456'
    information_schema = 'information_schema'
    today_backup_dir = './backupMysql/' + str(today)
    if not os.path.exists(today_backup_dir):
        os.system('mkdir -p %s' % today_backup_dir)

    get_dbname_sql = "show databases"
    db_name_list = get_dbname_list(db_host,db_user,db_pwd,information_schema,get_dbname_sql)
    for db_name in db_name_list:
        backup_file_name = db_name + '.sql'
        mysqlcmd = "mysqldump -h " + db_host + " -u" + db_user + " -p" + db_pwd + " --single-transaction " + db_name + " > " + today_backup_dir + "/" + backup_file_name
        os.system(mysqlcmd)