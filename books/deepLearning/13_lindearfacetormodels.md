# linear factor models
线性因子模型，很多都可以使用潜变量表示，是一种probabilistic models with latent variables
> $$h \sim p(h)=\prod_i p(h_i)$$(1)
> $$x=Wh+b+noise$$(2)
## probabilistic PCA and Factor analysis
- factor analysis  
是$1,2$式的特殊情况，$h$的先验分布是正态分布
> $$h\sim \mathcal{N}(h;0,I)$$
噪声是来自于对角化协方差的高斯分布(即各维度噪声之间不是线性相关的)。  
> $$\psi=diag(\sigma^2),\quad \sigma^2=[\sigma_1^2,\sigma_2^2,....,\sigma_n^2]^T$$
那么$x$也服从正态分布(均值、方差可确定)
> $$x\sim \mathcal{N}(x;b,WW^T+\psi)$$
- probabilistic PCA  
噪声的方差都是同样大小的
> $$x\sim \mathcal{N}(x;b,WW^T+\sigma^2I)$$
当$\sigma=0$时，probabilistic PCA就成为了PCA

## independent component analysis ICA
潜变量需要是完全独立的(probabilistic PCA和 factor analysis只是保证潜变量不相关即没有线性关系)，并且要求$p(h)$不是高斯分布  
许多不同的方法都被称为ICA，与本书描述的其它生成模型最相似的是一个训练完全参数化的生成模型，$p(h)$的先验分布由用户提前确定，
> $$x=Wh$$  
EM(最大期望算法)   
大多数变种并不使用EM算法，  ?   
[ICA wiki](https://en.wikipedia.org/wiki/Independent_component_analysis)，包括
- linear noiseless ICA
- linear noisy ICA
- nonlinear ICA  

[tensorflow实现](http://edwardlib.org/tutorials/probabilistic-pca)  
[cs3750](https://people.cs.pitt.edu/~milos/courses/cs3750-Fall2007/#Lectures)

## slow feature analysis
linear factor model

## sparse coding
linear factor model

## manifold interpretation for PCA
