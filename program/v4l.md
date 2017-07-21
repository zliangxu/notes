video for linux(v4l2)
-----
[v4l2 doc](http://v4l.videotechnology.com/)

## UVC(Usb Video device Class)
说的是一类支持视频流的USB设备，有对应的驱动支持这样的设备。

## v4l2(video for linux)
是一个设备驱动，视频读取的API集合，以及linux的驱动程序框架。

## uvc与v4l2的关系

## code
[blog](http://www.cnblogs.com/surpassal/archive/2012/12/19/zed_webcam_lab1.html)  
http://blog.csdn.net/tsuibeyond/article/details/50654823


## 摄像头驱动
http://blog.csdn.net/codectq/article/details/44278465


<<<<<<< HEAD
- 输入和输出(三种模式，通过v4l2_capability 查询)  
    Read/Wtite : 可能需要cpu去复制数据，不过也可能支持dma，所以效率不一定不只交换指针的方法差，没有时间戳等信息。  
    Streaming I/O(memory mapping): 把摄像头的缓存区映射到应用程序的地址上，有时间戳。  
    Streaming I/O(User Pointers):  
- 图像格式(摄像机格式查询，v4l2_fmtdesc )  
    4.3.3. Image Format Negotiation
## notes
=======
## notes 
>>>>>>> b79c25b43661028961dac416724b5b8f1c516ac8
```c++
struct v4l2_capability
{
    _u32 capabilities; //摄像头有多种模式，拍照，视频输出，覆盖模式，视频流
};
```