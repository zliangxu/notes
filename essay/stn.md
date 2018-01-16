# spatial transformer networks, deepmind , 2015
## abstract 
提出可学习模块，spatial transformer，用于学习平移、缩放、旋转、warping等变化的不变性特征。 

## introduction 
变换是作用在整个特征图上的
spatial transformer可以用于
- 图像分类  
crop out and scale normalize the appropriate region  
- co-localization  
- spatial attention

## related work

## spatial transformers
单个变换、每个变换单个输出，分为三部分
### localization network  
对应Localization Net，用于学习变换矩阵的参数。几层网络后接回归层，输出变换所需的参数个数个输出  
### parameterised sampling grid  
对应grid generator，用于由Regular Spatial Grid生成Sampling Grid，即点的映射，具体看$(1)$式。  
deepmind这里提出定义：   
- 对应输入特征图 U 中像素的坐标网格——Sampling Grid，保存着$(x^{Source},y^{Source})$，它并没有对应着输入特征图的坐标，而是regular grid映射到输入特征图的像素坐标  
- 对应输出源特征图像素的坐标网格——Regluar Spatial Grid  ，保存着$(x^{Target},y^{Target})$
> $$G=\{G_i\} \quad G_i=(x_i^t,y_i^t)$$
这里将$(x_i^t,y_i^t)$和$(x_i^s,y_i^t)$归一化到$-1\sim 1$，这样变换矩阵中的旋转中心位置才对应到图像的中心点。  
spatial transformer使用$\mathcal{T}_\theta$表示，那么两个grid之间像素的映射可以使用下式表示，
> $$\left( \begin{matrix} x_i^s \\ y_i^s \end{matrix}\right) =\mathcal{T}_{\theta}(G_i)=\mathcal{T}_\theta \left(\begin{matrix}x_i^t \\ y_i^t \\ 1\end{matrix}\right)$$(1)
之所以写成变换矩阵乘以regular grid的形式，是因为spatial transformer变换后的特征图，是整齐排列的，这样计算它映射回原图的点的像素值可以由插值得到
### differential image sampling   
插值由上一步得到的sampling grid中坐标对应的像素值，插值可以是最近邻、双线性插值等

### spatial transformer networks

## experiments
### fine-grained bird classification CUB-200-2011  
6k训练集，5.8k测试集，只使用类别信息进行监督训练

[Spatial Transformer Networks(空间变换神经网络) blog](http://www.linjm.tech/2016/12/03/stn-note/)
