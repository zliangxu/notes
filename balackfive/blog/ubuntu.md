今天ubuntu无故死机，无论怎么按鼠标、键盘，界面一直停止，无奈只好强制关机，然后再开机就一直检查磁盘，这比较正常，但检测完毕后却不能和往常一样正常进入桌面，而是命令行终端。经过一番折腾后发现是/home目录即/dev/sda8磁盘无法挂载，然而在/etc/fstab文件内，挂载home盘的设置仍然正确存在，并且使用sudo mount -a命令是可以挂载上去的。这就让人很奇怪了，最后在recover模式，重新挂载磁盘的选项下，发现系统提示/dev/sda8 contains a file system with errors。之后就在终端上 fsck /dev/sda8 成功修复了磁盘。
```shell
fsck /dev/sda8  #修复/dec/sda8
df -kh  #显示系统磁盘挂载情况
mount -a #重新挂载/etc/fstab内的磁盘
blkid #查看uuid
fdisk #磁盘列表
/etc/fstab #本文件存储挂载设置
```