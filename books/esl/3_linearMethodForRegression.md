# linear methods for regression

## introduction
signal to noise(SNR，信噪比)：定义为信号强度与噪声强度的比率。
> $$SNR=\frac{P_{signal}}{P_{noise}}=\frac{A_{signal}^2}{A_{noise}^2}$$
其中，$P$表示功率(power)，$A$表示幅度(amplitude)  
对输入做线性变换的推广方法叫做basis-function methods。

## linear regression models and least squares
RSS: Residual Sum-of-Squares  
训练集用$\bold{X}$表示，它是一个$N\times (p+1)$的矩阵，$N$表示样本数，$p$表示每一个样本的维度，这样$\bold{X}$的每一行表示一个样本。

## subset selection
[wiki](https://en.wikipedia.org/wiki/Feature_selection)  
是从输入特征集合中选出一个子集作为样本特征，相对的，feature extraction是从原始输入特征中，造出新的特征。
## shrinkage methods
[otexts](https://www.otexts.org/1551)  
应该就是指规则化。