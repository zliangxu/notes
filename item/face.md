[thick face](http://www.thinkface.cn/portal.php)


## seetaface 中科院计算所山世光研究员团队
[seetaface介绍](https://zhuanlan.zhihu.com/p/22451474)
[人脸识别系统](http://blog.sina.com.cn/s/blog_6ae1839101012fbb.html)

- face detection 人脸检测模块
    结合传统人造特征与多层感知机(MLP)的级联结构，由粗到精的设计理念，兼顾了速度和精度的平衡
    针对多姿态人脸的快速LAB级联分类器，SURF特征的多层感知机级联结构，最后由一个统一的MLP级联结构(同样是SURF特征)
    开源的一个人脸检测模型是使用20万人脸数据的准正面人脸(45°以内)检测模型
    Funnel-Structured cascade(漏斗型级联结构)
    滑动窗口检测

- face alignment 面部特征点定位，基于深度的方法
    分三部分：人脸表观图像建模、人脸形状建模、人脸表观与人脸形状的关联
    CFAN(coarse to fine auto encoder networks)，栈式自编码网络
    使用CFAN级联
    级联形状回归模型
    两眼、鼻尖、两个嘴角

- face identification 人脸特征提取与对比模块
    大部分使用卷积神经网络(CNN)，提取人脸特征
    VIPLFaceNet由AlexNet裁剪得到，通过卷积层、全连接层得到2048维的特征向量，特征比对使用Cosine计算相似度，然后进行阈值比较(验证)或排序(识别)

## 人脸识别系统[概述](http://blog.sina.com.cn/s/blog_6ae1839101012fbb.html)
- 人脸检测跟踪
- 人脸特征点定位
- 图像质量评估，选出最适合做人脸检测的图像
- 活体检测
- 人脸识别

## 基于改进的adaboost算法与局部特征方法的自动人脸识别系统的研究 郝敬松
- 基于adaboost的人脸检测
    使用机器学习的方法
    LAB特征、YUV直方图模型
    LAB(locally assembled binary、局部集成二值模式)是LBP与
    级联分类器与adaboost算法不同、real Adaboost
- 基于子空间的人脸识别
- 基于局部特征的人脸识别
    