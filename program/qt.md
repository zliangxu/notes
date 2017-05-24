[document](http://doc.qt.io/qt-4.8/qtgui-module.html)
[qt精品教程](http://www.qter.org/portal.php?mod=list&catid=6)
widget 就是gui的小部件，text edits, scroll bars, labels……

## 配置opencv
在.pro文件中添加
```c++
INCLUDEPATH += /usr/include/opencv2
INCLUDEPATH += /usr/include/opencv
LIBS += -L/usr/local/lib/ -lopencv_core -lopencv_highgui -lopencv_imgproc
```



