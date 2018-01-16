# Batch Normalization: Accelerating Deep Network Training by Reducing Internal Covariate Shift  2015

## abstract
把训练过程中，网络中间层输入数据分布的改变(因为前层网络参数随着反向传播变化，导致本层网络的输入数据的分布发生变化)称为:"Internal Covariate Shift"  
为解决这个问题，提出BN结构，并使其称为网络模型中的一部分，对每一个输入batch做标准化。
- 使用BN层，可以提高学习率
- 参数初始化不再那么重要
- 有规则化作用，从而可以省去dropout层
使用bach-normalized networks的集成，在ImageNet上得到了超过人的分类准确率。

## introduction
使用mini-batch gradient descent 与 stochastic gradient descent相比的优点  
- 随着batch_size的增大，梯度估计会更准确
- batch能够并行化，从而使计算更高效。  

当一个学习系统的输入分布变化时，称为covariate shift，以往使用domain adaption解决。  
internal covariate shift就是对系统输入到子系统输入的推广，作者提出batch normalization来解决这个问题，它能够标准化输入从而称为均值为$0$、方差为$1$的输入，而且，BN对梯度反向传播也有作用，减少了梯度对参数大小及初始值的依赖？

## towards reducing internal covariate shift
通过修改网络或修改优化算法的参数。**看的不太懂**

## normalization via mini-batch statics
两个简化
1. 使用标准化替代白化，假设一层网络的输入为$d$维向量，$x=(x^{(1)},x^{(2)}......x^{(d)})$
> $$\hat x_k = \frac{x^{(k)}-\bold{E}[x^{(k)}]}{\sqrt{Var[x^{(k)}]}} \quad \text{标准化}$$
然而标准化操作会改变一层的表达能力，如sigmoid函数，如果它的输入被标准化，那么它的输出只分布在sigmoid线性部分，即要保证插入的层能够表示identity 变换，由此，添加变换 
> $$y^{(k)}=\gamma^{(k)} x^{(k)}+\beta ^{(k)}$$
当$\gamma^{k}=Var[x^{(k)}]$，$\beta^{(k)}=\bold{E}[x^{(k)}]$时，相当于identity变换(没有变换)  
2. 在mini-batch内计算均值与标准差

算法1
> $$\mu_B \leftarrow \frac{1}{m}\sum_i^m x_i\quad\text{mini-batch mean}$$ (1)
> $$\sigma_B^2 \leftarrow \frac{1}{m}\sum_i^m (x_i - \mu_B)^2\quad\text{mini-batch variance}$$(2)
> $$\hat x_i \leftarrow \frac{x_i-\mu_B}{\sqrt{\sigma_B^2 +\epsilon}}\quad\text{normalize}$$(3) 
> $$y_i \leftarrow \gamma\hat x_i+\beta \quad \text{scale and shift}$$ (4)
求导部分
### training and inference with batch-normalised networks
预测时，使用整个训练集的均值和方差
> $$\hat x=\frac{x-\bold{E}(x)}{\sqrt{Var[x]+\epsilon}}$$
在算法2中有$\bold{E[x]}$，$Var[x]$的计算公式
> $$\bold{E}[x]\leftarrow \bold{E}_B[\mu_B]$$
> $$Var[x]\leftarrow \frac{m}{m-1}\bold{E}_B[\sigma_B^2]$$
### batch-normalized convolutional networks
在非线性激活函数之前加BN层，这样添加能够输出更稳定的响应。
对于$Wx+b$
BN层前面的偏置参数的作用，被BN层归一化时抵消掉了

### batch-normalization enables higher leraning rate

# tips
没有找到$\gamma,\beta$是如何初始化的