[论文推荐](Speed/accuracy trade-offs for modern convolutional object detectors.)

# Mask R-CNN 2017
## abstract
是一个完成object instance segmentation的框架。在进行目标检测的同时，为每一个目标生成了一个segmentation Mask。是在Faster R-CNN的基础上添加了一个输出Mask的分支，速度仍然达到5fps，Mask R-CNN很容易扩展到其它任务上，比如估计人的姿态，作者在COCO数据集三个比赛上取得top的结果，instance segmentation，bounding box object detection，person keypoint detection。

## introduction
[两者区别](https://www.zhihu.com/question/51704852)
semantic segmentation：是对图像上每一个像素都做分类而没有区分具体的实例，FCN是这个领域的主流网络，
instance segmentation：是semantic 和 detection  
在Faster R-CNN的基础上，输出mask的分支是FCN网络。
