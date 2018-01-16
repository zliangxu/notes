# Deep Residual Learning for Image Recognition
## Abstract
reformulate the layers as learning residual functions

## introduction
当网络的层数增加时，梯度Vannishing\Exploding的问题可以使用更好的训练集初始化和Batch normalization来解决。  
但是准确度随着层数的增加开始degradation。这里做了一个实验来说明这个问题，当建立一个浅层网络和与它对应的深层网络，深层网络通过在浅层网络的后面添加identity mapping网络来做对比试验，结果深层网络要比浅层网络的性能要差。这说明不是所有的系统都能得到相同程度的优化。  
而这篇文章提出了一种能够建立有效的深层网络的方法。

## related work
- residual representation  
VLAD
- shortcut connections  
hightway network在提升网络深度时，并没有带来精度的提升

## deep residual learning
当模型容量相同时，要考虑 the ease of learning
### residual learning
### identity mappings by shortcuts
### network architectures
- plain network  
依据VGG的网络设计原则，1.当特征图的大小没有变化时滤波器的个数也不变。2.当特征图的大小减半时，滤波器的数量加倍，以保持每层网络的时间复杂度相同。
- residual network  
当channel变化时：有两种方案，(1)如果是输出维度大于输入维度，直接为多出的维度补0，而不是自身；(2)使用1x1卷积网络来增加维度。   
当feature map size变化时：使用stride 2。   
### implementation
data augmentaion:
1. scale augmentation: image is resized with its shorter side randomly sampled in [256,480]
2. random crop
3. random horizontal flip
4. color augmentation

network flow:   
> $$convolution \rightarrow batch\_normalization \rightarrow activation$$
learning rate 调整：
当loss不变时，将learning rate 缩小为1/10、

## experiment
### ImageNet classification  
- plain network    
34-layer的准确率要比18-layer的低，网络使用BN层，这表明优化困难不是因为梯度消失造成的。
- residual network    
identity vs projection shortcut    
a：0 padding，b:projection只用来增加维度，其它是identity，c：所有的捷径使用projections

### CIFAR-10  
$50k$训练图像，$10k$测试图像，网络输入图像是$32\times 32$，输出特征图大小分别有$32\times 32, 16\times 16, 8\times 8$，通道数有$16,32,64$  

### Object detection on pascal and coco

BasicBlock与Bottleneck内的卷积都没有使用bias参数，这是因为batch normalization的作用会使bias参数无效。