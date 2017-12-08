# face detection without bells and whistles 2014

## abstract
提出了两个优秀的人脸检测方法，1.vanilla DPM，2.与VJ检测框架类似的rigid templates。同时讨论了现有的检测算法评测标准的缺点，并做出改善。
 
## introduction
正因为人脸检测的成熟，作者认为这是一个很好的应用来研究目标检测的核心内容。  
贡献：
- 指出现有数据集的评测方法的问题，作者提出一种改善的人脸标记方法，有效的改善了问题。
- 展示了人脸检测依然有很多问题值得探讨。
- 提出vanilla DPM，一个优秀的检测方法
- 第一个对使用ICF做人脸检测的算法进行评测，并使用rigid templates达到了很好的检测效果？？
- 探讨哪些方面最影响rigid检测器的效果，如特征的数量，训练集的大小
- 为提出的评测方法及检测算法提供了源代码

相关工作
- VJ系列
- DPM系列，tree-structured DPM
- 使用CNN检测
- 前面的方法都属于判别式方法，还有将该问题看做图像检索任务的 
- [13] per-image semi-supervised learning

## datasets

## ICF detector
VJ方法的积分图只是作用在灰度通道上，ICF将其推广到图像梯度幅值、方向通道，颜色通道，线性滤波器的输出通道等。  
结合多个templates来检测人脸，测试时，所有的templates都被使用，最后使用NMS来把结果融合到一起
### Baseline detector
SquaresChnFtrs-5[3]，使用了5个模型来检测不同角度的人脸，包括正脸、侧脸  
$80\times 80$ 大小  
使用了4 rounds of bootstrapping？？
### detection speed
$640\times 480$图像，在GPU或多核CPU上达到$50Hz$，时间主要耗费在弱分类器的计算上。 

## dpm baseline
DPM5[9]
有$6$个component？？比ICF多一个的是正脸的镜像对称的检测器，每一个compoent由一个root template与$8$个part template组成。测试使最后使用NMS，并且阈值选用$0.3$

## experiments
已经有论文对ICF检测器的各参数的作用进行了探讨，这个章节讨论检测器的其它部分对性能的影响。
### how many multi-view components
当数目达到$5$时，再添加新的component，已经不再改善检测率
### how much training data 
数量越多，ICF与DPM的性能越好，使用全部数据集，SquaresChnFtrs-5的训练需要$6h$，DPM的训练需要$1$周
### which color channels
### how many weak classifiers
因为Adaboost没有很好的规则化机制，添加更多的弱分类器会导致过拟合。
### building a strong face detector

## conclusion
VJ与HOG+SVM是两种经典的方法，本篇提出的ICF方法HeadHunter与DPM方法都达到了很好的效果，其中DPM使用很少的数据就能有较好的效果，泛化能力很强。

## tips
templates、components: 最终的检测器是由多个components组成的，一个components叫一个模型，比如一个专门检测正脸的模型。