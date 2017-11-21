[论文推荐](Speed/accuracy trade-offs for modern convolutional object detectors.)
[implenting mask rcnn](http://forums.fast.ai/t/implementing-mask-r-cnn/2234)

# Mask R-CNN 2017
## abstract
是一个完成object instance segmentation的框架。在进行目标检测的同时，为每一个目标生成了一个segmentation Mask。是在Faster R-CNN的基础上添加了一个输出Mask的分支，速度仍然达到5fps，Mask R-CNN很容易扩展到其它任务上，比如估计人的姿态，作者在COCO数据集三个比赛上取得top的结果，instance segmentation，bounding box object detection，person keypoint detection。

## introduction
[instance segmantationa和semantic segmantation的区别](https://www.zhihu.com/question/51704852)  
semantic segmentation：是对图像上每一个像素都做分类而没有区分具体的实例，FCN是这个领域的主流网络。
instance segmentation：是semantic segmantation和 object detect的结合。
Mask R-CNN是在Faster R-CNN的分类与bbox回归的基础上，添加一个输出RoI 分割mask的分支，输出mask的分支是FCN网络。
而RoiPool的操作没有考虑到像素对齐，所以为了解决量化误差，提出RoiAlign。RoiAlign使mask的精度从10%提高到50%，其次将class prediction与mask的生成解耦合，就是为每一类单独生成一个binary mask，从而让mask不再在类间发生竞争。FCNs是对每一个像素进行多分类，这是将分割与分类融合到了一起输出，在instance segmantation上效果很差。  
Mask R-CNN在coco数据集上，目标检测和实例分割任务上超过了2016年的冠军，使用一台8-gpu机器，在COCO数据集上训练了1到2天。  
Mask R-CNN通过将每一个关键点看做one-hot binary mask，可以识别instance-specific poses。Mask R-CNN在此项任务上也超过了2016COCO的冠军。

## related work
R-CNN，Instance Segmentation(FCIS)

## Mask R-CNN
Mask R-CNN为每一个Roi生成k个binary mask，k表示类别数目，而以往的instance segmentation方法是根据每一个像素的分类结果再判断这个目标是什么。  
- Multi-task loss:  
> $$L=L_{cls}+L_{box}+L_{mask}$$
mask 分支的输出是$Km^2$维度，$k$指目标的类别数目。$L_{mask}$是**average binary cross-entropy loss**，输出是per-pixel sigmoid，训练时，$L_{mask}$的损失只计算真实分类的mask loss。    
FCNs【29】使用的是per-pixel softmax和multinomial cross-entropy loss，这种情况下，masks across classes compete，而作者的方法只有前景、背景的分割，所以应该更容易。     
- Mask representation：  
mask表示了目标的像素分布。作者使用了FCN【29】中的网络来生成$m\times m$的mask，pixel-to-pixel需要Roi特征，这就需要Roi特征尽量保持原图的空间位置信息，由此想到了RoiAlign。    
特征图不同于一维特征向量的地方就在于它有空间位置信息，这是由特征图里像素之间的关系决定的，而特征图里的像素与一维向量里的每一个特征的本质是相同的，都没有大小信息。 大小信息是不是可以通过卷积学习，因为卷积是与位置有关系的，而如果一个目标不在卷积的核心，那么它的输出响应也就会较小，而卷积时从而可以学习到目标的大小信息。   
- **RoiAlign**:   
RoiPool的操作有两个量化步骤，第一，原图上的probposal box到特征图上的Roi，这里发生了浮点型近似整形，第二，Roi在被分解成小的spatial bins的时候被量化。这些量化引入了特征与Roi的misalignments，这不会影响平移不变的图像分类，但是严重影响分割的结果。RoiAlign在计算Roi boundary与Roi bins时避免使用近似操作，而使用双线性插值计算浮点型坐标位置的像素值。但最后还是使用了max 或 average pool操作啊，这难道不会引入misalignment。
- network architecture:  
用语有如下约定：convolutional backbone architecture用语提取整幅图像的特征；network head为每一个Roi生成分类、box、分割mask。  
backbone有ResNet和FPN, heads的结构是【19,27】

### implementation details
- train  
训练时正样本的选取规则与Fast R-CNN中的相同，都是与ground-truth box的IOU大于0.5时才看做正样本，而$L_{mask}$只在正样本中有意义，**mask target就是Roi与ground-truth 相交的地方**，那些不在相交地方的Roi像素被舍弃吗？看做无标签不做loss贡献？。图像短边被缩放到800像素，
正负样本比例1:3，mini-batch size为2张图像 per gpu，8个gpu也就是16张图像，每张图像选出64(for ResNet)或512(for FPN)个Roi。RPN anchors使用5种尺度，3种长宽比。为了convenient ablation实验，RPN是单独训练的。
- inference  
ResNet生成300 proposal，FPN生成1000 proposal。接着box prediction，使用非极大值抑制，最后为分数最高的100个box生成mask。mask分支为每一个Roi输出K个mask，但我们只选用一个mask，也就是预测的类别的mask。 the $m\times m$ mask被缩放到原Roi的大小，然后使用阈值0.5做二值化。

## experiments:instance segmentation
main results: 与以往模型的比较
ablation experiments: 

## Mask R-CNN for Human Pose Estimation
对每一个身体关键点编码成one-hot mask，Mask R-CNN预测K个mask，对应K个身体关键点。  
- Implementation Detatils  
$m^2$ way softmax，使用cross-entropy loss，把这看做instance segmentation，k个关键点被分别的看待。后面接反卷积网络层，及双线性上采样($2\times$)插值。输出分辨率为$56\times 56$的mask。
- experiments on human pose estimation  

## tips
de facto: 事实上  
without bells and whistles: 附加特征、附加特性