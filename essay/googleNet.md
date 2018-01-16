# going deeper with convolutions
为什么全连接就容易发生过拟合呢？？ 参数过多，模型容量过大，易致过拟合。  
[知乎讲解](https://www.zhihu.com/question/27393324/answer/51075850)

## abstract
网络的典型出发点是在保持计算量的同时，增加网络的深度、宽度(通道数)。网络结构是基于bebbian principle(赫布理论，突触的可塑性)和多尺度处理的原则。  
使用这项技术的是一个22层的深度网络，叫做GoogLeNet。

## introduction
论文中网络的设计是在保持前向推断的计算量在$1.5$billion multiply-adds规模的约束下进行的。    
inception的名字来源于network in network。deep有两层含义，首先，引入了inception module，它的组合深度更深，其次，还有普通意义上的网络深度。

## related work
从LeNet-5开始，卷积神经网络的标准形式就是堆叠的卷积网络后接全连接层。  
NIN应用在卷积层时，可以看做是在标准的卷积层的后面，接额外的$1\times 1$卷积层(因为MLP是作用在卷积核卷积的输出上的，从整体上看就是单独的一层$1\times 1$卷积层)，再接非线性激活层，这使它很容易嵌入到卷积网络中。不过GoogLeNet使用$1\times 1$的目的主要是降低维度，以减少计算量，从而可以增加深度和宽度。

## motivation and high level considerations
直接通过增加深度、宽度来提高网络性能会有两个缺点，
1. 大模型意味着更多的参数，训练数据集有限的情况下，更容易过拟合，
2. 大模型意味着更大计算量，如果大量参数接近于$0$，那么计算量也就浪费了，在计算量有限的情况下，合理分配计算资源而不是盲目增大模型会更好。

解决以上问题的基本方法是把全连接替换为稀疏连接。

## architectural details
所以，现在的问题是有没有一种方法，既能保有网络结构的稀疏性，又能利用密集矩阵的高计算性能。论文提出了一种Inception Module，可以达到此等效果。  
大量引用这篇文献Provable bounds for learning some deep representations，应该是设计inception的依据。  
optimal sparse struction???
- naive inception  
pooling 管道会保持输入的通道数，所以inception模块的输出不可避免的导致通道数递增，
- improved inception  
使用$1\times 1$卷积压缩通道，embedding?

## GoogLeNet
把全连接换成均值pool可以提高$0.6\%$；即使移除全连接层，dropout依然有用。  
网络深度加深会带来这样一个顾虑，梯度是否能够有效反向传播？为了方便优化，所以添加辅助分类层，训练时，辅助分类的损失以$0.3$的权重加入最后损失中。

## training methodology

## conclusions


## tips
1X1维卷积如何降低维度？   
一层网络的width就是神经元的数目，通道数目  
网络的深度(depth)就是网络的层数，可以特别说明某一层，pooling层可以不算做一层  
什么是embedding  
btw： by the way  
