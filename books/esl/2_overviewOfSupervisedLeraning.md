# overview of supervised learning
[标量对矩阵的求导，绝对值得细看](https://zhuanlan.zhihu.com/p/24709748)

## 数据类型
- quantitative variable 连续型变量
- qualitative variable 质变量、类别变量
- ordered categorical 如小、中、大
- dummy variable 哑变量，是量化了的质变量，即one-hot编码的形式就是
## 两个估计方法
最小二乘法对于结构有较强的假设，但是结果稳定；  
k-近邻法对于结构有较弱的假设，但是预测结果不稳定。
### 最小二乘法(least squares) 
目标函数，residual sum of squares，其中$y_i$是标量，$x_i$是列向量，$\beta$是线性模型参数，列向量:
> $$RSS(\beta)=\sum_{i=1}^N (y_i-x_i^T \beta)$$
目标函数的向量化表示，其中$\bold{y}$是列向量，$\bold{X}$是矩阵：
> $$\begin{aligned} RSS(\beta) &= \|\bold{y}-\bold{X}\beta \|_2 \\
&= (\bold{y}-\bold{X}\beta)^T(\bold{y}-\bold{X}\beta)\end{aligned}$$
```
若标量函数f是矩阵X经加减乘法、行列式、逆、逐元素函数等运算构成，则使用相应的运算法则对f求微分，再使用迹技巧给df套上迹并将其它项交换至dX左侧，即能得到导数。
```
为求$RSS(\beta)$对$\beta$的导数，先求方程的微分
> $$\begin{aligned} d RSS(\beta) &= d [(\bold{y}-\bold{X}\beta)^T(\bold{y}-\bold{X}\beta)] \\
&= d[(\bold{y}-\bold{X}\beta)^T] (\bold{y}-\bold{X}\beta) + (\bold{y}-\bold{X}\beta)^T d[(\bold{y}-\bold{X}\beta)] \\
&= [d(\bold{y}-\bold{X}\beta)]^T (\bold{y}-\bold{X}\beta) + (\bold{y}-\bold{X}\beta)^T (-\bold{X}d\beta) \\
&= [(-\bold{X}d\beta)]^T (\bold{y}-\bold{X}\beta) + (\bold{y}-\bold{X}\beta)^T (-\bold{X}d\beta) \\
&= tr[[(-\bold{X}d\beta)]^T (\bold{y}-\bold{X}\beta) + (\bold{y}-\bold{X}\beta)^T (-\bold{X}d\beta)] \qquad \text{对常数加迹，值不变} \\ 
&= tr[(\bold{y}-\bold{X}\beta)^T (-\bold{X}d\beta)] + tr[(\bold{y}-\bold{X}\beta)^T (-\bold{X}d\beta)] \qquad \text{根据迹的运算法则} \\
&= 2(\bold{y}-\bold{X}\beta)^T (-\bold{X}d\beta) \\ 
&= 2(\bold{X}\beta - \bold{y})^T (\bold{X}d\beta) \end{aligned}$$
根据微分方程与导数的关系，可得：
> $$\frac{\partial{RSS(\beta)}}{\partial \beta} = 2\bold{X}^T(\bold{X}\beta-\bold{y})$$
为求最优解，令$\frac{\partial{RSS(\beta)}}{\partial \beta} = 0$，如果$\bold{X}^T\bold{X}$非奇异，那么$\beta$有解析解
> $$\hat \beta = (\bold{X}^T\bold{X})^{-1}\bold{X}^T\bold{y}$$

### nearest-neighbor methods
> $$\hat Y(x) = \frac{1}{k} \sum_{x_i \in N_k(x)} y_i$$
## statistical decision theory
## local methods in high dimensions
## statistical models,
## structured regression model
## classes of restricted estimators
## model selection
