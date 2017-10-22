http://www.retiisi.org.uk/v4l2/tmp/media_api/pixfmt.html  
https://github.com/figgis/yuv-viewer
[opencv保存yuv](http://blog.csdn.net/smilebluesky/article/details/39559137)
[图文详解yuv](http://www.cnblogs.com/azraelly/archive/2013/01/01/2841269.html)
## yuv数据格式
yuv主要是为了方便彩色电视信号与黑白电视信号的兼容，因为Y是单独一个通道的。不管哪种存储方式、采样方式，显示的时候都首先要计算出每一个像素的YUV值，然后按照YUV->RGB的公式计算出每个像素的RGB值，这样才能够显示。其中Y是亮度(Luminance)，即灰度值，U和V表示色度(chrominance)，描述色彩及饱和度。而Cb、Cr等同于U、V。

按存储方式分为两大类
1. planar格式 先连续存储所有像素点的Y，紧接着存储所有像素点的U，随后是所有像素点的V。
2. packaed格式 每个像素点的Y,U,V是连续交叉存储的。

按采样方式主要分为三种
1. YUV 4:4:4采样，每一个Y对应一组UV分量。
2. YUV 4:2:2采样，每两个Y共用一组UV分量。 
3. YUV 4:2:0采样，每四个Y共用一组UV分量。 

## 图片文件头标示
1.JPEG/JPG - 文件头标识 (2 bytes): $ff, $d8 (SOI) (JPEG 文件标识) - 文件结束标识 (2 bytes): $ff, $d9 (EOI) 
2.TGA - 未压缩的前5字节   00 00 02 00 00 - RLE压缩的前5字节   00 00 10 00 00
3.PNG - 文件头标识 (8 bytes)   89 50 4E 47 0D 0A 1A 0A
4.GIF - 文件头标识 (6 bytes)   47 49 46 38 39(37) 61                         G  I  F  8  9 (7)  a
5.BMP - 文件头标识 (2 bytes)   42 4D                         B  M
6.PCX - 文件头标识 (1 bytes)   0A
7.TIFF - 文件头标识 (2 bytes)  4D 4D 或 49 49
8.ICO - 文件头标识 (8 bytes)   00 00 01 00 01 00 20 20 
9.CUR - 文件头标识 (8 bytes)   00 00 02 00 01 00 20 20
10.IFF - 文件头标识 (4 bytes)   46 4F 52 4D                        F  O  R  M
11.ANI - 文件头标识 (4 bytes)   52 49 46 46                         R  I  F  F

## 查看图片文件信息
```shell
identify 57.yuv
```