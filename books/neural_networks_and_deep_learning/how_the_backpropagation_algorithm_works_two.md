[how the backpropagation algorithm works](http://neuralnetworksanddeeplearning.com/chap2.html)
-------
梯度下降算法是一种优化算法，它需要求解梯度，反向传播算法是一种求解梯度的算法，把神经网络后面层的梯度传向前面的网络。  
backpropagation的本质是关于改变一个神经网络的权值和偏置会如何影响代价函数的方法，也就是代价函数关于参数的偏微分，梯度。  

**backpropagation : an algorithm for computing gradients，一个快速的计算代价函数梯度的算法**

### 1. warm up: a fast matrix-based approach to computing the output from a neural network 
参数的定义   
- $w_{jk}^l$表示$w^l$的第j行、第k列，具体意义是第$l-1$层的第k个神经单元与第$l$层的第j个神经单元之间的权重系数  
- $b_j^l$表示第$l$层的第j单元的偏置   

神经网络激励函数的向量化
- 网络层之间激励的传播 
> $$a^l=\sigma(w^la^{l-1}+b^l)$$(25) 
- 中间值，网络层之间用权值加偏置之后的输入
> $$z^l\equiv w^la^{l-1}+b^l$$(25.1)  
### 2. the two assumptions we need about the cost function
反向传播(backpropagation)的目的是为了计算代价函数的梯度。  
对于backpropagation能够起作用用的前提是两个假设：
- 代价函数可以写成平均的形式，因为backpropagation需要的是对单独一个训练数据求偏微分，而我们的是求所有训练样本代价函数的偏微分和然后做平均的形式。
- 神经网络的代价函数可以写成一个以神经网络的输出为变量的函数。

### 3. the hadamard product  s圈点t
向量元素相乘的形式
### 4. the four fundamental equations behind backpropagation
- 代价函数  
![math6](../image/math6.png)  

- 假设在第l层、第j神经元的输入上有一个误差$\Delta Z^{l}_j$， 通过之后神经网络的传递，最后造成的代价函数上的误差为(**这是微积分推导？？？为什么，这就是？？展开，是泰勒展开式**)  
> $$\frac{\partial C}{\partial z_j^l}\Delta z_j^l$$
- 根据上式，由于$\Delta Z^{l}_j$基本是一个比较小的值，所以误差的大小基本取决于上式的左部分，这样可以有如下定义，第l层、第j神经元的误差的定义  
> $$\delta_j^l\equiv\frac{\partial C}{\partial z_j^l}$$(29)
- BP4公式  
BP1表示输出层即第L层的误差  
![bp4summary](../image/bp4summary.png)

### 5. proof of the four fundamental equations(optional，指选择性的证明，而不是可以选择性的看)
- BP2的证明，**为什么是和的形式**  
这一层的某一个神经元的误差$\delta_j^l$传递给下一层所有的神经元，因为代价函数是下一层所有神经元输出的函数，所以采用和的形式。    
![math41](../image/math41.png)  
(上面的公式就是链式法则，至于41式，如果把左侧分母与右侧分子抵消掉，则变量k消失，那么求和符号也会消失，所以和原式是等价的)  
![math45](../image/math45.png)

### 6. the backpropagation algorithm
### 7. the code for backpropagation
### 8. in what sense is backpropagation a fast algorithm
### 9. backpropagation:the big picture

