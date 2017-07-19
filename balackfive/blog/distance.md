![111.jpg](.111.jpg)  
点$A(x_0,y_0)$到直线$ax+by+c=0$的距离就等价于点A到直线$ax+by=0$的距离(图中的OB)，加上直线$ax+by+c=0$在y轴的交点$C(0,-\frac{c}{b})$到直线$ax+by=0$的距离(图中的OD)之和。即
$$d=OB+OD$$
直线$ax+by+c=0$的单位法向量是$\frac{(a,b)}{\sqrt{a^2+b^2}}$，那么由向量
$$\begin{aligned} OB&=|(x_0,y_0)\cdot \frac{(a,b)}{\sqrt{a^2+b^2}}|=\frac{|a*x_0 + b*y_0|}{\sqrt{a^2+b^2}} \\
OD&=|(0,-\frac{c}{b})\cdot \frac{(a,b)}{\sqrt{a^2+b^2}}|=\frac{|-c|}{\sqrt{a^2+b^2}} 
\end{aligned}$$
实际情况也可能是两者相减，这里不再考虑，对于图中的情况是两者相加