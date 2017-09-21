ubuntu校园网登陆客户端 mentohust下载安装
 
1. 有两种安装方式
- 终端命令行下安装
```shell
# ctrl+alt+t打开终端
$ sudo dpkg -i mentohust_0.3.4-1_amd64.deb
```
- 直接双击安装包进行安装

2. mentohust登录

```shell
#输出帮助信息，接下来按照参数提示信息进行配置
$ sudo mentohust -h  
#输出

欢迎使用MentoHUST	版本: 0.3.4
Copyright (C) 2009-2010 HustMoon Studio
人到华中大，有甜亦有辣。明德厚学地，求是创新家。
Bug report to http://code.google.com/p/mentohust/issues/list

用法:	mentohust [-选项][参数]
选项:	-h 显示本帮助信息
	-k -k(退出程序) 其他(重启程序)
	-w 保存参数到配置文件
	-u 用户名
	-p 密码
	-n 网卡名
	-i IP[默认本机IP]
	-m 子网掩码[默认本机掩码]
	-g 网关[默认0.0.0.0]
	-s DNS[默认0.0.0.0]
	-o Ping主机[默认0.0.0.0，表示关闭该功能]
	-t 认证超时(秒)[默认8]
	-e 心跳间隔(秒)[默认30]
	-r 失败等待(秒)[默认15]
	-l 允许失败次数[0表示无限制，默认8]
	-a 组播地址: 0(标准) 1(锐捷) 2(赛尔) [默认0]
	-d DHCP方式: 0(不使用) 1(二次认证) 2(认证后) 3(认证前) [默认0](应该是动态IP的意思，可以选1)
	-b 是否后台运行: 0(否) 1(是，关闭输出) 2(是，保留输出) 3(是，输出到文件) [默认0]
	-y 是否显示通知: 0(否) 1~20(是) [默认5]
	-v 客户端版本号[默认0.00表示兼容xrgsu]
	-f 自定义数据文件[默认不使用]
	-c DHCP脚本[默认dhclient]
	-q 显示SuConfig.dat的内容(如-q/path/SuConfig.dat)
例如:	mentohust -uusername -ppassword -neth0 -i192.168.0.1 -m255.255.255.0 -g0.0.0.0 -s0.0.0.0 -o0.0.0.0 -t8 -e30 -r15 -a0 -d1 -b0 -v4.10 -fdefault.mpf -cdhclient
#我的命令韩
$ sudo mentohust -uU1234567 -p123456 -neth0 -a1 -d1 -b1 -y1
#其中网卡名参数可以先用命令查看
$ ifconfig
#可能会输出多个网卡名，包括有线网卡、无线网卡和本地虚拟的一个网卡，可以用命令查看无线网卡，然后no wireless extensions的是有限网卡
$ iwconfig

#退出mentohust
$ sudo mentohust -k
```
[64bit安装包下载链接](https://github.com/lxg2015/software)
其中.deb文件是ubuntu版本，另一个是windows版本

## ubuntu开机自启动mentohsut
选择菜单“系统->首选项->启动应用程序”，点击“添加”，输入名称MentoHUST，命令sudo mentohust，点击“添加”即可。
对于没有修改/etc/sudoers文件使得sudo无需密码的用户，此方法可能无效，这时可通过sudo chmod u+s /usr/bin/mentohust授予权限然后按此方法添加命令为mentohust的启动项。