# deep neural networks for object detection

## Abstract
dnn general architecture for classification [14]
把目标检测看做一个回归问题，回归的是输出的特征图中每一个像素是目标或不是目标的概率，即object bounding box mask。

## introduction
dnn不同于传统的图像分类方法。第一，它是深度模型，具有极大的模型容量，能够学习比浅层模型更复杂的表达能力。从分类的角度看神经网络具有平移不变性，但是在目标定位这里也可以看到神经网络能够捕捉目标位置信息。
第二，设计了一个多尺度目标框的输出，并且通过重复refinement，来以像素为单位得到目标框。

## related work
当前研究最多的是deformable part-based model [9]，这个模型可以看做有两层结构，第一层目标部分块的检测，第二层是一个star model叫做pictorial structure(图结构模型)。  
compositional model, And/Or graph[20]  
Gabor、HOG都可以看做是种滤波器。在推理阶段，它们结合了**bottom-up和top-down**成为了一个步骤??。  
- bottom up: 是逐层加工输入信息生成上层信息，是信息驱动的。视觉里是跟据图像提取图像特征，然后一步步向后推理，例如dnn图像分类，从最初的图像像素输入，每一层网络经过提取下层信息，生成上层信息，最后得到图像的分类。  
- top down: 是要检测目标，然后根据我们知道的目标的样子，在图像中找目标，是目标驱动的。例如VJ的目标检测的滑动窗口方法，是在图像中寻找目标。[参照](http://daily.zhihu.com/story/9278873)   

nn是一种compositional model，它的节点更通用，但同时也缺少合理的解释。

## dnn based detection
目标box mask的回归，location的refinement

## detection as dnn regression
5层卷积2层全连接的网络。[14]
模型是:
> $$DNN(x; \Theta) \in \mathbb{R}^N $$
$x$是输入，$\Theta$是模型参数，输出是$N=d \times d$
目标函数是L2范数的平方:
> $$\min_\Theta \sum_{(x,m)\in D} \| (Diag(m) + \lambda I)^{{1}/{2}} (DNN(x;\Theta)-m)\|_2^2$$
其中，$D$是训练集集合，训练集中每一个样本由输入图像$x$与标签$m$组成，$m\in [0,1]^N$，表示$m$是一个向量，每一个元素取值为0到1的小数，0是背景，1是目标。  
L2公式中的前半部分是权重项，因为一张图像上面目标只占很少的一部分，使用标准的L2惩罚项，会使网络输出全部是0。所以这里取$\lambda$为一个较小值，就可以减少标签为0的像素分类为0或1的损失，同时增加标签为1分类为0或1的损失，例如$\lambda=0.01$，那么标签为0的损失相当于乘了$\sqrt{0.01}=0.1$，而标签为1的损失相当于乘了$\sqrt{1.01}=1.00498$  
本实验中，使用$d=24$，感受野为$225\times225$

## precise object localization via dnn-generated masks
现在得到了目标mask，但是依然面临很多问题：
1. 输出的一张mask，无法区分两个相邻的物体的边界
2. 输出的mask尺度过小，无法对物体准确定位，例如input size = 400x400，output size=24x24，那么1个输出，对应16个像素的输入，这16个像素就无法继续区分物体
3. 因为输入是整张图像，而如果图像中的目标很小，输入中受目标影响的像素就很少，也就很难识别

解决方法：
1. multiple masks for robust localization  
使用5个网络来分别生成目标框的{full, bottom, top, left, right}的预测框，记为$m^h$，$h\in\{full,bottom……\}$  
我们对$m(i,j)$的赋值，按下式计算:
> $$m^h(i,j;bb)=\frac{area(bb(h)\bigcap T(i,j))}{area(T(i,j))}$$
其中，$T(i,j)$表示网络的输出中点$(i,j)$在原图像中对应的框，对应框的左上角为$(\frac{d_1}{d}(i-1), \frac{d_2}{d}(j-1))$，尺度为$\frac{d_1}{d} \times \frac{d2}{d}$，$d_1,d_2$为输入图像的高和宽，$d$为特征图的边长。$bb(full)$为 ground truth object box，
训练时，可以使用一个网络同时输出5种结果。

2. object localization from dnn output  
使用ouput mask coordinate来定位目标，也就是获得目标在输入图像中的左上角、右下角坐标，$bb=(i,j,k,l)$，具体做法是把mask放大到原图，然后按下式计算$bb$的分数，最后选取分数最高的框
> $$S(bb,m)=\frac{1}{area(bb)}\sum_{i,j}m(i,j)area(bb \bigcap T(i,j))$$
对于5个mask，最后的分数是
> $$S(bb)=\sum_{h \in halves} (S(bb(h),m^h) - S(bb(\bar{h}), m^h))$$
$halves={full,bottom,top,left,right}$，$\bar{h}$在半个box中表示$h$的另一半，对于full box，$\bar{h}$表示$h$的矩形区域向外扩充的一个矩形，这样就会约束目标框不会扩大。
bounding box的大小选为原图像的[0.1,……,0.9]，9个尺寸，使用k-means聚类算法选了10种长宽比，然后每隔5个像素就取$9 \times 10 = 90$个框。这里使用了积分图来加速计算 $S$
然后保留$S > 0.5$的框，最后使用non-maximum suppression [9]

3. multi-scale refinement of dnn localizer  
有两个步骤可以提升定位的准确度：
- 使用多个尺度以及一些小大的sub-windows作为输入图像  
- 把已经提取到的框，作为输入图像，进行refinement
具体做法见论文流程图

## dnn training

## experiments
VOC2007 训练集图像 5000 test images over 20 classes  
VOC2012 训练集11k image  

sliding window version of a dnn classifier [14]
named DetectorNet
Jaccard similarity(Intersection Over Union)
> $$J(A,B)=\frac{|A\bigcap B|}{|A\bigcup B|}$$

与DPM相比，DetectorNet性能在检测猫、狗、羊、鸟等变形较大的物体上要更好。
经过refinement后，ROC曲线的分数要好得多

## conclusion
当前一个网络只能用于检测一种物体。