# a unified multi-scale deep convolutional neural network for fast object detection ECCV 2016
[blog](https://xzhewei.github.io/2017/10/21/%E8%AE%BA%E6%96%87%E7%AC%94%E8%AE%B0%E3%80%8AA-unified-multi-scale-deep-convolutional-neural-network-for-fast-object-detection%E3%80%8B/)
## abstract
MS-CNN是一个two-stage目标检测网络，由两部分组成，a proposal subnetwork, a detection subnetwork。    
proposal network是在多个特征图上操作的(与FPN,SSD类似)，使用特征上采样反卷积(deconvolution)来替代输入上采样，网络整体是端到端训练，使用multi-task损失。  
MS-CNN达到15fps

## introduction
滑动窗口目标检测很难推广到多类目标检测？(特征提取方法不变，而改变分类器的分类数目不就行？)  
CNN能够解决多类目标检测的问题，但是对多尺度目标检测的研究还很少。R-CNN的计算效率很低，而Faster R-CNN中RPN依然有问题，它的感受野是固定的，而目标的大小不同，这导致小目标检测很困难(大感受野，小目标)。而现有的解决方法，放大输入图像，牺牲了计算量。

本文提出MS-CNN，贡献点有
1. 多层用于目标检测，
2. deconvolution 能够减少内存使用和计算时间？？(这里与通过上采样输入图像获得高分辨率特征图的方法对比，上采样特征图效率更高)

## related work
VJ的快速主要有两个方面，
1. 特征提取快速，使用积分图，ACF在此基础上，使计算HOG能够达到$100$fps？  
2. 级联分类器快速。 soft-cascade等，适用的特征也有ACF、deep CNN，然而这个框架很难用于多类目标检测 

在尝试将CNN图像分类的成功应用于目标检测上
1. R-CNN，将object proposal机制与CNN分类器结合，性能提高了一大截，然而由于CNN分类器需要重复计算，效率较低。(有位置回归吗？)
2. SPP(spatial pyramid pooling)，通过一次计算全图的特征，有效提升了速度
3. Fast R-CNN，在SPP的基础上，引入Roi pooling及其反向传播机制，multi-task的分类器、坐标回归
4. Faster R-CNN，引入RPN网络替代传统算法selective search

高层特征具有较高的语义信息，结合中间层特征，能够产生更加accurate 的语义特征。

## multi-scale object proposal network
### multi-scale detection
### architecture

## object detection network

## conclusions
