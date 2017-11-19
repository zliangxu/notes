## ip:115.156.233.38 key:123456
<!-- MAC Address: 4C:CC:6A:23:AA:6B (Unknown) Nmap scan report for 115.156.233.38 -->
<!-- dell ip 115.156.232.165 -->
[ssh无密码登录](http://www.ruanyifeng.com/blog/2011/12/ssh_remote_login.html)

# telnet

# ssh
ssh是一个用于远程登录的连接工具。  
ssh有公钥、秘钥之分，公钥放在远程端，相当于一把锁，秘钥就是钥匙，保持在本地电脑。可以将一对公钥、秘钥用在多个地方。    
使用ssh的登录过程就是本地访问远程端，然后远程端返回一个公钥，并要求输入登录密码，在本地电脑上输入密码后，经过公钥加密发送回远程端，远程端解密后，如果密码正确则正确登录。
```shell
# 远程登录命令
ssh USER@IP_ADDRESS  
```

## scp  
```shell
# 把本地文件送到远程， 必须要有DEST文件的权限，才能够输，例如可以将文件传动到USER的家目录。注意必须要有冒号，否则不会传输到的地址；  
scp SOURCE   USER@ADDRESS: DEST 
# 把本地文件夹送到远程，其中后面的'/'可有可无
scp -r SOURCE/   USER@ADDRESS: DEST/

# 把远程文件复制到本地
scp USER@ADDRESS:/home/FILE SOURCE
# 把远程文件夹复制到本地
scp -r USER@ADDRESS:/home/PATH SOURCE
```
- sftp  
    和scp一样。  
- 秘钥管理：  
    key-add  
    ssh-keygen     -t 生成秘钥类型rsa……  
                   -C comment?  
    ssh-keyscan  
    ssh-keysign  
服务器  

## 树莓派的ssh远程登陆
```shell
#使能树莓派的ssh登陆
sudo raspi-config #在打开的界面内选择interface的选项，enter后又打开带有ssh项的窗口
#可以直接登陆
ssh UserName@Ip_Address
```
## ssh服务管理
ubuntu 自带openssh-client软件，但不自带openssh-server，也就是只有客户端，服务端的开启是需要安装openssh-server的。
```shell
service ssh start  # 开启服务
service ssh stop  # 关闭服务
service ssh restart # 重启服务
```

## 用户管理
使用adduser，useradd比较弱


## 权限管理
1. 命令行修改
```shell
# -a表示追加
sudo usermod -aG sudo username
```
2. 直接修改'/etc/sudoers'




## tips
- 问题
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ECDSA key sent by the remote host is
SHA256:qatPoESesLCM03UW/W389N9WmaII8NJHFinA5J3rMg8.
Please contact your system administrator.
Add correct host key in /home/lxg/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /home/lxg/.ssh/known_hosts:22
  remove with:
  ssh-keygen -f "/home/lxg/.ssh/known_hosts" -R 115.156.213.248
ECDSA host key for 115.156.213.248 has changed and you have requested strict checking.
Host key verification failed.
解决方法
可能是内网主机不能通过外网ip访问内网服务器，而只能使用内网ip访问内网主机，外网主机使用外网ip访问内网主机
https://stackoverflow.com/questions/20840012/ssh-remote-host-identification-has-changed