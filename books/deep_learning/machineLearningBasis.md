# machine learning basis

## words

population 总体

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
    训练集通常分成两个子集(80%、20%)，一个用于模型参数的训练，仍称为训练集；另一个用于训练后评估模型的泛化误差，同时用于选择超参数，称为验证集；在验证集选完超参数后，再由测试集评定泛化误差 
- k折交叉验证
    将训练集分为k个子集，使用k-1个子集训练，1个子集测试，对所有这种划分的测试集误差做平均，作为泛化误差

# estimator, bias, variance

基本的参数估计、偏差和方差的概念有利于正式的刻画泛化、欠拟合和过拟合的概念  
- point estimator(点估计)  
点估计是对感兴趣的量做单个结果的最优预测。感兴趣的量可以是一个参数、参数向量或者函数(函数在函数空间内同样是一个点)  
点估计或称为统计量的定义式如下，其中 $x^{(i)}$ 为独立同分布的数据点，那么$x^{(i)}$是从一个随机抽取的，所以它是一个变量，任何以它为变量的函数也是变量。   
> $$\hat{\theta}_m=g(x^{(1)}, x^{(2)}, ......, x^{(m)})$$
- bias(偏差：点估计最常研究的性质)  
> $$bias(\hat{\theta}_m)=\mathbb{E}(\hat{\theta}_m)-\theta$$
其中，$\theta$ 表示真实值  
无偏估计、渐进无偏估计

- 对于高斯分布，期望、方差的点估计  
使用样本均值估计期望是无偏估计  
> $$\hat{\mu}_m = \frac{1}{m}\sum_{i=1}^{m}x^{(i)}$$
证明：  
> $$\begin{aligned} \mathbb{E}[\hat{\mu}_m] 
&=\mathbb{E}[\frac{1}{m}\sum_{i=1}^{m}x^{(i)}] \\ 
&=\frac{1}{m}\sum_{i=1}^m \mathbb{E}[x^{(i)}] \\
&=\frac{1}{m} \sum_{i=1}^m \mu \\
&= \mu \end{aligned}$$

如果用样本方差估计方差，是有偏估计
> $$\hat{\sigma}_m ^2 = \frac{1}{m} \sum_{i=1}^{m}(x^{(i)}-\hat{\mu}_m)^2$$

其中，$\hat{\mu}_m$ 为样本均值  
证明：  
> $$\begin{aligned} \mathbb{E}[\hat{\theta}^2_m] 
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
> $$\begin{aligned} \mathbb{E}(\hat\mu_m-\mu)^2
&=Var(\hat\mu_m) \\
&=Var(\frac{1}{m}\sum_{i=1}^{m}(x^{(i)})) \\
&=\frac{1}{m^2}\sum_{i=1}^{m}Var(x^{(i)}) \\
&=\frac{1}{m}\sigma^2
\end{aligned}$$

## 估计值的方差和标准差

“我们常考虑估计量的另一个最常研究的性质是它作为数据样本的函数，期望的变化程度是多少。  
估计量的方差或标准差告诉我们，当独立地从潜在的数据生成过程中采样数据集时，如何期望估计的变化。正如我们希望估计的偏差较小，我们也希望其方差较小。它是一种误差来源”  
估计量的方差就是一个方差
> $$Var(\hat\theta)$$
中心极限定理：均值的分布是正态分布  
68%、95%、99.7%分别对应1、2、3个标准差的置信区间  
95%概率的含义是当总体分布是正态分布时，估计值落在总体均值两个标准差范围内的概率均值。

## 偏差、方差的权衡
“偏差和方差度量着估计量的两个不同误差来源。偏差度量着偏离真实函数或参数的误差期望。而方差度量着数据上任意特定采样可能导致的期望的偏差。”    

均方误差和均方偏差是一个概念，这个概念根据所描述的对象有两个含义  
其一，对于predictor，
> $$MSE=\frac{1}{n} \sum_{i=1}^{n}(\hat{Y}_i-Y_i)^2$$

其二，对于estimator

估计量的均方误差，MSE度量着估计和真实参数 $\theta$ 之间平方误差的总体期望偏差。
> $$\begin{aligned} MSE
&=\mathbb{E}[(\hat\theta_m-\theta)^2] \\
&=Bias(\hat\theta_m)^2+Var(\hat\theta_m) \\
&=[Bias(\hat\theta_m)]^2 + Var(\hat\theta_m) 
\end{aligned}$$
[证明](https://en.wikipedia.org/wiki/Mean_squared_error)  

# MLE

## 似然函数

[likelihood function wiki](https://zh.wikipedia.org/wiki/%E4%BC%BC%E7%84%B6%E5%87%BD%E6%95%B0)  
似然等于给定一个$\theta$时的条件概率  
> $$\mathcal{L}(\theta|x)=P(x|\theta)$$
在数理统计学中，似然函数是一种关于统计模型中的参数的函数，表示模型参数中的似然性。  
似然和概率是同义词，但在统计学中，两者有明确的区分。概率用于在已知一些参数的情况下，预测接下来的观测所得到的结果；而似然性，则是用于在已知某些观测所得到的结果时，对有关事务的性质的参数进行估计。

## 最大似然估计

是做参数估计时设计估计公式的一种准则  
> $$\begin{aligned}\theta_{ML}
&=arg\max\limits_{\theta}p_{model}(\mathbb{X};\theta) \\
&=arg\max\limits_{\theta}\prod_{i=1}^{m}p_{model}(x^{(i)};\theta) \\
&=arg\max\limits_{\theta}\sum_{i=1}^{m}\log p_{model}(x^{(i)};\theta) \qquad\text{取对数易于计算,不改变}\theta_{ML} \\
&=arg\max\limits_{\theta}\frac{1}{m}\sum_{i=1}^{m}\log p_{model}(x^{(i)};\theta) \qquad\text{分数相当于概率}\\
&=arg\max\limits_{\theta}\mathbb{E}_{x \sim \hat p_{data}} \log p_{model}(x^{(i)};\theta) \qquad \hat p_{data} \text{是经验分布}
\end{aligned}$$  (1)

其中，$p_{model}(x;\theta)$是以$\theta$为参数的概率分布空间(假设空间)  
最大似然估计的一个解释是最小化训练集的经验分布与所估计的模型分布的不相似度，不相似度使用$KL$散度(相对熵)度量
> $$D_{KL}(\hat p_{data}||p_{model})=\mathbb{E}_{x\sim \hat p_{data}}[log\hat p_{data}-\log p_{model}]$$ (2)
1和2式是等价的。

# 贝叶斯统计
## 贝叶斯估计(全贝叶斯推断)
贝叶斯估计与极大似然估计(点估计)有两点主要不同  
1. 极大似然估计中预测只使用了一个参数值$\theta$，贝叶斯估计是依据概率分布做期望预测的
2. 贝叶斯估计中有先验分布$p(\theta)$  

## 最大后验概率估计(MAP贝叶斯推断)
是一个点估计(它不等同于贝叶斯估计)
> $$\theta_{MAP}=arg \max \limits _{\theta}p(\theta | x)=arg \max \limits _{\theta}\log p(x|\theta)+\log p(\theta)$$
其中，$\log p(x|\theta)$是似然，它的和不一定为1，该式等价于极大似然估计加上先验概率

## supervised learning
1. probabilistic supervised learning 
2. support vector machines  
m应该就是样本的数目，因为在其它机器学习算法中，$w$一般由样本线性组合而成，所以这里直接写成了这种线性组合的形式。而这个形式可以转为 kernel trick  
> $$w^Tx+b=b+\sum_{i=1}^{m}\alpha_i x^Tx^{(i)}=b+\sum_{i}\alpha_ik(x,x^{(i)})$$
3. k-nearest neighbor 

## unsupervised learning algorithm
无监督学习与监督学习并没有一个明显的区分界限，因为监督学习意思是存在一个目标量，但是这个目标量也可以看做是一个特征或样本属性。

simpler representation  
1. lower dimensional 
2. sparse representations
3. independent representations

## stochastic gradiant descent
代价函数中的代价值是基于所有样本的，SGD使用 minibatch 的例子来计算代价函数的梯度，相当于以样本代替总体。

## 维数灾难
当数据的相关维度增大时，感兴趣的配置数目会随之指数级增长。

## 传统方法的弊端
1. local constancy
2. smoothness regularization

## manifold learning(流形学习)
流形指连接在一起的区域。是一种使用低维数据表达高维度数据的方法
支持流形学习有效的证据是：
1. 数据的概率分布是高度集中的
2. 数据总可以变换到其他同类数据(其邻域)