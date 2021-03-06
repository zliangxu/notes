# mixture models and EM 
引入潜变量是为了让复杂的边际分布能够被简单的概率分布组合出来，从而简化计算。本章的高斯混合模型引入的是离散隐变量，第$12$章会介绍引入连续隐变量的模型。

## K-means clustering
K-means的求解就是用到了EM算法的迭代思想，由于K-means需要同时求解聚类中心及每个样本的类别，使用迭代思想求解步骤如下，
1. 任意初始化聚类中心的值
2. 然后以此值计算每个样本所属类别(在K-means背景下，这一步叫 M step)，
3. 根据样本所属类别求各类别聚类中心(在K-means背景下，这一步叫 E step)，由于第k类中心的解是所有属于第$k$类样本的均值，所以称为K-means。
4. 重复2. 3. 步骤直至收敛。

数据预处理 标准化，是对数据的线性变换，使$0$均值，单位方差。

K-medoids算法是对K-means算法通用化，K-means一般使用距离度量函数(欧氏距离)来对样本聚类，而K-medoids是通用的不相似度$\mathcal V(x_n,\mu_k)$函数，它同时可以对样本内的类别数据进行计算，而聚类中心通常可以选择那一类的其中一个样本，而不再是计算出来的均值。

##  mixtures of guassian
[笔记 ref from](https://book.douban.com/annotation/28457881/)
```
作者在26页中提到用极大似然法确定分布中的未知参数可以理解为给定参数后使样本的概率最大化。而更自然的想法是给定样本后使参数的概率最大化，即使用贝叶斯方法得到参数的后验分布，再使其最大化。
```
### 使用极大似然估计求解混合高斯分布的问题
1. 奇异问题？  
在只有一个高斯分量时，若均值等于一个样本点$x_j$，虽然随着方差趋于$0$，似然函数中与$x_j$的项趋于无穷大；但是对于其它不等于均值的样本点，它们在似然函数中的项会趋向于$0$，因为随着方差趋于$0$，高斯分布的指数项会趋于$0$，而不严格的说，指数衰减是比$\frac{1}{\sqrt{2\pi\sigma^2}}$增长的快的，也就是在两个趋于无穷的综合作用下，这些点的概率会趋于$0$。而似然函数是所有样本点概率的乘积，所以似然函数会趋于$0$而不是无穷大。  
但是一旦模型中存在两个高斯分量时，其中一个高斯分量方差正常，产生的概率分布也正常；而另一个高斯分量由于均值与一个样本点$x_j$重合，导致$x_j$趋于无穷大的概率，两个高斯分量相加后，概率依然趋于无穷大；而其它样本点，一个高斯分量概率分布正常，另一个高斯分量会趋于$0$，那么在两个高斯分量相加后，这样的样本点是正常值的，不会趋于$0$。那么，最后的混合分布的似然函数是所有样本点概率的乘积，会趋向于无穷大，这对于极大似然估计中求极大值来说是病态的？
2. identifiability   
会有$k!$个相同的解，那么也就不能直接求导，求极值？

### 使用最大期望估计混合高斯分布
EM是求解带有隐变量模型的极大似然解的有效算法。  
协方差矩阵$\Sigma$是半正定和对称矩阵，所以$\Sigma^T=\Sigma$，$\Sigma^{-1}$？  
EM往往需要更多迭代次数，所以可以使用K-means来求解EM算法的初始值，来开始迭代过程。
EM算法并不能保证找到全局最优解。  
### **EM算法**
1. 初始化$\mu_k$，$\sigma_K$，$\pi_k$，计算初始对数似然函数的值
2. E step，计算后验概率($z_{nk}$是$x_n$来自隐变量$z_k$的条件概率)
> $$\gamma(z_{nk})=\frac{\pi_k\mathcal{N}(x_n|\mu_k,\Sigma_k)}{\sum_{j=1}^K \pi_k\mathcal{N}(x_n|\mu_j,\Sigma_j)}$$
3. M step，更新参数值
> $$\begin{aligned} \mu_k^{new} &= \frac{1}{N_k}\sum_{n=1}^{N}\gamma(z_{nk})x_n \\
\Sigma_k^{new} &= \frac{1}{N_k}\sum_{n=1}^{N}\gamma(z_{nk})(x_n-\mu_k^{new})(x_n-\mu_k^{new})^T \\
\pi_k^{new} &=\frac{N_k}{N}\end{aligned}$$
其中
> $$N_k=\sum_{n=1}^{N}\gamma(z_{nk})$$
4. 计算对数似然函数值，判断值的改变量是否小于阈值

## the EM algorithm in general[讲得很深]

## tips

### 奇异[ref from zhihu](https://www.zhihu.com/question/35318893)
```
数学上，“奇异”（singular）一词用来形容破坏了某种优良性质的数学对象。
对于矩阵来说，“可逆”是一个好的性质，不可逆的矩阵就称为“奇异”矩阵。
```

### 退化[ref from zhihu](https://www.zhihu.com/question/54143347/answer/144667152)
```
一个复杂的东西在某种条件下变成一个简单的东西，就叫「退化」。这并不是线性代数特有的概念。
比如，一个一元二次方程，在二次项系数为零时，就退化成一元一次方程。
又如，椭圆在离心率为零时退化成圆。再如，向量的内积，在向量只有一维的时候，就退化成标量乘法。
再再如，矩阵的若当标准形，在矩阵对称的时候（这是个充分非必要条件），退化成对角阵。
```
