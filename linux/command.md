## 终端多条指令执行
- 使用分号(;)隔开，指令顺序执行，执行结果互不影响
- 使用与 (&&)，前一条命令执行成功，才会进行下一条指令
- 使用或 (||)，从前往后执行命令，如果命令遇到成功执行的指令，则停止执行命令

## 常用命令
- find
**$ find <指定目录> <指定条件> <指定动作>**  
[doc](http://www.ruanyifeng.com/blog/2009/10/5_ways_to_search_for_files_using_the_terminal.html)
find 默认搜索当前目录及其子目录，并不过滤任何结果。  
```shell
# 使用实例，需要使用引号
$ find . -name 'my*'  
# 搜索当前目录，文件名以 my 开头的文件
$ find . -name 'my*' -ls  
# 搜索当前目录，文件名以 my 开头的文件，并且显示它们的详细信息。
$ find . -type f -mmin -10  
# 搜索当前目录中，所有过去10分钟中更新过的普通文件。 如果不加 '-type f'则搜索普通文件+特殊文件?+目录
```
- info [command]、man -k [command]，查看帮助信息
- locate 定位文件
```shell
# 是在一个数据库里查找，这个数据库每天只更新一次，可以使用 sudo updatedb 来手动更新数据库
```
- watch 监控设备 
```shell
# 比如监控GPU
watch -n 1 -d nvidia-smi
```
- type
- top :display linux processes
- whereis 已安装软件位置查询，以及配置文件
- which 查询可执行文件的位置
- cut  剪切字符串
- sed 在字符串后面添加字符
- identify 查看图片文件编码信息
- tree 显示目录结构
- ldd [EXECUTABLE] 显示可执行文件的链接库
- basename [NAME] 截取NAME中的文件名
- dirname [NAME] 截取NAME中的路径
- sed [option] 
流编辑工具，一次只处理一行数据

## 软件包管理
- apt(advanced packaging tool，应该是基于dpkg的，即获取到包后使用dpkg安装包)
```shell
apt-cache search
apt-get install 
apt-get reinstall
apt-get remover [--purge(删除包及配置文件)]
#更新源
apt-get update 
#更新已安装的包
apt-get upgrade
#升级系统
apt-get dist-upgrade
```
- dpkg(debian package,ubuntu是源自debian的linux发行版本)
    是一个比较底层的工具
```shell
#卸载 purge，不保留配置文件
dpkg -P <package>
#卸载，保留配置文件
dpkg -r <package> 
#显示所有已安装的deb包，同时显示版本号及剪短说明
dpkg -l
#显示特定包的信息
dpkg -s PACKAGENAME
```
- yum(yellow dog updater, modified)
    是一个前端软件包管理器，基于rpm包管理
```shell
# 安装包
yum install package
# 卸载包
yum remove package
```    

- rpm(redhat package management)
```shell
# 卸载包
rpm -e
# 查询已安装的包
rpm -q 
# 安装包
rpm -i
# 升级包
rpm -u 
```
- 内核操作
```shell
#内核操作
#ubuntu更新内核，切换内核启动 http://www.bkjia.com/xtzh/952429.html
#查看内核列表  
grep menuentry /boot/grub/grub.cfg
#或者
dpkg --list | grep linux-image

#删除内核命令 ubuntu tweak(忘记是什么了)
sudo apt-get remove linux-image
#删除后要使用命令下条命令更新grub
sudo update-grub
```
