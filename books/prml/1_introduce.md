# introduce

## probability theory
两个规则
1. 求和规则(sum rule)  
由联合概率求边缘概率(marginal probability)
> $$p(X=x_i)=\sum_{j=1}^{L}p(X=x_i,Y=y_j)$$
2. 求积规则  
条件概率($p(Y=y_j|X=x_i)$)
> $$p(X=x_i,Y=y_h) = p(Y=y_j|X=x_i) \cdot p(X=x_i)$$

上面的表示过于复杂，这里对其进行简化。  
对于$p(B)$，这里$B$是一个变量，那么$p(B)$表示$B$的概率分布。对于$p(r)$，其中$r$是变量$B$的一个取值，即$p(r)$就表示一个$p(B)$概率分布下取$r$值时的概率。
> $$p(X)=\sum_Y p(X,Y) \quad \text{Sum rule}$$
> $$p(X,Y)=p(Y|X)p(Y) \quad \text{Product rule}$$
> $$p(a,b|c)=p(a|b,c)\cdot p(b|c) \quad \text{Product rule的变形}$$ 

对求积规则，根据交换律可得下式
> $$p(Y|X)=\frac{p(X|Y)p(Y)}{p(X)}$$
对$p(X)$使用求和规则，可得贝叶斯定理
> $$p(Y|X)=\frac{p(X|Y)p(Y)}{\sum_Y \left[ {p(X|Y)p(Y)} \right] }$$
### 概率密度
### 高斯分布
> $$\mathcal N(x|\mu,\sigma^2)=\frac{1}{\sqrt{2\pi\sigma^2}}\exp  \{-\frac{(x-\mu)^2}{2\sigma^2} \}$$
$\beta=\frac{1}{\sigma^2}$称为精度(precision).   

高斯分布的方差的极大似然估计是有偏估计，证明见deep learning
> $$\sigma_{ML}^2=\frac{1}{N}\sum_{n=1}^N(x_n-\mu_{ML})^2$$
可以对极大似然估计的方差进行修正
> $$\tilde\sigma^2=\frac{N}{N-1}\sigma_{ML}^2$$

> $$p(w|x,t,\alpha,\beta)=\frac{p(t,w|x,\alpha,\beta)}{p(t)}=\frac{p(t|x,w,\beta)\cdotp(w|\alpha)}{p(t)}$$(1.66)
曲线回归在假设误差符合高斯正态分布的情况下，模型$w$参数的最大后验概率估计等价于正则化后的均方误差最小化方法。

## information theory
