numerical computation
-----

## 上溢、下溢
下溢指将一个非常接近0的数看做0；  
上溢指一个非常大的数超出了有限精度表示的范围，被看做了一个$\infty$ 符号  
对于softmax，解决方法如下式，这样会保证分母有1，从而不会下溢；并且分子最大值为1，会保证不会上溢；但分子仍会下溢。  

$$z=x-max(x_i)$$
softmax

$$softmax(x)_i=\frac{exp(x_i)}{\sum{exp(x_j)}}$$

## 矩阵的条件数(condition number)

$$_{i,j}^{max} \left| \frac{\lambda_i}{\lambda_j} \right|$$
它的大小表征了矩阵输入变化与输出变化量的大小关系。

## 基于梯度的优化
输入是向量、输出是标量的函数的梯度，是偏导数组成的向量，记作：

$$\nabla x f(x)$$
上式是一个向量，每一个元素是$f(x)$对每一个变量的偏导数  
最速下降法

$$x'=x-\epsilon * \nabla x f(x)$$

## 梯度之上：jacobian and hessian matrix
输入是向量、输出是向量的函数的导数，是**jacobian**矩阵

$$J_{i,j}=\frac{\partial}{\partial x_j}f(x)_i$$
当输入是向量、输出是标量的函数的二次导数，是**hessian**矩阵

$$H(f(x))_{i,j}=\frac{\partial ^2}{\partial x_i \partial x_j}f(x)$$
上式中，偏导数的顺序是可交换的。

牛顿法是利用二阶泰勒展开式直接求解最优值的方法，而梯度下降仅仅使用了梯度的性质，即沿着梯度相反的方向，函数值会下降。  
牛顿法适合方程是正定的情况，即临界点是最小值点，而不是鞍点的情况。

仅使用梯度信息的优化算法被称为一阶优化算法，如梯度下降；使用hessian矩阵的优化算法称为二阶最优化算法，如牛顿法。

lipschitz continuity(利普希茨连续条件)

$$\forall x,\forall y,\left| f(x)-f(y) \right| \leqslant L||x-y||_2$$
其中，$L$称为lipschitz constant(利普希茨常数)，它的意义在于保证了，当给输入加了一个较小的扰动后，输出的变化量也较小。

## 约束优化问题
拉格朗日对偶，KKT条件  
凸优化一般针对矩阵为正定、半正定时才会有作用
