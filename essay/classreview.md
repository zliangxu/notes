# deep convolutional neural networks for image classification: a comprehensive review
## abstract
CNN在1980s末(1980-1989)开始用于处理视觉方面的任务，但是直到mid-2000s才伴随着计算机性能的提高，数据集的增多开始兴起，并且自从2012年，CNN开始快速发展。文章主要介绍，它们的成功，在deep leraning复兴中的角色，标志性的突破，一些改善，还有潮流及依然存在的问题。

## introduction
传统的图像分类方法包含两个步骤，1.提取手工设计的特征，2.训练分类器。  
CNN方法的改进方面，1.网络结构，2.非线性激活函数，3.supervision components(监督方法？)4.规则化技术，5.优化技术

## overview of CNN arcitecture
- 卷积层  
激活函数sigmoid，hyperbolic tangent functions(双曲正切函数)，ReLU
- 池化层  
均值池化、最大值池化
- 全连接层
全连接层后接分类输出，早期使用RBFs，SVM，softmax，全局均值池化。
- 训练  
正则化
- 讨论  
无监督学习、增强学习。

## early CNN development
讲述自CNN出现到CNN复兴的一段时间。
neocognitron是从生物视觉系统中的结构启发得来的，CNN是LeCun等在1989提出的，与neocognitron的主要不同之处是，neocognitron是无监督增强学习的，而CNN是监督学习的。

## deep learning Renaissance and the rise of dcnns
deep belief networks(DBNs)，autoencoder network使用反向传播训练来初始化DNN？？  
第一次使用无监督学习来初始化DCNN    
