# grid loss: detecting occluded face  2016
## abstract
遮挡物体的目标检测是一个难题，因为有些只包含部分物体的窗口对于标准CNN网络并没有可区分性。本篇文章为此提出grid loss，它是在特征图的sub-block上降低错误率而不是整幅特征图一起计算损失，能够使检测器对部分遮挡目标有更好的区分度。  
通过将损失反向传播回全连接层，计算量并没有增加？

## introduction
boosting, DPM, CNN  
被遮挡物体检测是一个难题，因为遮挡后物体可以有更多的变化，也就是更大的类内方差。  
grid loss层将卷积分成spatial block，并且在每个spatial block内使用hinge loss进行优化。这导致会学习出大量的不同检测器。

## related work
- VJ(cascade, decision stump)
- boosting(SURF, linear classifier)
- DPM()
- domain adaption techniques
- CNN


## grid loss for CNNs
使用滑动窗口的形式进行检测
### neural network architecture
滑动窗口上的分类器是一个卷积网络，结构如下
> $$conv \rightarrow relu \rightarrow LCN \rightarrow conv \rightarrow relu \rightarrow dropout$$
其中，LCN是local contrast normalization，
为了快速，使用ACF特征作为输入，降采样$4$倍。最后使用非极大值抑制。
### grid loss layer