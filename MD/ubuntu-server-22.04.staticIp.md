# ubuntu 22.04 设置静态 ip

- 可以使用文件

```
# This is the network config written by 'subiquity'
network:
  ethernets:
    enp0s3:
      addresses: [172.16.1.43/16]
      routes:
        - to: default
          via: 172.16.0.1
      dhcp4: no
      nameservers:
        addresses: [114.114.114.114, 8.8.8.8]
  version: 2
```

- 注意,使用以下命令

```
ip addr | egrep -v 'inet6|127' | grep inet

类似的结果
    inet 172.16.1.43/16 brd 172.16.255.255 scope global enp0s3
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0

    /16  /24 很重要，如果填错了会网络不通
```

- 注意,使用以下命令 2

```

route -n

类似的结果
    0.0.0.0         172.16.0.1      0.0.0.0         UG    0      0        0 enp0s3
    172.16.0.0      0.0.0.0         255.255.0.0     U     0      0        0 enp0s3
    172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0

    注意 enp0s3 的网卡，非0.0.0.0 的，getway 要填到 route->via :  下面去
```
