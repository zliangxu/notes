softmax回归模型是logistic回归模型在多分类上的推广，具体的  
[blog](http://eli.thegreenplace.net/2016/the-softmax-function-and-its-derivative/)  
[neural networks and deep learning](http://neuralnetworksanddeeplearning.com/chap3.html#the_cross-entropy_cost_function)  
(回到了起点！！！)  
## tip
- 上标和下标的区别？？  
    上标是第几个样本，下标是样本数据的第几个特征。？？
- logistic回归是一种分类方法，包括二项logistic回归、多项logistic回归。
## 二项logistic回归
- 假设函数($\theta$是模型参数，是矩阵，$x^i$是列向量，表示数据集中第i个样本)
> $$h_{\theta}(x^i)=\frac{1}{1+exp(\theta^{T}x^i)}$$
- 代价函数，可以再加权重衰减项
> $$J(\theta)=-\frac{1}{m}[\sum_{i=1}^{m}(y^i*log(h_{\theta}(x^i)+(1-y^i)*log(1-h_{\theta}(x^i))))]$$

## 多项logistic回归
> $$h_{\theta}(y^i=k|x^i) = \begin{cases}\frac{exp(\theta_k^Tx^i)}{1+\sum_{j=1}^{K-1}exp(\theta_j^Tx^i)} &\text{ if } k=1,2,3...,K-1  \\
 \frac{1}{1+\sum_{j=1}^{K-1}exp(\theta_j^Tx^i)} &\text{ if }k=K\end{cases}$$
## softmax回归
- 假设函数($\theta$是一个k*(n+1)的矩阵，k指类别数，n+1指每个样本的特征数n维并加上偏置项)
> $$h_{\theta}(x^i)=\begin{bmatrix} p(y^i=1|x^i;\theta) \\ p(y^i=2|x^i;\theta) \\...\\ p(y^i=k|x^i;\theta)\end{bmatrix}=\frac{1}{\sum_{j=1}^{k}exp(\theta_j^Tx^i)} \begin{bmatrix} exp(\theta_1^Tx^i) \\ exp(\theta_2^Tx^i) \\ ... \\ exp(\theta_k^Tx^i) \end{bmatrix} = \begin{bmatrix}p1 \\ p2 \\...\\p_k \end{bmatrix}$$(1)
其中$p(y^i=j|x^i;\theta)$表示将$x^i$分类为$j$的概率  
> $$p(y^i=j|x^i;\theta)=\frac{exp(\theta_j^Tx^i)}{\sum_{j=1}^{k}exp(\theta_j^Tx^i)}$$(2)
上式是对概率进行了归一化的，这就造成了参数冗余，可以证明$\theta$与参数($\theta-\psi$)的结果是一致的，可以使用权重衰减使代价函数成为严格的凸函数，解唯一。  
- 代价函数(softmax cross entropy)   
代价函数应该是一个标量，不是矩阵
> $$J(\theta)=-\frac{1}{m}[\sum_{i=1}^{m}\sum_{j=1}^{k}(I(y^i=j)*log(p(y^i=j|x^i;\theta)))]$$
$I(y^i)$为指示函数，表示$j=y^i$时，为$1$
- softmax求导  
可以对每一个样本单独求导，最后做平均
> $$J(\theta,x^i,y^i)=-\sum_{j=1}^{k}(I(y^i=j)*log(p(y^i=j|x^i;\theta)))$$
假设$y^i=m$，即label为$m$，令$z_j=\theta_j^Tx^i$，则上式可以化简为
> $$J(\theta,x^i,y^i)=-log(p(y^i=m|x^i;\theta))=-log(\frac{exp(z_m)}{\sum_{l=1}^{k}exp(z_l)})$$
对上式求导得，这部分就是残差$\delta _t$
> $$\begin{aligned}
\frac{\partial J(\theta,x^i,y^i)}{\partial z_t}&=-\begin{cases}
1-\frac{exp(z_m)}{\sum_{l=1}^{k}exp(z_l)} = 1-p_m &\text{if  } t=m\\
\frac{exp(z_t)}{\sum_{l=1}^{k}exp(z_l)} = p_t &\text{if  } t{=}\llap{/\,}m \end{cases} \\
&=-[I(t=m)-\frac{exp(z_t)}{\sum_{l=1}^{k}exp(z_l)}] 
\end{aligned}$$
应该注意
> $$\frac{\partial z_j}{\partial \theta_j}=(x^i)^T$$


## 关系
由于数据冗余，当$(2)$式中，$\psi=\theta_K$时，多项logistic回归与softmax的代价函数与假设函数一致

