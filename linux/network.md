1. 进行ping扫描，打印出对扫描做出响应的主机　
```sh
nmap nmap -sP 192.168.1.0/24　
```

2. 扫描之后查看arp缓存表获取局域网主机IP地址(可以获取到mac地址)
```sh
cat /proc/net/arp
```
dell服务器的mac地址是  1c:1b:0d:9e:dd:64