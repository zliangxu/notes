## 无法登陆树莓派pi账户
树莓派的pi账户突然无法正常登陆了，具体表现为输入pi用户名，及默认密码raspberry按enter键后，又回到了登陆界面，而没有进入系统桌面。
解决方法可以参考“~/.xseesion-error”的内容，
比如我遇到的就是 ”can not find xfce4-session“之类的
所以直接“sudo apt-get install xfce4-session”就解决问题了

参考：http://www.cnblogs.com/kaituorensheng/p/3376094.html

树莓派的登陆方式分为四种
1. text console 需要密码
2. text console 不需要密码
3. desktop gui 需要密码
4. desktop gui 不需要密码

具体可以以下输入命令，在boot options条目下进行选择
```shell
sudo raspi-config
```