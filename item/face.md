## seetaface 中科院计算所山世光研究员团队
[seetaface介绍](https://zhuanlan.zhihu.com/p/22451474)
[人脸识别系统](http://blog.sina.com.cn/s/blog_6ae1839101012fbb.html)

- face detection 人脸检测模块
结合传统人造特征与多层感知机(MLP)的级联结构，由粗到精的设计理念，兼顾了速度和精度的平衡
针对多姿态人脸的快速LAB级联分类器，SURF特征的多层感知机级联结构，最后由一个统一的MLP级联结构(同样是SURF特征)
开源的一个人脸检测模型是使用20万人脸数据的准正面人脸(45°以内)检测模型
Funnel-Structured cascade(漏斗型级联结构)
滑动窗口检测

- face alignment 面部特征点定位
CFAN(coarse to fine auto encoder networks)
栈式自编码网络
两眼、鼻尖、两个嘴角

- face identification 人脸特征提取与对比模块
VIPLFaceNet由AlexNet裁剪得到