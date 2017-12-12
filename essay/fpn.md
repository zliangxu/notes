# feature pyramid networks for object detection
## abstract
为了能够检测多尺度的目标，特征金字塔是一个很基本的成分，而以往的目标检测算法为了减少计算量，都没有使用金字塔，这篇文章探索了多尺度，在增加了很少额外计算量的情况下使用了特征金字塔，为了建立多尺度的特征图，采用了一个top down的结构，叫做FPN(feature pyramid networks)
6fps，因为还是two stage的结构。

## introduction
## related work
hand-engineered features and neural networks  
deep convnet object detectors: overfeat, rcnn, sppnet  
methods using multiple layers:   

## feature pyramid networks
主要和ssd一样，使用了多个尺度的特征图，不过各层特征图的构造方式不同，包括bottom-up pathway, top-down pathway, lateral connections。
### bottom up
是前向的卷积网络，对于输出相同大小特征图的层，这里定义为在同一stage，feature pyramid就是把每一stage的输出当做一层。$C2,C3,C4,C5$，对应的步长为$4,8,16,32$。由于Conv1的特征图过大，所以没有包括在内。
## top down and lateral connections
使用最近邻原则进行上采样，每次扩大$2$倍，与相同大小的bottom up特征图相加，为了使两者通道数一致，其中bottom up结构使用$1\times 1$卷积处理。
因为所有层特征图上的head 网络是共享参数的，所以特征图的通道数要一致，这里设为$d=256$

## applications
使用fpn网络作为RPN和Fast R-CNN的基础结构。
### fpn for RPN
RPN网络本来的设计是只在一层特征图上进行$3\times 3$的卷积操作，每个卷积操作对应不同大小、不同比例的anchor输出。现在是在fpn的基础上做RPN，是在$\{P2,P3,P4,P5,P6\}$特征图上执行$3\times 3$的卷积操作，分别输出$\{32^2,64^2,128^2,256^2,512^2\}$大小的anchor，每个大小对应三种比例$\{1:2,1:1,2:1\}$。  
正样本为IOU$>0.7$和与ground-truth box的IOU最大的proposal box，负样本是IOU$<0.3$的proposal box。  
作者实验发现，在所有层特征图上的head network共享参数及不共享参数两种情况下的，性能相差不大，说明各层特征图有相似的语义？
### feature pyramid networks for Fast R-CNN
Fast R-CNN是在一个特征图上使用Roi Pool来获取固定长度的特征向量，所以对于Proposal box，需要从FPN的多层特征图选出一层来提取特征图，对于$w,h$的proposal box，应该对应于FPN的第$k$层特征图，(提出框的RPN层，并不是用于提取特征的层)：
> $$k = \lfloor k_0+\log_2(\sqrt{wh}/224)\rfloor$$
$224$是ImageNet训练网络时惯用的输入图像大小，$k_0$是当Roi为$224\times 224$时，所对应的特征图层，这里$k_0$设为与Faster R-CNN论文中类似的位置，即$4$。
最后在特定层，提取Roi对应的特征向量$7\times 7$，后接$2$层$1024-d$的全连接。

## conclusion
实验表明，尽管ConvNet具有很强表达能力，一定程度上具有尺度不变性，显示的使用金字塔表示仍然很有必要。