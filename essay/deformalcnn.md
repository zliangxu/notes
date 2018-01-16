# deformable convolutional networks
## abstract
CNN受限于它自身的固定的几何变换结构，提出以下两个结构来增强模型的变换表达能力，
- deformable convolution
- deformable Roi pooling。  

它们都是基于增强空间位置采样的理念，提出的模块可以嵌入到CNN中，使用反向梯度传播优化。实验表明，目标检测、语义分割任务中，在CNN中学习dense spatial transformation，是有效的。

## introduction
对于语义分割，像FCN，所有的像素使用相同的卷积操作，显然是不合理的，因为每个像素可以对应目标的不同位置。  
对于目标检测领域，所有的方法依然使用预先设定的anchor做检测。  
- deformable convolution  
它是在标准2D卷积regular grid sampling locations的基础上加了2D的偏移，偏移量是通过额外的网络学习而来，额外网络的输入就是前一层的特征图。
- deformable Roi pooling   
对标准的Roi pooling中的regular bin partition添加偏移量，偏移量是通过额外网络学习得到，额外网络的输入是前一层的特征图及Rois?
由spatial transform network，deformable part models启发得到

## defromable convolutional networks
各通道的变形量是相同的
- defomable convolution  
偏移量回归网络的卷积核大小与主干网络当前层的卷积核大小相同，用于输出偏移位置信息的网络输出与输入特征图的大小相同，通道数为$2N$，$N$为卷积核的大小。
- deformable Roi pooling  
偏移量回归网络的输入是标准Roi pooling后的$k\times k$的Roi特征，特征经过fc层，输出归一化的偏移量$\Delta\hat p_{ij}$，然后使用Roi的大小再还原到图像的尺寸$\gamma \cdot \Delta \hat p_{ij}\odot (w,h)=\Delta p_{ij}$，($\odot\text{hadamard积，元素之间乘积}$)，$\gamma$是预定义的设置偏移量级的参数。
- position-sensitive(PS) Roi pooling  
由输入特征图先卷积生成$2\times k^2\times (c+1)$的特征图，$k^2$表示roi pooling后的大小，$c+1$表示类别数加背景，$2$表示$x,y$两个坐标上的偏移量，然后在这个特征图上执行特别层roi pooling，组合输出Roi的$\Delta\hat p_{ij}$。
- deformable convNets  
添加的用于估计位置偏移的conv及fc层的权重初始化为$0$，它的学习率是其它层学习率的$\beta$倍。 

## understanding deformable convNets
### in context of related works
- spatial transform networks(STN)  
在小尺寸图像分类上效果显著，对于dense prediction(图像分割)，semi-dense prediction(目标检测)很难起到实质作用。
- active convolution  
不同位置的偏移量相同，偏移量的参数在训练完成后冻结
- effective receptive field  
揭示了同一个感受野内的像素对响应值的贡献量不同，位于感受野中心的像素贡献更多。有效感受野的尺寸比理论感受野的尺寸要小得多
- atrous convolution  
也叫作dilated convolution
- deformable part model  
- deepID-Net  
- spatial manipulation in Roi pooling  
- transformation invariant feature and their learning 
- dynamic filter 
- conbination of low level filters


## appendix B
aligned-inception-Resnet与原本的inception-Resnet有两处不同，
