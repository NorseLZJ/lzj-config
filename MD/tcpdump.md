tcpdump -i enp0s3  tcp port 22 and src host 192.168.20.151 -w /root/tcpdump/sshd.cap
tcpdump -i enp0s3  tcp port 3307 and src host 192.168.20.151 -w /root/tcpdump/mysql.cap
tcpdump -i enp0s3  tcp port 6380 and src host 192.168.20.151 -w /root/tcpdump/redis.cap

