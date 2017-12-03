# finding tiny faces 2017 CVPR
[比你写的好得多的笔记blog](http://blog.csdn.net/shuzfan/article/details/66971130)


## abstract
小目标检测依然是个难题，这篇文章从三个方面分析了这个问题：
- 尺度不变性
- 图像分辨率
- 上下文信息(contextual reason)
对于尺度不变性，作者认为检测3px与检测300px的人脸使用的特征是不同的，所以针对不同大小人脸，训练了不同的检测器，检测器使用的是同一个网络不同层的特征，所以是一个Multi-task。对于小目标的检测，作者发现上下文信息至关重要，所以提高了templates的大小。最后，作者尝试了微调已经训练好的网络来提高它的检测范围的方法。
AP 82% Wider Face数据集(小目标，且被遮挡目标较多)

## introduction
从客观上讲，依据尺度不变性设计的算法是没有办法解决小目标检测的问题的。  
- multi-task modeling of scales:
大部分目标检测中使用的分类器的输入都是统一尺寸的，像建立图像金字塔然后滑动窗口的方法，Faster R-CNN中使用Roi pooling来得到统一大小的。那么这个检测模板的大小要如何定呢？往往要顾此失彼，one-size-fits-all的方法并不适用，所以作者想到分别训练检测器来检测大、小目标。然而训练大量的检测器，也会有缺点，如缺失固定目标尺度训练数据，测试时效率低。为此，作者采用了一种multi-task的形式，充分利用不同层的特征。
- how to generalize pre-trained networks
作者验证了预训练好的模型是针对个别大小目标检测的，那么如何从预训练好的模型中获取尺度不变的特征？作者采用了测试时，使用图像金字塔
- how best to encode context
作者实验表明，人眼对于小目标的识别也是严重依赖于context信息的。并且验证使用来自多层的卷积特征(hypercolumn feature)可以有效捕捉高分辨率的细节与低分辨率的线索信息的(使用大的感受野)，这个特征叫做'foveal' feature

## related work
- scale-invariance  
大量的工作聚焦于图像的尺度不变特征表达，如SIFT，R-CNN，Faster R-CNN(使用Roi Pool，不同大小的区域使用相同大小的特征向量表示)。作者对scale-variant templates方法进行了深入探讨，SSD就是一种scale-variant templates的方法(但是特征图上的卷积核大小是一样的，这里的variant是指不同的特征图？？)，templates是啥？？这篇文章与SSD不同于使用了上下文信息 
- context
使用大的local context in a scale-variant way
- multi-scale representation
使用hypercolumns特征，即来自不同层的卷积特征一起构成描述符
- RPN
不同与RPN的地方就是hypercolumns特征

## exploring context and resolution
首先想一下这个问题，当已知待检测人脸大小是$25\times 20$时，该怎样设计检测器？ 应该考虑的因素有上下文信息与模板大小  
同时，在解决第一个问题的同时，想一下这个问题，当已知待检测人脸大小是$250\times 200$时，该怎样设计检测器？  
实验设置：采用ResNet50的FCN结构，输出二分类概率图(热度图)
### context
### resolution


## tips
template： 模板，相当于滑动窗口方法中的窗口大小；也相当于Faster R-CNN中，将proposal box经Roi Pooling后得到的统一尺寸的大小。