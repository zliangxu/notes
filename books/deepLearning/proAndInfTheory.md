probability and information theory
----
## books recormendation
jaynes(2003)   
cover and thomas(2006)  
mackay(2003)  


# probability theory
## tips
- expectation 期望  
    函数 $f(x)$ 关于某分布 $P(x)$ 的期望或期望值是指， 当 $x$ 由分布 $P(x)$ 产生， $f$ 作用于 $x$ 时， $f(x)$ 的平均值。
> $$\mathbb{E}_{x\sim P}[f(x)]=\sum_x P(x)f(x)$$
- variance 方差  
> $$Var(f(x))=\mathbb{E}[(f(x)-\mathbb{E}[f(x)])^2]$$
- standard deviation 标准差
- frequentist probability:频率概率  
    直接与事件发生的频率相联系
- bayesian probability:贝叶斯概率  
    涉及到确定性的量化

概率质量函数(PMF、Probability Mass Function)的值是小于等于1的。  
概率密度函数(PDF、Probability Density Function)的值是可以大于1的。

协方差表示了两个变量之间的线性相关度，正值表示正相关，负值表示负相关。接近于0表示没有相关性。这个度量也和变量自身的尺度有关。
> $$Cov(x,y)=E[(f(x)-E[f(x)]) * (f(y)-E[f(y)])]$$
相关系数是归一化后的衡量变量相关性的度量。

协方差为0并不表示两个变量独立，独立是一种更强的关系，而协方差只表示线性相关度。

## 离散概率分布
设掷一个k面的骰子n次。
- bernoulli distribution(伯努利分布、两点分布、0-1分布)  
伯努利试验是只有两种可能结果的单次随机试验(即n=1,k=2)。

- binomial distribution(二项分布)  
二项分布是n重伯努利试验成功次数的离散概率分布(即n>=2, k=2)。

- multinoulli distribution(又称为 categorical distribution、范畴分布)  
范畴分布(n=1, k>=2)

- multinomial distribution(多项分布)
多项分布是二项分布的推广(n>=2, k>=2)

## 连续概率分布
- normal distribution(正态分布、gaussian distribution、高斯分布)  
> $$\varkappa(x;\mu,{\sigma}^2)=\sqrt{\frac{1}{2 \pi {\sigma}^2}}exp(-\frac{(x-\mu)^2}{2{\sigma}^2})$$
其中， $\mu$ 是期望， $\sigma$ 是标准差，一种计算更简便的方式是令$\beta = \frac{1}{\sigma^2}$ 带入原方程。  
对于多维高斯分布，各向同性(isotropic)是指协方差矩阵可以表示为一个数字乘以单位矩阵得到的矩阵。

- exponential distribution(指数分布)
> $$p(x;\lambda)=\lambda 1_{x\geqslant0}exp(-\lambda x)$$
其中，$1_{\geqslant 0}$ 是指示函数，大于等于0时取值为1

- laplace distribution(拉普拉斯分布)  
> $$Laplace(x;\mu,\gamma)=\frac{1}{2\gamma}exp(-\frac{|x-\mu|}{\gamma})$$

- dirac distribution(狄拉克分布)  
> $$p(x)=\delta(x-\mu)$$
dirac delta funtion(狄拉克函数) 
> $$\delta(x)=\begin{cases} &+\infty, \text{  if  } x=0 \\
& 0, \text{  if  } x\rlap{\,/}{=}0
\end{cases}$$
狄拉克函数是广义函数，而generalized funtion(广义函数)是根据积分性质定义的对象

- empirical distribution(经验分布)  
经验分布指当我们在训练集上训练模型时，可以认为从这个训练集上得到的经验分布指明了采样来源的分布。它是训练数据的似然最大的那个概率密度函数？？  
对于连续型随机变量：$\hat{p}(x)=\frac{1}{m}\sum_{i=1}^m \delta(x-x^{(i)})$  
对于离散型随机变量：经验分布可以定义成multinoulli distribution(范畴分布)，它的概率可以简单的设为在训练集上那个输入值的经验频率。  

- mixture distribution(混合分布)
> $$P(x)=\sum_i P(c=i)P(x|c=i)$$
其中， $P(c=i)$ 是范畴分布，表示混合分布中各组件分布如何分布； $P(x|c=i)$ 表示一个组件分布。例如对于连续型随机变量，经验分布就是由狄拉克分布组成的混合分布，而多个组件狄拉克分布又符合范畴分布。  
一个比较常见的混合分布例子是高斯混合模型，它的每一个组件都是由特定均值、方差参数定义的高斯分布。高斯混合模型的参数指明了每个组件i的先验概率$\alpha_i=P(c=i)$，先验表明在观测到x之前传递给模型关于c的概率。同时，$P(c|x)$ 是后验概率，因为它是在观测到x之后进行计算的。

## 常用函数
- sigmoid function
> $$\sigma(x)=\frac{1}{1+exp(-x)}$$
- softplus function
> $$\varsigma=log(1+exp(x))$$

它是 $x^+=max(0,x)$ 的平滑版


## 连续型变量的技术细节
讲了一些悖论  
在高维空间中，微分运算扩展为**jacobian矩阵**的行列式。


# information theory
信息论的一个基本想法是一个不太可能发生的事件发生了，要比一个非常可能发生的事件发生，能提供更多信息。“今天早上太阳升起”包含的信息量就非常少，“今天早上有日食”包含的信息量就很丰富。

## 自信息(self-information)
1. 非常可能发生的事件包含的信息量要比较少，极端情况下，确保能够发生的事件没有信息量。
2. 较不可能发生的事件包含的信息量要较多。
3. 独立事件应具有增量的信息，如投掷硬币两次正面朝上提供的信息量要比投掷一次硬币正面朝上提供的信息量多。
满足上面三条性质，定义了自信息(self-information)的概念 
> $$I(x)=-logP(x)$$
其中，$log$是自然对数，以$e$为底数，单位是奈特(nats)。当以$2$为底数时，单位是比特(bit)或者香农(shannons)   
## 香农熵(shannon entropy、熵、信息熵)  
自信息是对单个可能事件发生信息的量化。香农熵(shannon entropy、熵)是对整个概率分布中的不确定性总量进行量化，是遵照这个分布的事件所产生的期望信息总量。
> $$H(x)=E_{x\thicksim P}[I(x)]$$
它给出了对依据概率$P$所生成的符号进行编码所需的比特数在平均意义上的下界(log的底数为2是，单位才是比特)  
对于均匀分布，因为它的多种可能都是等概率的发生，丝毫没有确定性可言，所以它包含的信息量最多。
## 微分熵(differential entropy)
当变量x是连续值时，香农熵被称为微分熵。
## KL散度(Kullback-Leibler divergence、relative entropy、相对熵、information divergence、信息散度、information gain、信息增益)
如果对于同一个随机变量x有两个单独的概率分布P(x)和Q(x)，可以使用散度来衡量这两个分布的差异。
> $$\begin{aligned} D_{KL}(P||Q)  &= E_{x\sim P}[log\frac{P(x)}{Q(x)}] \\ &=E_{x\sim P}[logP(x)-logQ(x)] \\ 
&=\sum_{i}P_i(x)[logP_i(x)-logQ_i(x)] 
&\end{aligned}$$
KL散度是非负的？？，当且仅当$P(x)$和$Q(x)$的分布相同时，KL散度为0，由吉布斯不等式证明。
> $$D_{KL}(P||Q)\rlap{\,/}{=}D_{KL}(Q||P)$$
## 交叉熵(cross-entropy)
> $$\begin{aligned}H(P,Q)&=H(P)+D_{KL}(P||Q) \\
&=-E_{x\sim P}logQ(x) 
\end{aligned}$$

# 图模型
