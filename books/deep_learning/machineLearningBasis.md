machine learning basis
-------

## books
murphy(2012)  
bishop(2006)

## an example
design matrix 设计矩阵(训练集的矩阵表示)  
MSE(mean squared error，均方差、均方误差)  
对向量的二次方求导时，应该先将二次方分解成多项式的形式再求导。  
normal equations(正规方程)：优化方程的确切解

## capacity 
机器学习与优化算法的区别在于机器学习不仅希望降低训练误差，还希望降低泛化误差(测试误差)，而优化算法仅仅是以降低训练误差为目的。  
- 机器学习的前提假设  
    训练样本与测试样本都是独立同分布的，内在的分布称为**数据生成分布**
- 模型复杂度  
    representational capacity(表示容量)  
    effective capacity(有效容量，优化算法能够为模型真实提供的容量，一般少于模型的表示容量)    
    VC维：一种模型容量的量化方法
- 由预先知道的真实分布$p(x,y)$(理想条件下)预测而出现的误差称为贝叶斯误差  
    这个误差可以是由训练集的噪声等诸多因素引起的，是理想模型条件下的最小误差
- the no free lunch theorem  
    内容：在所有可能的数据生成分布上平均之后，每一个分类算法在未事先观测的点上都有相同的错误率  
    机器学习只能在特定数据分布上有较好的结果
- regularization  
    定义：任何以减小泛化误差而不是训练误差为目的在学习算法上的修改，统称为规则化  
    权重衰减(L1、L2)表示了对模型的某部分假设空间的偏好，这样也修改了模型容量

## hyperparameters and validation sets
- hyperparameters  
    一般不适合通过在训练集上学习得到，因为像表征模型容量的超参数一定会是越大越好，然而这样会造成过拟合
- validation set  
    测试集是为了评估一个模型的泛化误差，当然不能用于选模型或者模型的超参数，因此测试集中的样本不能出现在验证集中(测试集是由与训练集同样分布的样本组成)  
    训练集通常分成两个子集(80%、20%)，一个用于模型参数的训练，仍称为训练集；另一个用于训练后评估模型的泛化误差，同时用于选择超参数，称为验证集；在验证集选完超参数后，再由测试集平局泛化误差 
- k折交叉验证
    将训练集分为k个子集，使用k-1个子集训练，1个子集测试，对所有这种划分的测试集误差做平均，作为泛化误差

## estimator, bias, variance
- point estimator(点估计)  
点估计是对感兴趣的量做单个结果的最优预测。感兴趣的量可以是一个参数、参数向量或者函数(函数在函数空间内同样是一个点)  
点估计或称为统计量的定义式如下，其中 $x^{(i)}$ 为独立同分布的数据点，那么$x^{(i)}$是从一个随机抽取的，所以它是一个变量，任何以它为变量的函数也是变量。   
    $$\hat{\theta}_m=g(x^{(1)}, x^{(2)}, ......, x^{(m)})$$
- bias(偏差)  
    $$bias(\hat{\theta}_m)=\mathbb{E}(\hat{\theta}_m)-\theta$$
其中，$\theta$ 表示真实值  
无偏估计、渐进无偏估计

- 期望、方差的点估计  
使用样本均值估计期望是无偏估计  
$$\hat{\mu}_m = \frac{1}{m}\sum_{i=1}^{m}x^{(i)}$$
证明：  
$$\begin{aligned} \mathbb{E}[\hat{\mu}_m] 
&=\mathbb{E}[\frac{1}{m}\sum_{i=1}^{m}x^{(i)}] \\ 
&=\frac{1}{m}\sum_{i=1}^m \mathbb{E}[x^{(i)}] \\
&=\frac{1}{m} \sum_{i=1}^m \mu \\
&= \mu \end{aligned}$$

如果用样本方差估计方差，是有偏估计
    $$\hat{\sigma}_m ^2 = \frac{1}{m} \sum_{i=1}^{m}(x^{(i)}-\hat{\mu}_m)^2$$
其中，$\hat{\mu}_m$ 为样本均值  
证明：  
$$\begin{aligned} \mathbb{E}[\hat{\theta}^2_m] 
&=\mathbb{E}[\frac{1}{m}\sum_{i=1}^{m}(x^{(i)}-\hat\mu_m)^2] \\
&=\frac{1}{m}\mathbb{E}[\sum_{i=1}^{m}(x^{(i)}-\mu-(\hat\mu_m-\mu))^2] \\
&=\frac{1}{m}\mathbb{E}[\sum_{i=1}^{m}(x^{(i)}-\mu)^2-\sum_{i=1}^{m}2*(x^{(i)}-\mu)*(\hat\mu_m-\mu)+\sum_{i=1}^{m}(\hat\mu_m-\mu)^2] \\
&=\frac{1}{m}\mathbb{E}[\sum_{i=1}^{m}(x^{(i)}-\mu)^2-2m*(\hat\mu_m-\mu)^2+m*(\hat\mu_m-\mu)^2] \\
&=\frac{1}{m}[\sum_{i=1}^{m}\mathbb{E}(x^{(i)}-\mu)^2-m*\mathbb{E}(\hat\mu_m-\mu)^2] \\
&=\frac{1}{m}[m*\sigma^2-m*\mathbb{E}(\hat\mu_m-\mu)^2] \\
&=\sigma^2-\mathbb{E}(\hat\mu_m-\mu)^2 \\
&=\sigma^2-\frac{1}{m}\sigma^2=\frac{m-1}{m}\sigma^2
\end{aligned}$$
上式中的一个部分证明
$$\begin{aligned} \mathbb{E}(\hat\mu_m-\mu)^2
&=Var(\hat\mu_m) \\
&=Var(\frac{1}{m}\sum_{i=1}^{m}(x^{(i)})) \\
&=\frac{1}{m^2}\sum_{i=1}^{m}Var(x^{(i)}) \\
&=\frac{1}{m}\sigma^2
\end{aligned}$$

## 估计值的方差、标准差？？？？
中心极限定理：均值的分布是正态分布  
68-95-99.7分别对应1、2、3个标准差的置信区间  
95%概率的含义是当总体分布是正态分布时，估计值落在总体均值两个标准差范围内的概率均值。

## 偏差、方差的权衡
均方误差(为什么)  
$$\begin{aligned} MSE
&=\mathbb{E}[(\hat\theta_m-\theta)^2] \\
&=Bias(\hat\theta_m)^2+Var(\hat\theta_m) \\
&=[Bias(\hat\theta_m)]^2 + Var(\hat\theta_m) \\
\end{aligned}$$
[证明](https://en.wikipedia.org/wiki/Mean_squared_error)

## MLE
max likelihood estimation(极大似然估计)[wiki](https://zh.wikipedia.org/wiki/%E4%BC%BC%E7%84%B6%E5%87%BD%E6%95%B0)  
似然和概率是同义词，但在统计学中，两者有明确的区分。概率用于在已知一些参数的情况下，预测接下来的观测所得到的结果；而似然性，则是用于在已知某些观测所得到的结果时，对有关事务的性质的参数进行估计。