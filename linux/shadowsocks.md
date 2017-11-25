## 浏览器代理
就是把浏览器对一个网页的访问打包成对一个代理的访问
[switchyOmega](gihup已关注)

## shadowsocks
shadowsocks本地就是对一个地址的访问映射到服务器ip上的访问
```shell
# 1080指本地端口号，即浏览器代理要设置的端口号，而sslocl将vpn映射到127.0.0.1
# 启动 -p 25942 -k hust2012
sslocal -s 服务器IP -p 服务器端口号 -k Shadowsocks密码 -l 1080 -t 600 -m aes-256-cfb
sslocal -s 45.76.152.139 -p 25942 -k hust2012 -l 1080 -t 600 -m aes-256-cfb
```
## install
```shell
sudo apt-get update
sudo apt-get install python-pip
sudo apt-get install python-setuptools m2crypto
sudo pip install shadowsocks
```

## depinfo
```
国家/地区	IP地址	域名	说明	支持协议
美国	45.32.166.13	us4.heon.win	美国服务器	L2TP, PPTP, AnyConnect
美国	45.77.159.164	us3.heon.win	美国服务器	L2TP, PPTP, AnyConnect
美国	45.76.239.50	us2.heon.win	美国服务器	L2TP, PPTP, AnyConnect
美国	45.77.157.109	us1.heon.win	美国服务器	L2TP, PPTP, AnyConnect
新加坡	45.76.152.139	sg1.heon.win	新加坡服务器	L2TP, PPTP, AnyConnect
日本	45.77.178.214	jp2.heon.win	日本服务器	L2TP, PPTP, AnyConnect
英国	45.76.133.30	gb1.heon.win	英国服务器	L2TP, PPTP, AnyConnect  //较快
```
