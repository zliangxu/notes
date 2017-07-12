softmax回归模型是logistic回归模型在多分类上的推广，具体的  
[blog](http://eli.thegreenplace.net/2016/the-softmax-function-and-its-derivative/)
## tip
- 上标和下标的区别？？  
    上标是第几个样本，下标是样本数据的第几个特征。？？
- logistic回归是针对二分类问题的。
## logistic回归
- 假设函数($\theta$是模型参数，是矩阵，$x^i$是列向量，表示数据集中第i个样本)
$$h_{\theta}(x^i)=\frac{1}{1+exp(\theta^{T}x^i)}$$
- 代价函数，可以再加权重衰减项
$$J(\theta)=-\frac{1}{m}[\sum_{i=1}^{m}(y^i*log(h_{\theta}(x^i)+(1-y^i)*log(1-h_{\theta}(x^i))))]$$

## softmax回归
- 假设函数($\theta$是一个k*(n+1)的矩阵，k指类别数，n+1指每个样本的特征数n维并加上偏置项)
$$h_{\theta}(x^i)=\begin{bmatrix} p(y^i=1|x^i;\theta) \\ p(y^i=2|x^i;\theta) \\...\\ p(y^i=k|x^i;\theta)\end{bmatrix}=\frac{1}{\sum_{j=1}^{k}exp(\theta_j^Tx^i)} \begin{bmatrix} exp(\theta_1^Tx^i) \\ exp(\theta_2^Tx^i) \\ ... \\ exp(\theta_k^Tx^i) \end{bmatrix}$$(1)
其中$p(y^i=j|x^i;\theta)$表示将$x^i$分类为$j$的概率  
$$p(y^i=j|x^i;\theta)=\frac{exp(\theta_j^Tx^i)}{\sum_{j=1}^{k}exp(\theta_j^Tx^i)}$$(2)
上式是对概率进行了归一化的，这就造成了参数冗余，可以证明$\theta$与参数($\theta-\psi$)的结果是一致的，可以使用权重衰减使代价函数成为严格的凸函数，解唯一。  
- 代价函数  
代价函数应该是一个标量，不是矩阵
$$J(\theta)=-\frac{1}{m}[\sum_{i=1}^{m}\sum_{j=1}^{k}(I(y^i=j)*log(p(y^i=j|x^i;\theta)))]$$
- softmax求导  
可以对每一个样本单独求导，最后做平均
$$J(\theta,x^i,y^i)=\sum_{j=1}^{k}(I(y^i=j)*log(p(y^i=j|x^i;\theta)))$$
假设$y^i=m$，令$z_j=\theta_j^Tx^i$，则上式可以化简为
$$
J(\theta,x^i,y^i)=log(p(y^i=m|x^i;\theta))=log(\frac{exp(z_m)}{\sum_{l=1}^{k}exp(z_l)})$$
对上式求导得
$$\begin{aligned}
\frac{\partial J(\theta,x^i,y^i)}{\partial z_t}&=\begin{cases}
1-\frac{exp(z_m)}{\sum_{l=1}^{k}exp(z_l)} &\text{if  } t=m\\
- \frac{exp(z_m)}{\sum_{l=1}^{k}exp(z_l)}&\text{if  } t{=}\llap{/\,}m \\
\end{cases} \\
&=I(t=m)-\frac{exp(z_m)}{\sum_{l=1}^{k}exp(z_l)} \\
\end{aligned}$$


## 关系
由于数据冗余，当$\psi=\theta_1$时，两者的代价函数与假设函数一致

