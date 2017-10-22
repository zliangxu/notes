[qt gui-class](http://doc.qt.io/qt-4.8/qtgui-module.html)  
[qt class table](http://doc.qt.io/qt-5/classes.html)  
[qt精品教程](http://www.qter.org/portal.php?mod=list&catid=6)  
[qt下载列表](http://download.qt.io/archive/)    
[qt官方例子](http://doc.qt.io/qt-5/qtexamplesandtutorials.html)  
[sqlite qt驱动](http://qsqlite.sourceforge.net/#description)  
[qt自带数据库 例子](http://www.qter.org/portal.php?mod=view&aid=51)  
[在线电子书](https://qtguide.ustclug.org/)  
https://github.com/lxg2015/code

## widget
就是gui的小部件
text edits, scroll bars, 
labels：显示图像，静态文字

## 快捷键
1. ctrl + tab 切换打开的文件
2. f4 切换源代码和头文件
3. alt+enter 在头文件函数声明上点击并按快捷键添加函数的定义
4. ctrl+shift+r 全局修改变量名
5. ctrl+e 后松开再按1、2、3，分别是删除所有分栏、添加上下布局分栏、添加左右布局分栏
6. ctrl+i 自动缩进选中的代码
7. f2 快速切换到选中对象的源码
8. ctrl+鼠标点击 定义与声明之间切换

# ubuntu下配置
## 配置opencv
在.pro文件中添加
```c++
INCLUDEPATH += /usr/local/include \
LIBS += /usr/local/lib/libopencv_highgui.so \
```



## qt creator 快速入门
项目文件就是.pro文件，是用于qmake来生成MakeFile的，可以在项目目录下由qmake -project生成
qt添加动态链接库文件，在.pro文件添加
```
// libseeta_facedet_lib.so
LIBS += your_lib_path/your_lib     //linux下
LIBS += -L/home/lxg/codetest/qtface/model/ -lseeta_facedet_lib // linux下配置 共享库(动态库)
而下面这种会提示找不到库文件
LIBS += /usr/local/lib/libopencv_highgui.so  // win下配置
```


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
```

## 安装与卸载
- 卸载，运行安装目录下的
./MaintenanceTool.dat
- 安装，运行.run安装包