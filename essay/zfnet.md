# visualizing and understanding convolutinal networks(ZF-net)

## abstract
Alexnet在Imagenet上表现良好，但是，1.当前能解释它为什么会好的理论，2.如何改进它，有这样两个问题。

## introduction
multi-layered 反卷积。  
通过部分遮挡原图，分析分类器的结果受输入图像的哪部分影响。
related work

## Approach
作者使用的网络结构，输入$224\times 224 \times 3$， cross-entropy loss function用于图像分类。
### visualization with a deconvnet
deconvnet被提出来用于无监督学习，而这里是将convolution的输出映射回输入。
