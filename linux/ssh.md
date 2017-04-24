ssh是一个用于远程登录的连接工具。
ssh有公钥、秘钥之分，公钥放在远程端，相当于一把锁，秘钥就是钥匙，保持在本地电脑。可以将一对公钥、秘钥用在多个地方。
远程操作：
     ssh
          远程登录命令，ssh USER@IP_ADDRESS
     scp
          文件传输，scp SOURCE   USER@ADDRESS: DEST //必须要有DEST文件的权限，才能够传输，例如可以将文件传动到USER的家目录，必须要有冒号，否则不会传输到目的地址；
     sftp
          和scp一样。
秘钥管理：
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