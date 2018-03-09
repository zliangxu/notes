# inception-v4, inception-ResNet and the impact of residual connections on learning
## abstract
在inception中添加ResNet模块能够有效加快模型的训练。相同计算量情况下，ResNet的性能要比Inception的好一些。本文提出了新的inception-network，带有residual及没有residual的。

## introduction
object detection、segmentation、human pos-estimation、video classification、object tracking、superresolution。  
探讨inception与ResNet的融合 Inception-ResNet。  
最后章节分析了一些错误分类案例，并得出结论，集成并没有完全消除标注的噪声。

## related work
ResNet中提到residual connection在训练深度网络时是必须的，本篇作者发现并不是这样。
- InceptionV1, GoogLeNet
- InceptionV2, 使用BN
- InceptionV3, 使用additional factorization，没有使用Residual连接
- InceptionV4, 没有使用Residual连接

## architectural choices
### pure inception blocks
### residual inception blocks
### scaling of the residuals
作者发现当滤波器数目超过$1000$时，residual network开始变得不稳定，容易输出0，作者这里的解决方案是将residule通道乘以系数$0.1\sim 0.3$。在ResNet原文中，也出现这种现象，解决方法是使用两阶段训练，第一阶段使用小学习率来warp up，第二阶段使用大学习率(没有看到过)。

## training methodology
- momentum 0.9
- decay 0.9
- learning rate 0.045
- RMSProp
- $\epsilon=1.0$

## experimental results
## conclusions
提出三种新网络
- inception-resnet-v1
- inception-resnet-v2
- inception-v4(没有使用resnet，性能与inception-resnet-v2相似)
作者后来又补充了aligned-inception-resnet结构，没有发表文章。inception-resnet没有对齐的原因是多层卷积、池化导致的？深层特征与图像位置不对应。通过合适的pad解决问题。