# densebox: unifying landmark localization with end to end object detection
## abstract
使用FCN架构做目标检测，贡献有两点
1. 使用单个FCN网络，检测多个目标
2. 使用landmark localization 做多任务学习

只是单类目标检测

## introduction
RCNN系列在检测小目标时会很困难，因为分辨率较低且没有上下文信息。

## related work

## denseBox for Detection
假设输入图像大小$m\times n$，那么输出为$\frac{m}{4}\times\frac{n}{4}$，输出的每一个位置$(x_i,y_i)$是一个$5$维向量，表示一个目标的置信度及位置，$t_i=\{s, dx^t=x_i-x_t, dy^t=y_i-y_t,dx^b=x_i+x_t,dy^b=y_i+y_t\}$，其中$s$表示是否为目标的置信度，$x_t,y_t$表示目标框的左上角点的坐标，$x_b,y_b$表示目标框的右下角点的坐标。即预测的是与当前像素位置的位移。
### multi-task training
使用VGG19的前$12$层卷积初始化网络，其余层使用xavier初始化。  
作者使用L2 loss来作为是否为目标的损失函数，而没有使用更合理的cross-entropy loss,hinge loss，只是因为性能无差别
> $$\mathcal{L}_{cls}(\hat y, y^*)=\|\hat y, y^*\|^2$$
坐标回归损失也是用L2 loss  

