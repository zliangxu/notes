<!-- ## 余弦定理 -->
## 点积(又称为数量积，接受两个向量返回一个标量值；在欧几里得空间称为内积)

$$\vec{a}\cdot \vec{b}=|\vec{a}|*|\vec{b}|*cos(\theta)$$
$\vec{a}$在$\vec{b}$上的投影长度为：

$$\vec{a} \cdot \frac{\vec{b}}{|\vec{b}|}=|\vec{a}|*cos(\theta)$$



## 仿射变换
[马同学](https://www.zhihu.com/search?type=content&q=%E4%BB%BF%E5%B0%84%E5%8F%98%E6%8D%A2)  
仿射变换 = 线性变换(旋转和拉伸) + 平移， 对应的数学公式为

$$\vec{y}=A\cdot\vec{x}+\vec{b}$$ (1)
- **线性变换 $\vec{y}=A\cdot \vec{x}$ 只有矩阵乘法**  
线性变化有如下3条属性：  
    1. 直线经过变换后依旧是直线  
    2. 并且比例不变  
    3. 原点不变    

- 平移不是线性变换而是仿射变换  
- 可以通过增加一个维度来使仿射变换表示线性变换(线性变换只有乘法没有加法) 

$$\begin{bmatrix}\vec{y} \\ 1\end{bmatrix}= \begin{bmatrix} A &\vec{b} \\ 0 & 1\end{bmatrix} \cdot \begin{bmatrix} \vec{x} \\ 1 \end{bmatrix}$$ (2)