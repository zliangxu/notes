# linear algebra

## books recormend

shilov(1977)
absolute value 绝对值  
tensor：表示维度大于2的矩阵

## linear dependence

求解方程(线性方程？？)
> $$Ax=b$$
方程可以这样理解， $A$ 的列向量组合成的列空间是否包含向量 $b$

## eigen decomposition

- 特征值
> $$Av=\lambda v$$
这里的 $A$ 是**方阵**，方阵才有特征分解，$\lambda$ 是特征值，$v$ 是非0向量、是对应的特征向量。特征值可以是0，可以有重复。几何意义是线性变换 $A$ 只会使向量伸长或缩短而不改变方向。

- 特征分解
> $$A=Vdiag(\lambda)V^{-1}$$
只有可对角化矩阵才有矩阵分解；对于特征分解，特征值的大小表示这个特征有多重要，特征向量表示这个特征是什么。
一个方阵的特征值有重复时，它的特征向量就不唯一，所以特征分解不唯一  
一个方阵的特征值有0时，那么它是奇异的；所有特征值为正数的矩阵为正定矩阵，所有特征值为正数或0的矩阵为半正定矩阵，

## singular value decomposition

适用于任意矩阵(方阵、非方阵)
> $$A=UDV^T$$
其中， $U$ 是左奇异向量， $V$ 是右奇异向量， $D$ 除了对角线元素都是0。

## 特征分解与奇异分解的关系
> $$A=UDV^T \rightarrow \begin{cases} & A^TA=VD^TDV^T  \\
&  AA^T=UDD^TU^T
\end{cases}$$
特征分解特征值 $\lambda$ ，奇异值分解奇异值 $\sigma$ ，那么
> $$\sigma = \sqrt {\lambda}$$
矩阵 $A$ 的左奇异向量是 $AA^T$ 的特征向量，右奇异向量是 $A^TA$ 的特征向量。
当 $A^T=A$ 时， $V=U$ ，所以奇异值分解与特征分解的结果相同。

## trace operator

迹是一种运算

## determinant

行列式

## pca

协方差矩阵 $\Sigma$ 是对称半正定矩阵(特征值大于等于0)，svd分解在数值计算上更加稳定，所以称为svd分解，其实也是特征分解。
>$$\Sigma=X^TX$$
这里的 X 是0均值的