# network in network

potent function: 使用多层感知机来做potent function estimator??

论文的出发点在于特征对很多变化的输入是不变的，而卷积是一个generalized linear model(GLM)，所以为了增强local model(感受野卷积)的表达能力，替换为了micro network structure，即把linear convolution layer 替换为mlpconv layer

latent concepts are linearly separable??

与传统的cnn卷积分类任务最后几层是全连接层不同，nin直接以最后输出的特征图做global average pooling layer来作为分类信息，之后的向量输入到了softmax层，来做分类

在传统cnn图像分类任务上，由于最后几层是全连接层是一个黑箱，导致无法分析类别信息是如何向后层卷积网络传播的，而nin使用global average pooling直接将特征图与类别联系了起来，这样更有可解释性，而这也是通过更有表达能力的mlpconv layer实现的。其次，全连接层易于发生过拟合【4】【5】，严重依赖于dropout regularization,而global pooling is itself a structural regularizer, naitively prevents overfitting for the overall structure

传统卷积层perform linear separation, maxout network[8] is more potent as it separate concepts that lie within convex sets

affine feature maps是直接由卷积操作而不经过激活函数得到的
mlp convolution layer

radial basis network(径向基核函数？？？) 和 多层感知机都是通用的函数近似

多层感知机自身是可以深度的，is consistent with the spirit of feature re-use[2]

cross channel parametric  pooling layer 等价于 a convolution layer with 1x1 convolution kernel????

image[49]图片来源

全连接层之间可以看作一特殊的卷积层，其中卷积核的大小为 1*1， feature maps的 个数即为全连接层中的每一层的units的数目

可以看出mlp的第一层就是普通卷积，第二层是全连接层可以看做1*1卷积(在这里是4通道进入，3通道输出)，第三层也是一个1*1卷积

image图片来源
global average pooling over feature maps(全局均值池化)，即一张特征图最后池化为一个数据

dropout is proposed by Hinton【5】 as a regularizer which randomly sets half of the activations to the fully connected layers to zero during training

在这篇文章里，提出为每一类图片提供一张特征图，然后每一张特征图里直接做平均，得到的向量接到softmax进行分类
network in network structure

a stack of mlpconv layers, on top of which lie the global average pooling and the objective cost layer

例子中是三层perceptron
tips

模型参数中，全连接层的数据占据了很大一部分

1*1卷积层能够减小变量数目是因为其是跨通道的

其实卷积层都是跨通道的，只是在说卷积模板时，一般只提模板的长和宽