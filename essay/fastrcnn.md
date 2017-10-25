## [fast r-cnn](http://blog.csdn.net/shenxiaolu1984/article/details/51036677)

## Abstract
使用VGG16网络
与SPPnet(spatial pyramid pooling networks)相比，更快

## introduction
目标检测有两个主要问题：
1. 大量的候选框 (Proposal) 需要处理
2. 为了精准定位目标，候选框仍要 refine

以前的方法大都是 multi-stage piplines
fast-rcnn 是 single stage training that jointly learns to classify object proposals and refine their spatial locations
改善后的结果就是速度上9倍于R-CNN, 3倍于SPPnet， mAP达到66%

R-CNN有如下缺点：
1. training is multi-stage pipeline， 包括三个stage， 首先是微调一个分类网络，然后使用卷积层特征把ConvNet 的softmax分类器换成svm训练object detector， 最后训练bounding-box regressors
2. 为训练 SVM 和 bounding box regressor 很花费空间、时间，因为要先使用VGG16为每一张图像的 proposal box 提取特征
3. 检测很慢

SPPnet使用了空间金字塔最大值池化，为每一个 proposal 在一个尺度上特征图提取固定大小特征(6x6)，然后将多个尺度的特征 concatentate 到一起
 

 ## Fast R-CNN architecture and training
 ![fastrcnnflow](../image/essay/fastrcnnflow.jpg)  
 输入是一张图像与 region of interest(ROI)，输出是类别及bounding box regressor。在图像的卷积特征图上为每一个 proposal box 提取特征的方法 a region of interest(ROI) pooling layer，提取固定维度的特征向量
- roi pooling layer
不同于SPPnet，这里只使用了一个尺度上的特征。
- initalizing from pre-trained networks
- fine-tuning for detection  
**这里解释SPPnet不能进行训练的原因是每一个 minibatch 训练 ROI 都没有规定为来自同一张图像，更进一步解释是每一个 ROI 的 receptive field 都是全图，也就是说网络的前向传播使用了全图，而反向传播只针对于图像的ROI部分计算出的 loss。**在 Fast R-CNN 中训练集准备的策略是先选出 N 张图像，然后从每张图像中选出 R/N 个ROI，即一个 mini-batch 共 R 个 ROI。这样 ROI 在前向传播和反向传播时都共用了 computation and memory(反向传播是如何共享的？)。这样操作会产生一个这样的顾虑，就是来自同一张图像的 ROI 是 correlated 的，但是在实验过程中，没有发现有什么影响。

### Multi-task loss:  
对于分类任务，什么是 log loss  ？ 数学意义是什么？  
对于坐标回归任务， smoothL1 又意味着什么?  less sensitive to outliers than the L2 loss ?? 什么是 outliers??

### Mini-batch sampling  
as in rcnn，使用 25% 的与 ground truth bounding box 的 IOU 大于 0.5 的 proposal 

### Back-propagation through ROI Pooling Layers

### SGD hyper-parameters
- scale invariance

## Fast R-CNN detection