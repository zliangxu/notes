http://www.cnblogs.com/dudumiaomiao/p/6560841.html

## convolution feature map
卷基层生成的特征图

## [rcnn](http://blog.csdn.net/shenxiaolu1984/article/details/51066975)
- 训练集
    一个较大的识别库（ImageNet ILSVC 2012）：标定每张图片中物体的类别。一千万图像，1000类。 
    一个较小的检测库（PASCAL VOC 2007）：标定每张图片中，物体的类别和位置。一万图像，20类。 
- RCNN算法分为4个步骤 
    一张图像生成1K~2K个候选区域 
    对每个候选区域，使用深度网络提取特征 
    特征送入每一类的SVM 分类器，判别是否属于该类 
    使用回归器精细修正候选框位置 

## [fast r-cnn](http://blog.csdn.net/shenxiaolu1984/article/details/51036677)
## faster-rcnn
RPN(regional proposal network、区域生成网络)
rcnn中有提取feature map的步骤，而feature map被用来做RPN


## 1. region proposal 方法
- Selective Search
- Edge Boxes
- region proposal net

## 2. 