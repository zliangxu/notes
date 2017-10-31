## how learning differs from pure optimization
机器学习往往不是直接优化目标函数的，比如通过降低训练集的误差来降低测试集的误差，而optimization是直接的。
1. batch gradient methods ：指使用全部数据集估计梯度  
2. minibatch gradient methods ：指把数据集分成子集，然后用子集估计梯度
3. stochastic gradient methods :指只使用一个样本估计梯度，也称为 online gradient methods。(online 指从一个stream中获取到的样本，而不是一个固定大小的数据集，比如摄像机的在线标定，就是打开摄像头时，利用实时获取的图像进行标定，而不是离线的视频来做标定)

只进行一个epoch的训练才是无偏估计，即每个样本只使用一次。当训练集足够大时，不会发生过拟合，但是要多大，如何计算这个数值？

## challenges in neural network optimization

## Basic Algorithms
- Stochastic Gradient Descent   
batch gradient descent可以使用固定学习率，因为损失函数在接近最小值时，梯度几乎为0；而minibatch gradient descent要使用递减的学习率，因为minibatch是随机抽取的样本，会引入噪声，常见衰减公式如下：
> $$\epsilon_k=(1-\alpha)\epsilon_{0} + \alpha \epsilon_{\tau}, \qquad \alpha=\frac{k}{\tau}$$
- momentum  
![momentum](../../image/deeplearning/sgdmomentum.jpg)  
如图中所示，动量会增加梯度保持一个方向的运动，而减少有震荡方向的运动，原理就是把以前的速度都加在了一起
> $$v=\alpha v - \epsilon \nabla_\theta(\frac{1}{m} \sum_{i=1}^{m}L(f(x^{(i)}; \theta), y^{(i)})$$
> $$\theta \leftarrow \theta+v$$
- nerterov momentum  
是对标准momentum的改进，但是改进效果并不一定好

## parameter initialization strategies

## algorithms with adaptive learning rate
使用动量能够加速训练，但是它同时又引入了另一个参数。  
delta-bar-delta调整学习率的准则是，梯度符号保持不变时，增加这个方向的学习率，梯度符号变化时，减小这个方向的学习率，但是它只适合full batch optimization
- AdaGrad  
在凸优化中的表现较好，在部分网络模型中的效果好
- RMSProp  
- Adam
- Choosing the right optimization algorithm

## Approximate second-order methods

## Optimization strategies and meta-algorithm



