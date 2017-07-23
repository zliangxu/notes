video for linux(v4l2)
-----
[v4l2 doc](http://v4l.videotechnology.com/)  
[blog for v4l2](http://unicornx.github.io/2016/03/12/20160312-v4l2-app/)
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


- 输入和输出(三种模式，通过v4l2_capability 查询)  
    Read/Wtite : 可能需要cpu去复制数据，不过也可能支持dma，所以效率不一定不只交换指针的方法差，没有时间戳等信息。  
    Streaming I/O(memory mapping): 把摄像头的缓存区映射到应用程序的地址上，有时间戳。  
    Streaming I/O(User Pointers):  
- 图像格式(摄像机格式查询，v4l2_fmtdesc )  
    4.3.3. Image Format Negotiation  
    YUYV(YUV 4:2:2)，这个比例并不是一个字节中的各分量比特数的比例，而只是一个约分后的比例，YUYV四个字节表示两个像素。它有打包、平面两种形式。
- 扫描方式  
    progressive： 逐行扫描  
    interlace : 隔行扫描
## notes
写代码可以参考doc附录里的例子  
结构体
```c++
struct v4l2_capability
{
    _u32 capabilities; //摄像头有多种模式，拍照，视频输出，覆盖模式，视频流
};
// 应用程序与驱动之间交换的buf，
struct v4l2_buffer
{
    __u32 index; //buf的序号，申请的buf是多个的
    enum v4l2_buf_type; //buf类型
    __32 bytesused; //使用的字节数
    __32 flags; //buf flafs,表示内存已经被映射到用户空间、在输入队列、在输出的队列
};
```

控制参数
```c++
VIDIOC_QUERYBUF; //查询buf的状态，参数v4l2_buffer
VIDIOC_QBUF; // enqueue 参数v4l2_bufferr
VIDIOC_DQBUF; // dequeue, exchange a buffer
```