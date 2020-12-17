####  windows把exe变成服务

- 原文链接   
https://www.cnblogs.com/guohu/p/11105445.html

- 相关命令，以及需要添加的字段   
先打开cmd，cd到srvany的目录   
创建服务命令 : instsrv.exe FSV C:\srvany\srvany.exe   
FSV 是服务名称

- 编辑注册编表需要新建的字段名   
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ 找到你刚才输入的服务名   
Parameters  (新建项)    
Application(新建字符串值)    
AppDirectory(新建字符串值)    

- 服务相关命令   
sc stop FSV    
net start FSV   
sc delete FSV   

- 创建服务用到的文件,如果原文的下载不了就从这里下载
链接：https://pan.baidu.com/s/185ANqGU5RmPek5jC3RtA-Q 
提取码：y0o0 