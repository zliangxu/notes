# object detection networks on convolutional feature maps hekaiming 2016
## abstract
nocs: networks on convolutional feature maps  
强调共享特征图上的分类网络的设计

## introduction
实验了三种Nocs分类网络的设计
- 不同深度的MLP
- 不同深度的CNN
- CNN with maxout(学习用于尺度选择的潜变量)

## related work
- traditional object detection  
通常关注两个方面，特征提取、分类器  
VJ: haar-like features, boosted classifier  
pedestrian detection: HOG, linear SVM  
DPM: deformable graphical models, latent SVM  
selective search: spatial pyramid features, dense sift vectors, additive kernel SVM    
regionlet: HOG and other features, boosted classifier
- convnet object detection  
以前的工作Nocs分类网络都是fc层，但是图像分类有了全卷积的ResNet,GoogleNet，同样也可以应用在Nocs的分类网络上。  

## ablation experience
- 通用设置  
固定训练好的SPPnet作为共享特征提取层，使用selective search提取$~2000$个候选框，使用Roi pooling取缔spatial pyramid pooling提取$m\times m$的特征，**但是在哪一层执行Roi pool？因为SPPnet有pyramid feature map的，maxout章节讲是选择一层**。训练时，通过Nocs后输出$n+1$(+1 for background)维向量，后接softmax层，之后，使用倒数第二层fc的特征训练linear SVM分类器。
- MLP  
使用$2\sim 4$层fc训练，得到倒数第二层特征后使用SVM分类。结果随着fc的层数增加，SVM的准确率增加，但是$4$fc接softmax的mAP比$4$fc接SVM的高$7.8\%$。  
- ConvNet  
在最后输出的fc层前添加conv层，在只使用VOC 2007数据集时出现过拟合，由此mAP降低，使用VOC2007 and 2012时，mAP增大
- maxout for scale selection  
**element wise maxout???**，在不同层位置添加一层maxout后，mAP提升了$1.8\%$，在maxout原论文中，使用的是相同的输入，不同的参数，以在不同结果中取最大值，而这里是相同的参数，不同的输入，以在不同的结果中取最大值。  
- fine-tuning Noc
提高较多。
- deep features vs deep classifier  
实验表明，两者的深度同样重要
- error analysis  
使用开源的目标检测error分析代码，分析结果。

## noc for faster R-CNN with resnet
## conclusion
