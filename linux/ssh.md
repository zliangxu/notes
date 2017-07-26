# telnet

# ssh
ssh是一个用于远程登录的连接工具。  
ssh有公钥、秘钥之分，公钥放在远程端，相当于一把锁，秘钥就是钥匙，保持在本地电脑。可以将一对公钥、秘钥用在多个地方。  
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

# 用户管理
使用adduser，useradd比较弱