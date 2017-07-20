video for linux(v4l2)
-----
[v4l2 doc](http://v4l.videotechnology.com/)

## UVC(Usb Video device Class)
说的是一类支持视频流的USB设备，有对应的驱动支持这样的设备。

## v4l2(video for linux)
是一个设备驱动，视频读取的API集合，以及linux的驱动程序框架。

## uvc与v4l2的关系

[blog](http://www.cnblogs.com/surpassal/archive/2012/12/19/zed_webcam_lab1.html)
http://blog.csdn.net/tsuibeyond/article/details/50654823


## 摄像头驱动
http://blog.csdn.net/codectq/article/details/44278465


## notes
```c++
struct v4l2_capability
{
    _u32 capabilities; //摄像头有多种模式，拍照，视频输出，覆盖模式，视频流
};
```