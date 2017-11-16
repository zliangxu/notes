![rcnn123](../image/essay/rcnn123.jpg)  
[faster rcnn](http://blog.csdn.net/shenxiaolu1984/article/details/51152614)
## faster rcnn: towards real-time object detection with region proposal networks
## abstract
提出了region proposal net(RPN)，并且RPN与目标检测框架使用同一个卷积网络来提取特征。
RPN是一个全卷机网络，用于输出目标框及目标框为目标的概率。
5fps on gpu
## introduction
图中特征的多尺度实现方式出现了3种  
![faster](../image/essay/fastermultisize.jpg)  
第一种方法是图像是多尺度的，第二种方法是特征图是多尺度的，第三种方法是slinding window多尺度的。

## related work

## faster rcnn
由两个模块组成，1.RPN 2.Fast R-CNN detector
### region proposal networks  
输入为一张图片，输出为框及框中是否包含目标的概率
尝试了5层卷积网络的ZFnet，13层卷积网络的VGGnet16。在卷积层特征中，以$3\times 3$为窗口进行卷积特征图输出低维度特征向量，特征向量再用于回归坐标及分类。
- anchors
k表示每一个slinding window中要提出的proposal region的数目
k个proposal box是以k个reference box为参考的参数表达的，这k个reference boxes叫做anchors，一个anchor是一个带有尺度和长宽比的以slinding window的中心为中心的框。  
anchor具有平移不变性。achors是一种新的解决多尺度问题的方法。
- loss function  
训练时，把两种anchors看做正样本，1.与ground-truth box的IOU最大的anchor，也就是说有多少个ground-truth box就会有多少个anchor被标注为正样本。2.所有的与ground-truth box的IOU大于0.7的anchor。这两种标注策略最终会导致一个ground-truth box对应到多个anchor上，通常使用策略2就可以生成多个正确的正样本，但是有时会是0个，所以增加了策略1。负样本是所有与ground-truth box的IOU少于0.3的框。
一个mini batch的损失的计算函数，这里一个mini-batch就是一张图片
> $$L(\{p_i\}, \{t_i\})=\frac{1}{N_{cls}}\sum_i L_{cls}(p_i,p_i^*)+\lambda \frac{1}{N_{reg}}\sum_i p_i^* L_{reg}(t_i,t_i^*)$$
$p_i$表示预测的一个anchor为目标的概率，$p_i^*$表示表示一个anchor的label为1或0，$t_i$表示预测的4个参数化的bounding box，$t_i^*$表示一个关于正样本anchor的ground truth box，这里regression loss选用了smooth L1损失，分类层与回归层的输出分别为$\{p_i\}$和$\{t_i\}$，$N_{cls}$表示mini-batch的大小，$N_{reg}$表示anchor的数量(一张图像里的，2400)。这里不同于以往的bounding box regression，因为以往的用的特征是从不同大小的roi pool到的，并且参数要适用与所有不同大小的roi size，而这里regression是针对固定大小窗口($3\times 3$)的特征的，针对k个不同大小的anchor，学习了k个专用的regressor，用于针对不同的scale与aspect ratio。
- training rpns  
采用了image-centric来训练rpn，image-centric指fast-rcnn中训练样本是从一张图像中抽取的，针对SPPnet无法训练的问题提出的。
从一张图像中按正、负样本1:1比例抽取256个anchors，如果正样本不够，拿负样本填充。
### sharing features for rpn and fast r-cnn
尝试了3种方法来训练feature shared的rpn与fast r-cnn
1. 交替训练，先训练rpn，然后使用rpn提出的框训练fast r-cnn，然后再用fast-rcnn的参数初始化rpn来，接着训练rpn，这篇文章的实验就是这个方法做的。
2. 近似联合训练，这里将rpn与fast-rcnn当做一个整体训练，两个损失在shared feature处交汇相加，但是忽略了继承性？？，rpn的输出也是fast-rcnn的输入，所以也是网络的响应，实验结果与1相近。
3. 联合训练，因为2中rpn的输出同样是fast-rcnn的输入，所以计算梯度时，fast-rcnn的损失也会传导到rpn中，
### implementation detailes
训练时忽略boundary crossing outliers的anchor，因为他们会使网络训练不收敛。