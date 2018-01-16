# continuous latent variables
第9章的混合高斯属于离散潜变量，本章讨论部分或全部潜变量为连续值的情况。
## PCA
用于降维、数据压缩、数据预处理、特征提取、数据可视化，也叫作KL变换  
PCA有两种定义，不过使用的是同一种算法：
- 原始数据到低维线性空间(principle subspace)的正交投影变换，保证投影数据的方差最大。
- 一种线性变换，使变换数据到原始数据的距离(均方误差)最小。    

fisher linear discriminant利用了label信息，而PCA是无监督学习。  
为什么要引入$b_i$？ $b_i$是常数，要舍弃？？

数据预处理
- 标准化
> $$y_i=\frac{x_i-\bar x}{\sigma(x)}$$(1)
其中，这里将$x$看做标量，$\bar x$是$x$变量的均值，$\sigma(x)$是$x$变量的标准差。  
标准化后，$x$的均值为$0$，方差为$1$
- 白化(whitening)
> $$S=\frac{1}{N}\sum_{n=1}^N (x_n-\bar x)(x_n-\bar x)^T$$
上式是协方差矩阵$S$的求解，假设$x$是$D$维向量，则$S$是$D\times D$的矩阵
> $$SU=UL$$
其中，$S$是协方差矩阵，$U$是正交矩阵，由$S$的特征向量组成，$L$是对角矩阵，是$S$的特征值构成的矩阵
> $$y_n = L^{-1/2}U^T(x_n-\bar x)$$(2)
$(2)$式就是白化的处理的变换矩阵，首先和$(1)$式相同的部分，可以看出它是$0$均值、$1$方差的，其次正交矩阵$U$使变换后$y$的协方差矩阵为单位矩阵，即各元素只与自身有关，与其它元素的协方差为$0$。证明如下：
> $$\begin{aligned} \frac{1}{N} \sum_{n=1}^N y_ny_n^T &= \frac{1}{N} \sum_{n=1}^N  L^{-1/2}U^T(x_n-\bar x) (x_n-\bar x)^T U^T L^{-1/2} \\
&=  L^{-1/2}U^T S UL^{-1/2} \\
&= L^{-1/2}U^T UL L^{-1/2} \quad \text{根据} SU=UL \\
&= I\end{aligned}  $$

## Probability PCA
传统PCA是基于线性映射将原始数据映射到低维度空间内，PPCA是将潜变量看做一种概率分布后的极大似然估计。  
优点：
- 可以使用EM更高效求解，从而避免算协方差矩阵  
- 结合EM可以解决丢失数据问题？
- PPCA是使用贝叶斯求解PCA的主要成分的基个数的基础
- PPCA可以为类条件概率建模，从而用于分类
- PPCA是一种生成模型

PPCA是一种linear-gaussian框架，它的边缘分布、条件概率分布都属于高斯分布。

- maximum likelihood for PCA  
有闭式解，需要迭代的形式？
- EM(expectation maximum) for PCA
EM算法用于求解PCA模型参数的极大似然估计，EM算法也是迭代的形式

