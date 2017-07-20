光流
-----
## 光电鼠标使用的技术叫做 digital image correlation.
- cross-correlation  
用于表示两幅图像灰度之间的相似度大小

### 光流原理
- 亮度守恒公式
$$\begin{aligned}
I(x,y,t)&=I(x+\Delta x, y+\Delta y, t+\Delta t) \\
&=I(x,y,t)+\frac{\partial I}{\partial x}\Delta x+\frac{\partial I}{\partial y}\Delta y+\frac{\partial I}{\partial t}\Delta t+\epsilon
\end{aligned}$$
由上式可得：
$$\frac{\partial I}{\partial x}\Delta x+\frac{\partial I}{\partial y}\Delta y+\frac{\partial I}{\partial t}\Delta t=0$$
公式两边同除以$\Delta t$得：
$$\frac{\partial I}{\partial x}V_x+\frac{\partial I}{\partial y}V_y+\frac{\partial I}{\partial t} = 0$$
这可以写成：
$$I_xV_x+I_yV_y=-I_t$$
或者:
$${\nabla I}^T*\vec{V}=-I_t$$
这个方程具有两个变量，所以是欠拟合的，这里讲是具有孔径问题，需要添加其它约束来求解。

## 1. Iterative Lucas Canade
由于孔径问题的存在，这里加了一个约束、局部运动一致性，即在一个小窗口内的像素的运动量是相同的。  
使用牛顿法又称为(newton method, newton-raphson fashion)方法迭代求解   
- essay  
Pyramidal Implementation of the Lucas Kanade Feature Tracker Description of the algorithm  
最大有效移动距离，应该是选择计算hessian矩阵窗口的大小，
## 2. simple flow


## 3. 光流李平
- essay  
论文在百度云->slam  
Robust Sensing and Control of Micro Aerial Vehicles using a Monocular Camera and an Inertial Measurement Unit
- robust template matching   
首先对灰度图像做处,公式为ISC(Incremental Sign Correlation)  
$$I_b(x,y)=\begin{cases} 
1 & \text{if } I(x,y+1)>I(x,y),\\
0 & \text{otherwise}.
\end{cases}$$
代价函数(匹配规则，NNMP，the Number of Non-Matching Points)
$$NNMP(x,y)=\sum_{m=-l}^{l}\sum_{n=-l}^{l}I_b(x,y,t) \otimes I_b(x+m+u,y+n+v,t-1) $$
其中，$\otimes$为异或符号，(u,v)为运动量。  
上面公式的实现，可以使用查找表，可以参见论文。
- Roubust Lucas Kanade  
对图像做了个变换再进行LK算法，变换公式
$$I_b(x,y)=\begin{cases}
max &\text{if } I(x+m,y+n)>I(x,y),\\
min &\text{otherwise}.
\end{cases}$$

## 4. px4flow
size: 188*120  
包含了两种方法块匹配和LK。
## 5. 快匹配
可以尝试下对二值化图像做快速匹配

## camera
ov7251


## tips
1. covariation matrix 协方差矩阵
2. opencv pyrlk算法函数(calcOpticalFlowPyrLK)