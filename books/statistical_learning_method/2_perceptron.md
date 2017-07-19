仅对线性可分数据有效
## 模型
模型是一个超平面，w是超平面法向量，b是超平面的截距
$$w\cdot x+b=0$$
分类函数
$$f(x)=sign(w\cdot x+b)$$
$sign(x)$是符号函数，定义式如下：
$$sign(x)=\begin{cases}
1 &\text{if }x\geqslant0   \\
-1 &\text{if }x<0
\end{cases}$$
## 策略
所有误分类点到超平面的函数距离之和
$$L(w,b)=-\frac{1}{||w||}\sum_{x_i\in M}y_i(w\cdot x_i+b)$$
## 算法
梯度下降
