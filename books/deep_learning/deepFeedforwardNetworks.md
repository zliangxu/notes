# deep feedforward networks
深度前馈网络、前馈神经网络、多层感知机是同一个概念，都是指只有前向传播的网络；当前馈网络被扩展为包含反馈连接时，称为循环神经网络。  
一种理解前馈神经网络的方式是从线性模型开始，可以看做是使用核技巧的线性模型：
> $$y=f(x; \theta, w) = \phi(x; \theta)^Tw$$
其中，$\phi(x;\theta)$定义了一个隐藏层，$w$用与将 $\phi(x)$ 映射到 $y$

## word
implicitly 含蓄的

## books
- ReLU  
jarrett et al. 2009   
nair and hinton 2010  
glorot et al 2011a

## gradient descent learning
是因为非线性导致神经网络的代价函数非凸的吗？？？  
一些特别的算法是对梯度下降思想的改进和提纯(第4.3节)  
还有一些更特别的，大多数是对随机梯度下降算法的改进(第5.9节)  
1. 代价函数  
把代价函数看做一个泛函，泛函是函数到实数的映射。我们因此可以将学习看做是选择一个函数而不仅仅是选择一组参数。
2. output units
- linear units：用于输出符合高斯分布的的量  
- sigmoid units：用于输出符合二项分布的量  
- softmax units：用于输出符合多项分布的量
    softmax因为在计算中使用指数函数，所以容易发生饱和，使用log-likelihood代价函数可以避免这种饱和造成的梯度消失问题    
    softmax是连续可微分的，而argmax的输出是one-hot编码，不连续也不可微分，所以softmax可以看做是soft版本的argmax。
输出层与代价函数应该是相互协调的

## hidden units
- relu  
左梯度为0，右梯度为1
- sigmoid
- tanh  
很多激活函数都可以达到优化的同样的效果，但是都不会明显的提升效果，只是各种units可能有各自适应的场景，各有长处，很少有突破性的进展，所以提出新激活函数的创新性论文较少

## architecture design
学术上已经证明只有一层隐藏层的网络就可以拟合任何函数，但是这个理论universal approximation theorem没有说明，这样的网络需要多广，即隐藏层神经元需要的数目。同时，有很多实验表明，更深的网络可以减少每层网络的神经元数目，并且往往具有更好的泛化性能。

## back-propagation
1. computation graph
每一个节点都是一个Tensor，Tensor可以有任意的维度，可以是数、向量、矩阵……
2. 静态计算图与动态计算图
这两个概念应该是指这个symbol-to-symbol和symbol-to-number，其中symbol-to-bumber是指输入为计算图与输入网络的一些真实数值，输出是对应数值的梯度，即有实际输入的时候才会有对应的梯度输出，使用这项技术的有torch与caffe，它的好处是可以随时打印中间计算结果，所以方便调试？？。  
而symbol-to-symbol在定义计算图是，它的反向传播算法也被定义为了与前向传播同样语言标识的计算图，使用这项技术的有tensorflow与theano，它的主要好处是可以计算二阶梯度，因为有反向传播计算图，所以把一阶梯度带入应该就可以计算二阶梯度。
3. 计算量
按照公式求解梯度的计算量会随着节点的数目指数增长，而


## history notes
神经网络可以看做是一个有效的基于梯度下降法来减小代价函数的非线性函数拟合的方法，在这个意义上来说，神经网络是以往拟合函数技术的发展结晶。

现代神经网络使用的仍然是过去的技术，像梯度下降；梯度的链式法则，使用编程的方法，开始于1960s-1970s，大多用于控制论、sensitivity analysis，1980开始用于神经网络。反向传播，在1986年，有一个使用这项技术的成功实验，然后神经网络开始有了进一步发展，直到1990s，其它机器学习技术的效果更好，也就得到了更多的关注；
现代神经网络的兴起主要是有两个元素，大数据和好的计算性能。当然也存在一些引入注意的创新，主要包括，替换均方误差为以最大似然概率为准则以交叉熵损失函数为代表的损失函数；替换隐藏层激活函数sigmoid为piecewise linear units，如rectified linear units，其实rectified linear units在神经网络的发展历史中流行了一段时间，但是可能由于在小网络上，sigmoid的效果更好，所以sigmoid开始流行起来，

rectified linear units为什么效果会好？？  
这个激活函数是受生物神经元启发得到的，主要有三个类似的信息，(1)、对于有的输入，神经元是完全inactive的。(2)、对于有的输入，神经元的输出是proportional于它的输入的。(3)、大部分时候，神经元都是inactive的，表示是sparse activations。


    

