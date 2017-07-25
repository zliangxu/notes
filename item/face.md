[github开源人脸检测](https://github.com/shanren7/real_time_face_recognition)  
[think face](http://www.thinkface.cn/portal.php)  
[dlib](http://dlib.net/)  
[人脸识别系统](http://www.cnblogs.com/hrlnw/p/6226287.html)  
人脸检测还有 npd, pico, 云从    
centerloss人脸识别  


## 人脸对齐,[face alignment](http://blog.csdn.net/eastlhu/article/details/25063193)
求取人脸关键点的位置是前提条件，之后的对齐一般是基于平面上的左右倾斜角度，计算仿射变换矩阵，然后获得归一化的人脸；对于有前后倾斜的人脸不能做矫正。

## seetaface 中科院计算所山世光研究员团队
[seetaface介绍](https://zhuanlan.zhihu.com/p/22451474)

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
- [ubuntu 安装seetaface](http://www.nljb.net/default/%E5%9C%A8Ubuntu%E4%B8%ADBuild%E4%BA%BA%E8%84%B8%E8%AF%86%E5%88%AB%E5%BC%95%E6%93%8ESeetaFace/)
(http://www.cnblogs.com/makefile/p/seetaface-install.html)

- 问题
    1. illegal instruction(core stump)
        是因为amd 不支持sse，在cmakeLists.txt内set为off就可以了
    2. 编译faceIdentification时
    需要添加这一行，才会找到lib库文件 link_directories(${PROJECT_BINARY_DIR})

## 人脸识别系统[概述](http://blog.sina.com.cn/s/blog_6ae1839101012fbb.html)
- 人脸检测跟踪
- 人脸特征点定位
- 图像质量评估，选出最适合做人脸检测的图像
- 活体检测
- 人脸识别

## 基于改进的adaboost算法与局部特征方法的自动人脸识别系统的研究 郝敬松
- 基于adaboost的人脸检测
    使用机器学习的方法，LAB特征、YUV直方图模型
    LAB(locally assembled binary、局部集成二值模式)是LBP的二值编码模式与Haar的矩形亮度特征的融合。
    级联分类器与adaboost算法不同、real Adaboost
    adaboost是离散adaboost，它的判定规则是二值的，而连续adaboost的输出是连续的，代表了判定的确信程度。
    人脸检测中使用特征的方式分为基于特征与基于窗口两种。
    使用连续adaboost与lab特征，再做yuv的空间直方图模型进行验证
- 基于外观的子空间的人脸识别
    主成分分析(PCA, principal component analysis)
        是一种非监督方法，通过K-L变换寻找一个子空间。
    线性判别分析(LDA, linear discriminant analysis)
    独立成分分析(ICA, independent component analysis)
    局部保持投影(LPP, Locality preserving projection)
    二维主成分分析(2DPCA, two-dimensional PCA)
    二维线性判别分析(2DLDA, two-dimensional LDA)
    fisher线性判别分析(FLDA, fisher linear discriminant analysis)
        是一种监督方法。
    核主成分分析(KPCA, kernel PCA)
    核fisher判别分析(KFDA, kernel fisher discriminant analysis)
- 基于局部特征的人脸识别
    sift, surf, brief(binary robust independent element feature,局部图像邻域内随机点对的灰度大小关系建立局部图像特征描述子)
    haar, lab(), hog
    gabor变换: gabor变换可以用卷积或fft(快速傅里叶变换)两种形式计算，fft是一种加速的算法，可以减少计算量，gabor变换得到的是包含实部与虚部的复数滤波器，可以转换为幅值和相位特征。比较鲁棒但特征维数较高、计算比较复杂。
    lbp特征:通过对原图像划分为多个不重叠的小块，单独统计小块内的lbp直方图作为特征，根据相似性度量来分类
    lgbp直方图序列人脸识别：先做gabor变换，对gabor变换得到的图做lbp直方图统计


## Joint Cascade Face Detection and Alignment（MSRA,ECCV14)
[文章讲解](http://blog.jobbole.com/85783/)

## 数据库
google的leveldb数据库，不适合做查询工作，不支持网络服务
sqlite是一个轻型的数据库
mysql跨平台，可以使用c++操作数据库
MariaDB，类似mysql
xml   
protobuf：一般用于网络通信，把复杂数据转为序列化数据  