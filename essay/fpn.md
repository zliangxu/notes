# feature pyramid networks for object detection
## abstract
为了能够检测多尺度的目标，特征金字塔是一个很基本的成分，而以往的目标检测算法为了减少计算量，都没有使用金字塔，这篇文章探索了多尺度，在增加了很少额外计算量的情况下使用了特征金字塔，为了建立多尺度的特征图，采用了一个top down的结构，叫做FPN(feature pyramid networks)

## introduction
## related work
hand-engineered features and neural networks  
deep convnet object detectors: overfeat, rcnn, sppnet  
methods using multiple layers:   

## feature pyramid networks
主要和ssd一样，使用了多个尺度的特征图，不过各层特征图的构造方式不同，有forward 和backward。

## applications
在feature pyramid networks的基础上，使用rpn生成region proposal box与fast rcnn detector结构。
### rpn