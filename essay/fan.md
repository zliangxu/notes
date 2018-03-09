# face attention network: an efficient face detector for the occluded faces 2017
## abstract
人脸检测在发生遮挡时依然存在问题，而提高召回率的同时往往会增加误检率。本文提出的FAN，在不牺牲速度的情况下，提高了遮挡情况下的人脸检测。具体的提出新的anchor-level attention(highlight 人脸区域周围的特征)，和特定的anchor匹配机制及数据增强方法。

## introduction
one-shot detection pipeline called face attention network.    
使用了RetinaNet中的feature pyramid network提取不同层的特征，来解决尺度问题。对于anchor-level attention，不同特征层使用不同的attention region。  
包括三贡献：
1. 提出anchor-level attention机制来解决遮挡问题
2. 基于RetinaNet提出实际可用的baseline
3. 结合anchor-level attention与RetinaNet的FAN

论文工作可以总结为两个方面：  
1. anchor asign strategy
2. attention

## related work

## face attention network
ssh解决不同层特征融合的问题？  
S3FD改变anchor匹配策略，来增加召回率
### base framework
将通用目标检测的RetinaNet用在这里检测人脸，RetinaNet的backbone网络是ResNet(有吗？)及FPN。  

最后接$KA$个滤波器的卷积输出，$K$表示目标类别数目，这里$K=1$，因为输出是sigmoid激活函数。$A$表示每一个位置的anchor数目，这里$A=6$即一个anchor是一个长宽位置都确定的框。
### attention network
- 5层特征用于输出
- aspect ratio是$1$和$1.5$，因为正脸比例是$1:1$，而侧脸比例看做$1:1.5$。
- 作者对widerFace做出统计，$80\%$的人脸在$16\sim 406$，所以设置anchor大小在$16^2\sim 406^2$，过于小的人脸不包含在训练集内。
- anchor scale step $2^{1/3}$，这保证了每一个groud truth box都有$IOU>0.6$的anchor
- 正样本$iou>0.5$
- 负样本$iou<0.4$  

attention：使用supervised heatmaps训练一个segmentation分支，预测时使用eponential操作将其与特征图相乘作为目标检测head-network的输入。**有新意**。    
在斗鱼上的讲解视频里，作者提到这种segmentation attention并不是他们首创，而是从行人检测领域借鉴过来的，但是在原文中并没有发现相关文献的引用。从视频中获知，作者制作的branch layer wise分割标签是在该层anchor匹配到的groud truth bounding box内填充为$1$，或使用高斯填充，作者发现这两种填充方式对结果影响不大。

数据增强
- random crop: crop square patch，边长范围在原图短边的$0.3\sim1$之间，保留ground truth box中心在图内的label。
- random flip
- color jitter，仿照S3FD
对于小于$8$像素的人脸，由于在第一层输出上$8$被降采样下只有一个像素，所以训练时略去了这些标签。

### loss function
> $$\begin{aligned} L= &\sum_k\frac{1}{N_k^c}\sum_{i\in A_k}L_c(p_i,p_i^*)+ \\
&\lambda_1\sum_k\frac{1}{N_k^r}\sum_{i\in A_k}I(p_i^*=1)L_r(t_i,t_i^*)+\\
&\lambda_2\sum_k L_a(m_k,m_k^*) \end{aligned}$$
其中，
- $L_c$是focal loss，代表分类损失，  
这里$N_k^c$是计入分类损失的anchor数目，包括正、负样本，而focal loss原文中是只计入正样本的数目。
- $L_r$是smooth L1，代表位置回归损失，
- $L_a$是pixel-wise sigmoid cross entropy(相当于pytorch中的binary cross entropy loss)，代表attention loss。

## experiment
使用ResNet50做backbone网络。

## conclusion
使用anchor-level attention能够有效降低误检率。

## tips
很有创意，很实用，解决问题的方式也很直接，很厉害。不过给的例子里没有出现手的照片，不知道容不容易误检。