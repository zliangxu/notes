[klt算法](http://cecas.clemson.edu/~stb/klt/)
即金字塔光流，opencv里也有实现
https://www.andol.me/

https://en.wikipedia.org/wiki/Gesture_recognition#cite_note-26
[object detection](https://mp.weixin.qq.com/s?__biz=MjM5NDE4MTc2OA==&mid=2447696536&idx=1&sn=53e7cb75d700aebd181c4803886bd59a&pass_ticket=OniSPg2DcZZh%2BWuC9s2PEoZ3qUu1prybnFJ1FKTGMQlezxg8yj2kehHlHxL%2F2EDn)

[driver hand database]( http://cvrr.ucsd.edu/vivachallenge/index.php/hands/hand-detection/)
[hand data](http://www.idiap.ch/resource/gestures/)

I used the following algorithm.

1. camshift algorithm
2. averaging background   https://en.wikipedia.org/wiki/Background_subtraction
3. convexhull 
4. labeling


编程语言、运行平台：vs，openCV；Android。（Matlab备选）
1. 人脸检测（包含人脸关键点检测）当前常见方法总结（有数据库和无数据库的两种情况）
（1）流程和方法
（2）涉及到的关键技术
例如：图像校正、分割、特征提取
2. 人脸识别（人证识别）的思路和方法总结
（1）流程和方法
（2）涉及到的关键技术
3. 视频图像行人检测再识别与跟踪方法
（1）流程和方法
（2）涉及到的关键技术
4. 智能化门禁系统的设计：
（1）包含人证识别：判断证件照片和人照是否为同一人，和自动；
（2）工作流程：车辆临近出门时，检测到车辆进入视频视场范围。
视频图像中车辆的检测与跟踪
5. 图书一维条形码的识别


编程语言、运行平台：vs，openCV；Android。（Matlab备选）
1. 人脸检测（包含人脸关键点检测）当前常见方法总结（有数据库和无数据库的两种情况）
方法：
    (1). 使用gabor变换，lbp特征做统计直方图， --基于改进的adaboost算法与局部特征方法的自动人脸识别系统的研究
    (2). lab特征-级联分类器，surf特征，多层感知机级联结构  --seetaface(开源的人脸识别框架)
    (3). 基于神经网络的目标检测框架 YOLO, dark-net、SSD, R-FCN, SPP-net，R-CNN
关键技术：
    传统方法的关键在于特征提取与分类算法

2. 人脸识别（人证识别）的思路和方法总结
方法：
    先使用关键点定位，对人脸进行矫正，再做人脸识别。
    (1). 关键点定位: 级联的栈式自编码网络， 人脸识别：cnn提取特征，用cosine计算相似度 --seetaface
    (2). 基于神经网络的方法：DeepFace, DeepID, FaceNet
    (2). 特征脸

3. 视频图像行人检测再识别与跟踪方法
行人检测方法：
    (1). hog+svm
    (2). dpm(deformable parts model)
    (3). ACF(aggreated channel feature)+级联分类器

4. 智能化门禁系统的设计：
（1）包含人证识别：判断证件照片和人照是否为同一人，和自动；
（2）工作流程：车辆临近出门时，检测到车辆进入视频视场范围。
视频图像中车辆的检测与跟踪
5. 图书一维条形码的识别

