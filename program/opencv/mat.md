Mat
----

## 类的定义
```c++
// 成员变量
rows        // 2维矩阵中的行
cols        // 2维矩阵中的列
dims        // 矩阵的维度，例如2维矩阵，这里和通道数有所区别，通道并没有被看做是一个维度
channel     // 矩阵的通道数，例如CV_8UC1，为灰度图，1通道
depth       // 矩阵中每一个元素的位深度，例如CV_8UC1，为8bits depth
elsmSize    //
size        // 矩阵每一维的维数，例如2维矩阵的尺寸Size(cols, rows)，注意行和列的顺序
step        // 返回一个MatStep类，存储着矩阵每一个维度的占用的字节数，例如对于2D矩阵，step[0]表示每一行的字节数，step[1]表示每一列的字节数
type        // mat element的格式，与图像编码无关，如 CV_8UC3

//成员函数
elemSize()  // 返回矩阵中一个元素的字节数，例如CV_16SC3，返回sizeof(short)*3=6，即六个字节
elemSize1() // 返回矩阵中一个元素中单独一个通道的字节数，例如CV_16SC3，返回2，即两个字节
```

## 元素访问
```cpp
cout << src.at<Vec3b>(x,y)
```