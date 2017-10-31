[虹软人脸识别](http://www.arcsoft.com.cn/ai/sdk/apply-1002-1.html)

- 人脸检测
    输入图像，大小，输出人脸角度及人脸框。  
    不知道图像文件存储是怎样的，是直接将图像数据以二进制写入的，所以可以直接把 Mat.data 作为检测模块的输入。
    写保存特征的数据库
	把 hongruan 的人脸库添加到qt中
- 人脸跟踪
- 人脸识别  
    输入是带人脸角度的人脸框，没有关键点，输出是特征(Byte)及特征长度，提取特征后进行特征匹配，输出相似度。

支持的图片格式
格式名称|详细信息
--------|--------
ASVL_PAF_I420 | 8-bit Y 通道， 8-bit 2x2 采样 U 通道， 8-bit 2x2 采样 V 通道
ASVL_PAF_NV12 | 8-bit Y 通道， 8-bit 2x2 采样 U 与 V 分量交织通道
ASVL_PAF_NV21 | 8-bit Y 通道， 8-bit 2x2 采样 V 与 U 分量交织通道
ASVL_PAF_YUYV | YUV 分量交织， V 与 U 分量 2x1 采样，按 Y0, U0, Y1, V0 字节序排布
ASVL_PAF_RGB24_B8G8R8 | RGB 分量交织，按 B, G, R, B 字节序排布

- input image 格式
```cpp
/*Define the image format space*/		
typedef struct __tag_ASVL_OFFSCREEN
{
	MUInt32	u32PixelArrayFormat;
	MInt32	i32Width;
	MInt32	i32Height;
	MUInt8*	ppu8Plane[4];
	MInt32	pi32Pitch[4];
}ASVLOFFSCREEN, *LPASVLOFFSCREEN;
```


## pipeline
分为两部分
1. 数据库管理
人脸数据库必然需要管理界面，即基本的添加、删除、修改操作。
点击添加按钮后，弹出一个带有摄像头界面的窗口，实时检测人脸，然后点击注册时，提取人脸到另一窗口， 确认后则保存，并销毁窗口。
存储数据库时，人脸ID要唯一，需要多尝试几次，从小到大，依次尝试，直到正常插入为止。

2. 使用
只需要访问数据库，然后将人名对应到摄像头采集到的视频上的人脸上。