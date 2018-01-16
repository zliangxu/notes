# delving deep into rectifiers: surpassing human-level performance on imagenet classification 2015
## abstract
relu激活函数应用非常广泛，这篇文章对此提出了改进，1.提出参数化的relu，即PReLU，在基本不增加计算量的情况下提高模型拟合能力，同时降低过拟合的风险。2.依据ReLU的非线性特性，提出一个鲁棒的参数初始化方法。  
使用PReLU-nets，在ImageNet 2012数据集上达到4.95% top-5 错误率，而ImageNet 2014冠军 GoogLeNet是6.66%，首次超越了人类，5.1%

## introduction
2015的最近几年，图像分类的性能有了显著的提升，这主要得益于两项技术，
- 更大的模型  
更深的网络，更宽的网络，小stride，新的非线性激活函数，特别设计的网络结构
- 设计有效的防止过拟合技术  
数据增强，大数据集
在这些技术中，relu能够加快模型的收敛。

## Approach
### PReLU
![prelu](../image/essay/prelu.jpg)  
左侧是ReLU，右侧是PReLU，其中$a$是可学习的。
> $$f(y_i)=\begin{cases} y_i &\text{if } y_i > 0 \\
a_i y_i &\text{if } y_i \leqslant 0\end{cases}$$
其中，$y_i$是ReLU激活函数输入的第$i$通道。  
当$\alpha_i$很小且值固定时，如$\alpha_i=0.01$时，PReLU就成为了Leaky ReLU(LReLU)，目的是为了避免梯度为$0$。

因为PReLU添加的参数量很少，所以发生过拟合的风险很小。作者也考虑了$\alpha$与通道无关的情况。  
$\alpha$参数也是用反向传播算法时，使用momentum SGD，
> $$\Delta\alpha_i:=\mu\Delta\alpha_i+\epsilon\frac{\partial L}{\partial\alpha_i}$$
其中，$\mu$是动量，$\epsilon$是学习率，$L$表示损失函数。注意，这里不能使用权重衰减项(l2范数？)，因为这会使$\alpha_i$趋向于$0$，初始化时设$\alpha_i=0.25$。实验时，发现训练好的网络中，$\alpha_i$也都小于$1$。  
这里没有限制$\alpha_i$的取值范围，也就是说PReLU可以是非单调的。  
实验发现，1.第一层卷积的P参数显著较大一些，这和Gabor滤波器相似，保留负响应及正响应，2.对于channel-wise的实验，越靠后的层的P参数越小，也就是激活函数的非线性越大。
### initialization of filter weight for rectifiers
ReLU网络虽然易于训练，但是一个坏的参数初始化，仍会影响高度非线性系统的收敛。  
- AlexNet使用固定方差为$0.01$的高斯分布初始化参数。
- 更深的网络VGG收敛也有很大的困难，VGG的作者使用预训练的$8$层网络来初始化深层网络，这导致网络学到更差的局部最优。
- GoogLeNet中使用中间层做辅助监督来帮助收敛。
- Bengio提出的'Xavier'初始化方法，使用比例的均匀分布初始化，是针对线性激活函数推导出来的，并不适用于ReLU。   

**一个合理的初始化方法的关键在于随着处理层数的增加，不指数放大或缩小输入量的分布**  
以下针对ReLU分析，不是PReLU
- 前向传播的情况  
初始化参数为$0$均值，标准差如下式的高斯分布，$n_l=k^2c$，$c$表示第$l$层滤波器的通道数
> $$std=\sqrt\frac{2}{n_l}; \quad b=0$$
- 反向传播的情况  
初始化参数为$0$均值，标准差如下式的高斯分布，$\hat n_d=k^2d$，$d$表示第$l$层滤波器的个数
> $$std=\sqrt\frac{2}{\hat n_d}; \quad b=0$$
两种方法都能够有效避免输入分布的指数变化，所以任意一种初始化形式都可以。  
使用上面两种方法能够保持输入分布，但是如果输入是$(-128,128)$，即未进行方差归一化，那么输出如果是softmax，会造成溢出的，解决方法就是每层的权重乘以一个缩小的比例系数。