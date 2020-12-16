
#### Nmap
- 检查内网所有活动ip，输入到文件
nmap -sP 192.168.1.1/24 | grep 'Nmap scan report for' | awk '{print $5}' | cat > ip.txt
nmap -sP 180.169.179.89/24 | grep 'Nmap scan report for' | awk '{print $5}' | cat > ip.txt

- 检查目标机器所开服务，端口，信息等,可跟ip或者网址
nmap -A -T4 192.168.1.116 
nmap -A -T4 taobao.com 