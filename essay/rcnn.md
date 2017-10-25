[blog](http://www.cnblogs.com/dudumiaomiao/p/6560841.html)
[detail](http://blog.csdn.net/shenxiaolu1984/article/details/51152614)

## convolution feature map
卷基层生成的特征图

## rcnn
- 训练集
    一个较大的识别库（ImageNet ILSVC 2012）：标定每张图片中物体的类别。一千万图像，1000类。 
    一个较小的检测库（PASCAL VOC 2007）：标定每张图片中，物体的类别和位置。一万图像，20类。 
- RCNN算法分为4个步骤 
    一张图像生成1K~2K个候选区域 selective search方法
    对每个候选区域，使用深度网络提取特征 
    特征送入每一类的SVM 分类器，判别是否属于该类 
    使用回归器精细修正候选框位置 
## introduction
two key insights
1. 使用了传统计算机视觉的 bottom up region proposals 和 high capacity CNN
2. 使用了迁移学习  

![rcnnflow](../image/essay/rcnnflow.jpg)

## Object detection with R-CNN
object detection system consists of 3 modules
1. category-independent region proposals
为了方便与以往工作的比较，选择了selective search
2. convolutional neural network that extracts a fixed-length feature vector
5层卷积，2层全连接提取4096维度的特征向量，输入图像大小固定是227x227，转换方法见Appendix A，训练的是一个分类网络，并且使用了迁移学习，具体的是先在ImageNet上训练一个1000-way分类网络，然后在VOC上训练20类的分类网络。
在每一步SGD中，为了避免数据不均衡，选择32个正样本，96各负样本一起组成 mini-batch of size 128。
3. class-specific linear SVMs
训练过程中，使用hard negative mining method

现在有了一张图里所有区域的 score 后，使用一个 class independently non-maximum suppression方法。
## training 包括多个stage
1. supervised pre-training
2. domain-specific fine-tuning
3. object category classifiers
4. bounding box regressor

## Visualization, ablation, modes of error

## detection error analysis


## Appendix A 目标框的变换
![warp](../image/essay/rcnnwarp.jpg)  
主要包括两种方法使proposal box成为227x227大小，一是使用 tightest square(最小外接正方形)，然后再将其长、宽等比例地 (isotropically) 放大到227x227，图中，B和C都是这个方法，两者的区别在于B使用context填充空缺，如果没有context，则用均值，C直接使用图像均值填充空缺，而A是proposal box，D是直接 warp，即直接进行放大。在每个例子中，上一行是直接对proposal box处理，即 context padding = 0，下一行的 context padding = 16。实验表明使用 warp with context padding = 16时，效果最好，提高3-5 mAP%

## Positive vs negative examples and softmax
为CNN微调制作的正、负样本的标准与进行 object detection 的 SVM 的标准不同:  
1. 为CNN微调制作正样本的标准是所有 proposal box 中与 ground-truth box 之间的 IOU 大于0.5的 proposal box，负样本是其它 proposal box  
2. 为训练SVM制作的正样本只有 ground-truth box，负样本是 proposal box 中与 ground-truth box IOU 小于0.3的 proposal box，其它 proposal boxes are ignored，这里使用了难例学习  

## bounding-box regression
在使用svm对每一个 proposal box 预测类别后，使用class-specific bounding-box regressor 来预测一个更加精准的框  
模型预测的参数包括两部分：
1. 是 proposal box 与 bounding box 中心点坐标的差值与proposal box的比值，即与尺度无关的中心坐标偏移量。
2. 是 proposal box 与 bounding box 的对数尺度差值?? 为什么要使用对数空间内的误差
使用 regularizaed least squares objective(ridge regression)

在训练过程中，有两个 subtle issues
1. 需要使用较大的规则化系数
2. training pairs的选择，我们把 proposal box 配对到与所有 bounding box 中 IOU 最大的 bounding box 上，并且 IOU 大于 0.6 时，才配对成功，可以作为训练集，其它的都舍弃。为每一个类别都做这个过程来训练处 class-specific bounding box regressor。作者还考虑了迭代这个过程，就是把纠正过的 bounding box 重新作为输入来训练，但是精度并没有改善。