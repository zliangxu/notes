ngrok 相当于一个映射，把本地的localhost:port映射到远程ngrok服务器的一个端口上，然后，就可以使用ssh登录

## usage
1. 在远程服务器安装ngrok客户端，实际上没有安装，解压后就得到一个可执行程序，运行命令
```shell
./ngrok authtoken [TOKEN登录网站上有]
```
2. 开启端口映射
```shell
# tcp 应该是ssh使用的协议 22是端口
./ngrok tcp 22 
```
例如，得到的显示参数如下
```
ngrok by @inconshreveable                                                                                                        (Ctrl+C to quit)
                                                                                                                                                 
Session Status                online                                                                                                             
Account                       lxg2015 (Plan: Free)                                                                                               
Version                       2.2.8                                                                                                              
Region                        United States (us)                                                                                                 
Web Interface                 http://127.0.0.1:4040                                                                                              
Forwarding                    tcp://0.tcp.ngrok.io:13230 -> localhost:22                                                                         
                                                                                                                                                 
Connections                   ttl     opn     rt1     rt5     p50     p90                                                                        
                              0       0       0.00    0.00    0.00    0.00                
```
远程服务器配置结束

3. 观察2步骤得到的端口映射，本地运行ssh命令
```shell
ssh lxg@0.tcp.ngrok.io -p13230
```
