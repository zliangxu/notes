## system
ubuntu14.04LTS用了蛮长时间，在系统设置上更改显卡驱动，开机只能进入登录桌面，无法进入菜单，认为是amd显卡问题，卸载后，直接不能进入系统，没能修复好，覆盖重装了一遍系统，摄像头wifi不能打开，只能完全格式化盘，安装ubuntu16.04LTS，  
ubuntu16.04LTS，系统相对更流畅，但是ibus框架下中文输入法一直不能找到，只能卸载，卸载时将unity也卸载掉了，现状是能登入系统，但是没有菜单，命令行模式下，安装了unity恢复了，同时ibus框架成功换成了fcixt，然后用上了强大的搜狗输入法。。。。，其中im-config(input method configure framework)是fcixt的安装第三方输入法的途径，而不是在系统设置-》输入法里。  

系统安装ssd + hhd, win10装在ssd上，在hhd上用easybcd装ubuntu14.04LTS时一直提示detect file system，不能再继续？？  

http://blog.csdn.net/liekkas_javey/article/details/52821913  
http://www.expreview.com/21367.html


安装ubuntu16.04英文版，用到的语言是英语，同样安装搜狗输入法，按照错误提示安装了fcixt后，重启出现了搜狗输入法。
## dell-inspiron-7559 装ubuntu win10双系统
- 使用UEFI模式安装win10
以直接将win10解压到u盘，然后开机时，进入uefi模式，这样可以识别出u盘内的win10,并可以安装。安装时，只能选择一个盘，esp分区(保存efi启动信息)，msr分区(微软保留分区)都可以自动生成，如果安装操作系统前提供了efi分区，windows的efi也会放在已有的分区上，只是efi分区必须是FAT或FAT32格式。
- 安装ubuntu
将ubuntu.isog直接放到u盘，或者解压缩到u盘，用UEFI模式启动，都卡在了安装界面。在win10下，控制面板内关掉快速启动后仍然卡住了。最后使用rufus工具制作启动盘成功了
- 使用[refind](http://www.rodsbooks.com/refind/)做引导程序，在sourceForge网站下载
## grub
```
linux grub配置文件在/boot目录下
grub的默认参数文件在/etc/default/grub，更改文件后需要sudo update-grub命令才会更改配置文件
```
## gpt
```
gpt即guid partition table 
```
## uefi+gpt
## bios+mbr 
## mbr
```
mbr即 main boot record(主引导记录)，是位于磁盘地址最开始一段引导的数据代码。通常，将包含mbr的扇区称为主引导扇区，这一扇区是管理整个磁盘空间的一个特殊空间，它不属于磁盘上的任何分区，也不属于任何操作系统，因而分区空间内的格式化命令不能清除主引导记录的任何信息。
主引导扇区共512个字节，包含三个部分：
  - 主引导程序即主引导记录(mbr，占446个字节)，用于硬盘启动时将系统控制转给用户指定的并在分区表中登记了的某个操作系统。
  启动PC机时，系统首先对硬件设备进行测试，测试成功后进入自举程序INT 19H,然后读系统磁盘0柱面、0磁头、1扇区的主引导记录（MBR）内容到内存指定单元0：7C00地址开始的区域，并执行MBR程序段。
硬盘的主引导记录（MBR）是不属于任何一个操作系统的，它先于所有的操作系统而被调入内存，并发挥作用，然后才将控制权交给主分区（活动分区）内的操作系统，并用主分区信息表来管理硬盘。
    MBR程序段的主要功能如下：
      1. 检查硬盘分区表是否完好。
      2. 在分区表中寻找可引导的“活动”分区。
      3. 将活动分区的第一逻辑扇区内容装入内存。在DOS分区中，此扇区内容称为DOS引导记录（DBR）。
  - 磁盘分区表(DPT,disk partition table)，由四个分区表项构成，每个分区表项占16个字节，负责说明磁盘上的分区情况，具体指明了本分区是否为活动分区，本分区的起始磁头号(包括磁头号、扇区号、柱面号)，分区类型(分为NTFS、扩展分区、FAT32……)，本分区的结束磁头号，本分区已用扇区数，本分区总扇区数。
  - 结束标志(2个字节，值为AA55)
```
### mbr转gpt方法
```
在windows下启用cmd命令行，输入以下命令
diskpart
list disk
select disk *
clean
convert gpt //需要先clean再convert，否则会转换失败。
```

## ubuntu设置命令行提示符颜色
[链接](http://www.cnblogs.com/Norlan/p/4944861.html)
## 翻墙
- google-chrome 插件 tunnello  
- hosts更新地址 [1](https://blog.my-eclipse.cn/host-google.html)，  
```
hosts更改方法，linux下的文件在/etc/hosts
```
## ubuntu[ubuntu更新内核，切换内核启动]( http://www.bkjia.com/xtzh/952429.html)
```shell
#搜索可更新内核
apt-cache search linux    
#安装内核，安装成功后重启时启动的就是新版本内核
sudo apt-get install linux-headers-版本号(可tab键自动补全) linux-images-版本号  

#如果要切换回原来的版本，先使用以下命令，显示出已安装内核的版本号的序列
grep menuentry /grub/boot/grub.cfg
#然后在/etc/default/grub中，更改
GRUB_DEFAULT=[要切换内核在上面输出的序号,从0开始数]
#更新grub，开始还有用，后来再更改不起作用了，不知道为什么？？？
sudo update-grub  

#重启后，以下命令可以查看所安装内核的版本号
uname -a

安装完后可以正常关机但是没有网卡，为什么？？？
```
## ubuntu wifi
```
两台主机通过一根网线构成局域网方法
分别为两台主机设置IP和netmask(子网掩码)，将两者中的一台主机IP设置为网关，即可通信
ifconfig eth0 192.168.0.1 netmask 255.255.255.0
route add default gw 192.168.0.1
即可，只设置IP会ping不通。

一直提示
essid:host name lookup failure//不设置ip地址

wlan :wireless local areas network
iwconfig: configure a wireless network interface
ifconfig: configure a network interface
netstat: print network connections,routine table;
iwlist: get more detailed wireless information from a wireless interface.
lsusb：输出usb设备

整整弄了一个晚上加上午，笔记本重新建立wifi后，树莓派奇怪的可以连接上了
过了大概两周了，终于再次链接上了wifi，看了下鸟叔的书，才了解点知识，知道原理是什么，才不至于写命令那么无脑，动态ip应该不需要设置子网掩码，并且自己设置的一直是错的，配置过程如下：
iwconfig wlan0 essid "wifi-ssid"//原来一直输入ifocnfig，导致一直找不到主机名，不清楚原理，此处一定要用iwconfig
ifconfig wlan0 10.42.0.4//成功连接上，子网掩码自动设置为255.0.0.0，不知道为什么是这样，笔记本上是255.255.255.0，在这里浪费了很长时间
子网掩码设置命令：ifconfig wlan0 netmask 255.255.255.0//需要有wlan0，否则提示无法找到设备

(1)首先关闭开发板的有线网卡
[root@FriendlyARM /]# ifconfig eth0 down
(2)加载USB WiFi无线网卡
[root@FriendlyARM /]# ifconfig wlan0 up
(3)扫描可用的无线网络
[root@FriendlyARM /]# iwlist scanning | grep ESSID
lo        Interface doesn't support scanning.
eth0      Interface doesn't support scanning.
wmaster0  Interface doesn't support scanning.
                    ESSID:"FRIENDLY-ARM"
                    ESSID:"NETGEAR"
                    ESSID:"TP-LINK"
(4)选择要连接的无线网络
[root@FriendlyARM /]# iwconfig wlan0 essid "FRIENDLY-ARM"
(5)输入该网络的安全密码//用户名怎么发送？没有解决
[root@FriendlyARM /]# iwconfig wlan0 key s:12345
(6)连接到指定的AP(无线路由)
[root@FriendlyARM /]# iwconfig wlan0 ap auto
(7)设置无线网卡的IP地址
[root@FriendlyARM /]# ifconfig wlan0 192.168.1.120
(8)使用 ping 命令检测无线网连通状况
[root@FriendlyARM /]# ping 192.168.1.1
PING 192.168.1.1 (192.168.1.1): 56 data bytes
64 bytes from 192.168.1.1: seq=0 ttl=64 time=42.804 ms
64 bytes from 192.168.1.1: seq=1 ttl=64 time=5.020 ms
```
## app
- foxit-reader linux 64bit [download](https://www.foxitsoftware.com/products/pdf-reader/)
- chrome : 可以直接sudo apt-get install, 也可以直接从 chrome 网站[下载](https://www.chrome64bit.com/)