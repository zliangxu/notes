# non-local neural networks 2017

## abstract
cnn和rnn中的block都是进行局部邻域的操作，作者从[4](a non-local algorithm for image denoising)中得到启发，建立non-local block来捕捉lond range dependencies的信息。
non-local block中计算一个位置的响应为所有位置响应的加权和。

## introduction
在深度网络应用中，long-range dependencies有着重要作用。对于序列数据(语言)，RNN的循环操作能够解决长期依赖问题。对于图像数据，CNN的大感受野、多层卷积的叠加能够解决大范围依赖问题。也就是都是通过重复的进行局部操作来解决long-range dependencies的问题，但是这样有很多缺陷，1.计算效率低下，2.优化困难(ResNet解决的问题)，3.使得多端依赖困难？如信息来回传输？  
提出的non-local操作是[4]的推广，计算的加权和结果时参考的所有位置有space、time、spacetime类型，分别对应图像、语音类的序列、视频。

## related work
- non-local image processing  
non-local means，BM3D
- graphical models  
条件随机场
- feedforward modeling for sequeeces
有人使用前向网络(非循环网络)来处理序列型数据，通过使用大的感受野及调大网络深度来达到长期依赖的限制，并且这样的网络可以使用并行运算。 
- self-attention  
self-attention是用于机器翻译的，本质上也是non-local mean[4]的推广。
- interaction networks  
- video classification architectures

## non-local networks
先给出定义，然后提出多种实例化方法。
### formulation
> $$y_i=\frac{1}{C(x)}\sum_{\forall j} f(x_i,x_j)g(x_j)$$
其中$i$是所计算输出的位置，$j$是所有依赖位置，$x$是输入的信号，$y$是与$x$同样大小的输出信号，函数$f$计算出一个标量表示$i$与$j$的关系，$g$计算出输入信号在位置$j$的响应，$C(x)$是归一化因子。由公式可以看出来，每一个位置$i$的输出都和所有的$j$有关系，那么实际计算时，就等价于卷积操作了。
non-local 操作不同于全连接，因为non-local计算的是不同位置信号关系的响应，并且non-local的输入可以是不同大小的。
### instantiations
接下来给出不同的$f,g$的定义，但是有趣的是各种定义下的non-local network，实验性能上并没有什么区别，这说明最重要的是non-local的结构。  
简单起见，定义$g$为简单的线性embedding(满足单射及结构保存)，
> $$g(x_j)=W_gx_j$$
其中，$W_g$是可学习参数矩阵，对于空间数据，可以是$1\times 1$的卷积，对于空间时间数据，可以是$1\times 1\times 1$的卷积。
- 高斯
- 高斯嵌入
- dot product
- concatenation
### non-local block


# background
## a non-local algorithm for image denoising 2015

