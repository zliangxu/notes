## [查找命令](http://www.ruanyifeng.com/blog/2009/10/5_ways_to_search_for_files_using_the_terminal.html)
### 1. find
**$ find <指定目录> <指定条件> <指定动作>**  

find 默认搜索当前目录及其子目录，并不过滤任何结果。  
使用实例
- $ find . -name 'my*'  
搜索当前目录，文件名以 my 开头的文件

- $ find . -name 'my*' -ls  
搜索当前目录，文件名以 my 开头的文件，并且显示它们的详细信息。

- $ find . -type f -mmin -10  
搜索当前目录中，所有过去10分钟中更新过的普通文件。 如果不加 '-type f'则搜索普通文件+特殊文件?+目录

### 2. locate
### 3. whereis
### 4. which
### 5. type

### 6. 软件卸载及安装
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

#卸载 purge，不保留配置文件
dpkg -P <package>
#卸载，保留配置文件
dpkg -r <package> 

```