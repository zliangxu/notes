# Fully Convolutional Networks for segmantic segmentation 2015
这里的反卷积与zfnet中的可视化反卷积不是一个概念。

## abstract
建立全卷积网络的概念，它的输入、输出是任意大小的；提出一种新的网络结构skip，连接深层网络与浅层网络来整合深层语义信息，和浅层的appearance 信息。  
修改AlexNet,VGGnet,GoogLeNet为全卷积网络，实现网络像素的端到端的训练。 
PASCAL VOC 2012  62.2% mean IU  5fps

## introduce
patchwise training and fully concolutional training?
语义分割自身就有一个争端在semantics和location上，    
介绍了一种'skip'结构，来连接深层语义信息与浅层appearance信息。  
DAG：directed acyclic graph，有向无环图
in-network upsampling, multilayer combinations

## related works
fully concolutional networks: 历史上全卷积网络的出现及使用  
dense prediction with convnets: 输出被上采样到输入原图像的尺寸。

## fully convolutional networks
如果损失函数是最后一层卷积输出所有像素损失的和，如下式，那么随机梯度下降法中，梯度也是所有像素的和，这和将一张图像所有像素的感受野图像作为输入得到的输出看做一个mini-batch是一样的。
> $$L(x;\theta)=\sum_{i,j}L(x_{i,j},\theta)$$
### adapting classifiers for dense prediction
将全连接转为卷积，全连接输入特征图的大小就是卷积核的大小，特征图的通道数，就是卷积核的通道数，这样就将全连接转为卷积，整个网络能够输入任意大小图像，并输出分类的特征图。  
### shift-and-stitch is filter rarefaction
shift-and-stitch 来源于Overfeat。input-shift and output stitch，细节没看懂？？？  
作者只是做了初步实验，最后的模型中并没有采用shift-and-stitch，因为下一节的upsampling效果更好。
### upsampling is backwards strided convolution
可以说，以尺度$f$上采样是以输入步长为$1/f$的卷积。那么一个自然而然的想法是使用反卷积做上采样，backwards convolution(也叫作deconvolution，反卷积)，并且反卷积的滤波器参数也是可以通过训练学习的。
### patchwise training is loss sampling
patchwise training:完整图的部分输出
whole image training:把完整图像输入，label是热度图
dense prediction:输出热度图
样本不均衡可以通过改变loss权重来解决，loss sampling能解决spatial correlation。
## segmentation architecture
更改训练好的ImageNet图像分类网络为FCNs网络，使用in-network上采样和pixelwise损失来改为dense prediction。然后提出了一个skip结构来结合各层网络信息提高预测准确率。  
使用multinomial logistic? loss 多项分布($n\geqslant 2,k\geqslant 2$)，就是一个有k个输出的实验，独立地重复n次。
评价指标：mean pixel intersection over union，使用所有类预测的均值。
### from classifier to dense FCN
把VGG16最后的分类层去掉，把全连接换成卷积，后又接了输出$21$通道的$1\times 1$的卷积，后面是反卷积网络层。最后达到59.4 mean IU。
### combining what and where
![fcn](../image/essay/fcn.jpg)  
skip结构生成的nonlinear local feature hierarchy 叫做deep jet。 加上skip结构后达到 62.7 mean IU
多层的数据是上采样到同一个尺度直接加起来的，细节
refinement by other means，失败
### experimental framework
## results
## conclusions
