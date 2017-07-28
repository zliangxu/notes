逻辑斯谛回归和最大熵模型
------
## tips
s.t. : subject to 服从于
## 最大熵模型
熵是混乱度的表示，不要把鸡蛋放在一个篮子里就是最大熵原理。----吴军<数学之美>  
在满足已知条件下，让条件概率分布的熵最大

## 拉格朗日对偶
主要把限制条件带入优化函数中()；其次把原始问题转换为对偶问题，方便求解最优值。
- 原始问题(原始最优化问题)
$$\begin{aligned} & _{x\in R^n}^{min} &f(x)  \\
&s.t. &c_i(x) \leqslant0, & i=1,2,...,k \\
& &h_j(x)=0, & j=1,2,...l\end{aligned} $$     
引进拉格朗日函数得
$$L(x,\alpha,\beta)=f(x)+\sum_{i=1}^k \alpha_ic_i(x)+\sum_{j=1}^{l} \beta_jh_j(x)$$
其中，$x\in R^n$，$\alpha_i$、$\beta_j$是拉格朗日乘子，$\alpha_i \geqslant 0$。
- 对偶问题
- 原始问题与对偶问题的关系
- KKT条件
## 改进的迭代尺度算法(Improved Iterative Scaling,IIS)
## 拟牛顿法


