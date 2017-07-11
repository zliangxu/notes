softmax回归模型是logistic回归模型在多分类上的推广，具体的
[blog](http://eli.thegreenplace.net/2016/the-softmax-function-and-its-derivative/)
## tip
- 上标和下标的区别？？  
    上标是第几个样本，下标是样本数据的第几个特征。？？
- logistic回归是针对二分类问题的。
## logistic回归
- 假设函数($\theta$是模型参数，是列向量，x也是列向量)
$$h_{\theta}(x^i)=\frac{1}{1+exp(\theta^{T}x^i)}$$
- 代价函数(这里为什么要对代价取平均???)
$$J(\theta)=-\frac{1}{m}[\sum_{i=1}^{m}(y^i*log(h_{\theta}(x^i)+(1-y^i)*log(1-h_{\theta}(x^i))))]$$

## softmax回归
- 假设函数($\theta$是一个k*(n+1)的矩阵，k指类别数，n+1指每个样本的特征数n维并加上偏置项)
$$h_{\theta}(x^i)=\begin{bmatrix} p(y^i=1|x^i;\theta) \\ p(y^i=2|x^i;\theta) \\...\\ p(y^i=k|x^i;\theta)\end{bmatrix}=\frac{1}{\sum_{j=1}^{k}exp(\theta_j^Tx^i)} \begin{bmatrix} exp(\theta_1^Tx^i) \\ exp(\theta_2^Tx^i) \\ ... \\ exp(\theta_k^Tx^i) \end{bmatrix}$$(1)
其中  
$$p(y^i=k|x^i;\theta)=\frac{exp(\theta_k^Tx^i)}{\sum_{j=1}^{k}exp(\theta_j^Tx^i)}$$(2)
上式是对概率进行了归一化的，这就造成了参数冗余，可以证明$\theta$与参数$\theta-\psi$的结果是一致的，可以使用权重衰减使代价函数成为凸函数，解唯一。  
- 代价函数
$$J(\theta)=-\frac{1}{m}[\sum_{i=1}^{m}\sum_{j=1}^{k}(sign(y^i=j)*log(p(y^i=j|x^i;\theta)))]$$
## 关系
由于数据冗余，当$\psi=\theta_1$时，两者的代价函数与假设函数一致