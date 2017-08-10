probability and information theory
----
## books recormendation
jaynes(2003)

## tips
variance 方差  
standard deviation 标准差

- frequentist probability:频率概率  
直接与事件发生的频率相联系
- bayesian probability:贝叶斯概率  
涉及到确定性的量化

概率质量函数(PMF、Probability Mass Function)的值是小于等于1的。  
概率密度函数(PDF、Probability Density Function)的值是可以大于1的。

协方差表示了两个变量之间的线性相关度，正值表示正相关，负值表示负相关。接近于0表示没有相关性。这个度量也和变量自身的尺度有关。
$$Cov(x,y)=E[(f(x)-E[f(x)]) * (f(y)-E[f(y)])]$$
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
$$\varkappa(x;\mu,{\sigma}^2)=\sqrt{\frac{1}{2 \pi {\sigma}^2}}exp(-\frac{(x-\mu)^2}{2{\sigma}^2})$$
其中， $\mu$ 是期望， $\sigma$ 是标准差，一种计算更简便的方式是令$\beta = \frac{1}{\sigma^2}$ 带入原方程。