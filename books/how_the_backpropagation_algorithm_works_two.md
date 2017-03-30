[how the backpropagation algorithm works](http://neuralnetworksanddeeplearning.com/chap2.html)
-------
梯度下降算法是一种优化算法，它需要求解梯度，反向传播算法是一种求解梯度的算法。  
backpropagation就是关于改变一个神经网络的权值系数和偏置是如何改变代价函数的方法，也就是代价函数关于参数的偏微分，梯度。  

**backpropagation : an algorithm for computing gradients，一个快速的计算代价函数梯度的算法**

### 1. warm up: a fast matrix-based approach to computing the output from a neural network
神经网络激励函数的向量化  
- 网络层之间激励的传播  
![math25](../image/math25.png)  
- 中间值，网络层之间用权值加偏置之后的输入  
![math251](../image/math251.png)
### 2. the two assumptions we need about the cost function
反向传播(backpropagation)的目的是为了计算代价函数的梯度。  
对于backpropagation能够起作用用的前提是两个假设：
- ？？代价函数可以写成平均的形式，因为backpropagation需要的是对单独一个训练数据求偏微分，而我们的是求所有训练样本代价函数的偏微分和然后做平均的形式。
- 神经网络的输出可以写成一个函数的输出。

### 3. the hadamard product  s圈点t
### 4. the four fundamental equations behind backpropagation
backpropagation就是关于改变一个神经网络的权值系数和偏置是如何改变代价函数的方法，也就是代价函数关于参数的偏微分，梯度。  

- 代价函数  
![math6](../image/math6.png)  

- BP的四个基本等式  
![bp4](../image/bp4.png)
