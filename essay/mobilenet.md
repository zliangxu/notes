# mobileNets: efficient convolutional neural networks for mobile vision applications 2017
## abstract
提出了depth-wise separable convolutions来减少计算量，并引入两个超参数来平衡速度、准确率。

## introduction
一个有效的网络架构，和两个超参数(width multiplier，resolution multiplier)

## prior work
以前做小而有效的网络工作可以分为两类，1.压缩已经训练好的模型，2.设计更小的网络来训练。这篇文章主要为了提高速度，模型大小是次要的。

## mobileNet architecture
### depthwise separable convolution
也就是对于输入特征图$W_i\times H_i\times C$，有$C$个卷积，分别一一对特征图的通道做卷积，最后输出$W_o\times H_o \times C$  
之后又做pointwise convolution，即$1\times 1$大小的标准卷积。
### network structure and training
除了输出层，所有的层都使用Batchnorm和ReLU。  
把depthwise和pointwise convolution分开计算，MobileNet共有$28$层。  
标准卷积块|MobileNet卷积块  
-------|--------
$3\times 3$ Conv | $3\times 3$ Depthwise Conv
BN   | BN
ReLU | ReLU
 -   | $1\times 1$ Pointwise Conv
 -   | BN
 -   | ReLU
 因为小模型，更不容易过拟合，所以这里训练时，没有采用数据增强，没有或很弱的规则化。
 ### width multiplier: thinner models
 使用参数$\alpha$表示，表示输入、输出特征图的通道数乘以系数$\alpha$
 ### resolution multiplier: reduced representation
 改变输入图像及中间计算过程计算图的大小，参数$\rho$

 ## experiments
 ## conclusion

