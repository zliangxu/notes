# Deep Residual Learning for Image Recognition
## Abstract
reformulate the layers as learning residual functions

## introduction
当网络的层数增加时，梯度Vannishing\Exploding的问题可以使用更好的训练集初始化和Batch normalization来解决。
但是准确度随着层数的增加开始degradation。这里做了一个实验来说明这个问题，当建立一个浅层网络和与它对应的深层网络，深层网络通过在浅层网络的后面添加identity mapping网络来做对比试验，结果深层网络要比浅层网络的性能要差。  
而这篇文章提出了一种能够建立有效的深层网络的方法。

## related work

## deep residual learning
当模型容量相同时，要考虑 the ease of learning

## network architectures
当channel变化：有两种方案，(1)如果是输出维度大于输入维度，直接为多出的维度补0，而不是自身；(2)使用1x1卷积网络来增加维度，
当feature map size变化：直接使用与原conv同样的stride
data augmentaion:
1. scale augmentation: image is resized with its shorter side randomly sampled in [256,480]
2. random crop
3. random horizontal flip
4. color augmentation
network flow:
convolution->batch normalization->activation
learning rate 调整：
当loss不变时，将learning rate 缩小为1/10、

## experiment
