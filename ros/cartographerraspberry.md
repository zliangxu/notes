root登录:
	用户名：root；密码：123456;
pi登录：
	用户名：pi；  密码：raspberry;

ros安装工作空间：/pi/home/ros_catkin   
cartographer工作空间：pi/home/catkin_ws   运行命令：roslaunch cartographer_ros demo_r*
串口包工作空间：/pi/home/serial 	运行命令：rosrun serial_parse_publish DE*
导航工作包: ~/Mynav	运行命令：roslaunch mynav tutorial*

运行前在文件夹内source
编译包需要源码编译，检测.so文件是否是arm构架而非x86构架



在树莓派重新安装xrdp远程桌面，ifconfig命令查看树莓派ip，可用电脑远程控制。
需要解决无法登录pi用户的问题，以及远程桌面无法启动图形程序显示的问题，
		可以先登陆root用户，再用su切换到pi用户

设置了某个shell然后那个shell被删了吧
用root登陆然后su pi
再chsh -s /bin/bash
