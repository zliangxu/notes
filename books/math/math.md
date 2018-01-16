<!-- ## 余弦定理 -->
## 点积(又称为数量积，接受两个向量返回一个标量值；在欧几里得空间称为内积)
> $$\vec{a}\cdot \vec{b}=|\vec{a}|*|\vec{b}|*cos(\theta)$$
$\vec{a}$在$\vec{b}$上的投影长度为：
> $$\vec{a} \cdot \frac{\vec{b}}{|\vec{b}|}=|\vec{a}|*cos(\theta)$$



## 仿射变换(affine)
由三个点确定的变换，即六个参数确定的变换  
[马同学对仿射变换的解释](https://www.zhihu.com/search?type=content&q=%E4%BB%BF%E5%B0%84%E5%8F%98%E6%8D%A2)  
仿射变换 = 线性变换(旋转和拉伸) + 平移， 对应的数学公式为
> $$\vec{y}=A\cdot\vec{x}+\vec{b}$$ (1)
- **线性变换 $\vec{y}=A\cdot \vec{x}$ 只有矩阵乘法**  
线性变化有如下3条属性：  
    1. 直线经过变换后依旧是直线  
    2. 并且比例不变  
    3. 原点不变    

- 平移不是线性变换而是仿射变换  
- 可以通过增加一个维度来使仿射变换表示线性变换(线性变换只有乘法没有加法) 
> $$\begin{bmatrix}\vec{y} \\ 1\end{bmatrix}= \begin{bmatrix} A &\vec{b} \\ 0 & 1\end{bmatrix} \cdot \begin{bmatrix} \vec{x} \\ 1 \end{bmatrix}$$ (2)

## 线性函数
> $$y=x^Tw+b$$ (3)
数学中，线性函数指线性的函数(经过原点)，但也常用做一次函数的别称，尽管一次函数不一定是线性的(即$b\rlap{\,/}{=}0$时)

## 透视变换(projective)
相机模型就是一个透视变换，是由四个点变换确定的变换，即八参数变换  
从一个透视点