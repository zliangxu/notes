# Fully Convolutional Networks for segmantic segmentation 2015


## abstract
修改AlexNet,VGGnet,GoogLeNet为全卷机网络，实现网络像素的端到端的训练。
## introduce
patchwise training and fully concolutional training?
语义分割自身就有一个争端在semantics和location上，    
介绍了一种'skip'结构，来连接深层语义信息与浅层appearance信息。  
DAG：directed acyclic graph，有向无环图
## related works
fully concolutional networks: 历史上全卷积网络的出现及使用  
dense prediction with convnets: 输出被上采样到输入原图像的尺寸。
## fully convolutional networks
### adapting classifiers for dense prediction
### shift-and-stitch is filter rarefaction
shift-and-stitch 来源于Overfeat, upsampling效果更好。
### upsampling is backwards strided convolution
backwards convolution(也叫作deconvolution，反卷积)，反卷积的滤波器参数也是可以通过训练学习的。
### patchwise training is loss sampling
patchwise training:完整图的部分输出
whole image training:把完整图像输入，label是热度图
dense prediction:输出热度图
## segmentation architecture
更改训练好的ImageNet图像分类网络为FCNs网络，使用in-network上采样和pixelwise损失来改为dense prediction。然后提出了一个skip结构来结合各层网络信息提高预测准确率。  
使用multinomial logistic? loss 多项分布($n\geqslant 2,k\geqslant 2$)，就是一个有k个输出的实验，独立地重复n次。
评价指标：mean pixel intersection over union，使用所有类预测的均值。
### from classifier to dense FCN

### combining what and where

