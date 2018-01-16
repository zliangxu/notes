# 卷积神经网络结构设计---从更深到更宽[video1](http://www.itdks.com/dakalive/detail/5379)[video2](https://pan.baidu.com/s/1eRUincu?errno=0&errmsg=Auth%20Login%20Sucess&&bduss=&ssnerror=0&traceid=)

1. reducing the dimensionality of data with neural network, science, 2006
学习受限玻尔兹曼机的快速方法
2. ImageNet classification with deep convolutional neural network, NIPS,2012
CNN技术(dropout)、ImageNet数据集、GPU  


# deeper and wider
## deeper
网络层数更多
AlexNet 8layer 2012
VGGNet 19layer 2014
GoogLeNet 22layer 2014
HighWay 100+layer 2015
ResNet 152layer 2015
Deeply-Fused Net 2016
DenseNet 2016
到output层数太多造成梯度消失，到input层数

## wider
指feature map通道数更多
merge-and-run mapping  
identity mapping  
幂等矩阵
> $$M^n=M$$

## DMRNet(王井东，微软)
参数减少的同时，减轻过拟合   
通过going less deep and wider，参数利用的更好，学到的特征表达能力更强  

## going wider with interleaved Group Convolutions ICCV 2017
卷积神经网络的复杂度分析  
- 时间复杂度  
使用FLOPs衡量，(floting point operations per second)
- 空间复杂度  
模型的参数量，体现为模型的体积。
group convolution  
pointwise convolution