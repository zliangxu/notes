[document](http://doc.qt.io/qt-4.8/qtgui-module.html)
[qt精品教程](http://www.qter.org/portal.php?mod=list&catid=6)
[qt下载列表](http://download.qt.io/archive/)

widget 就是gui的小部件，text edits, scroll bars, labels……


# ubuntu下配置
## 配置opencv
在.pro文件中添加
```c++
INCLUDEPATH += /usr/local/include \
                /usr/local/include/opencv \
                /usr/local/include/opencv2
#                /usr/include/x86_64-linux-gnu/qt5/QtCore \

LIBS += /usr/local/lib/libopencv_highgui.so \
        /usr/local/lib/libopencv_core.so    \
        /usr/local/lib/libopencv_imgproc.so
```



## qt creator 快速入门
项目文件就是.pro文件，是用于qmake来生成MakeFile的，可以在项目目录下由qmake -project生成
- 命令行编译qt程序
```shell
# 生成.pro项目文件
qmake -project
# 生成MakeFile
qmake
# 编译
make
```

- 命令行编译.ui界面文件生成头文件
```shell
uic -o ui_hellodialog.h hellodialog.ui
````


## 安装与卸载
- 卸载，运行安装目录下的
./MaintenanceTool.dat
- 安装，运行.run安装包