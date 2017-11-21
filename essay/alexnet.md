# imageNet classification with deep convolutional neural networks
## tips
输入是227还是256？

## abstract
在ILSVRC-2010的1.2million图像上取得了top-1和top-5的错误率分别为37.5%和17.0% 。(top-1错误率指在模型的预测结果中，confidence最大的类别与label不同的数目占所有测试集图像的比例；top-5错误率指在模型的预测结果中，confidence最大的5个类别不包含label的数目占所有测试集图像的比例）  
使用参数60million，神经元650,000个
5层卷积，3层全连接，最后输出1000-way softmax，为了加快训练使用了没有饱和的激活函数，并且使用GPU有效地实现了卷积操作。为了防止过拟合，使用了dropout，并且效果很好。

## introduction
使用机器学习的方法识别物体就需要大量的数据集，如larger datasets 有 LabelMe 图像分割， ImageNet 有15million幅图像，22000类     
同时，由于物体识别具有极高的复杂度，即便有较大数据集，也不能够很清楚的描述问题，这时需要使用大量地人类先验知识来补偿数据集中缺少的例子。CNN就是其中一个很好的使用图像特性的模型(stationarity of statics and locality of pixel dependencies)，并且模型容量可以通过深度、宽度控制。与similar-sized layer的标准feedforward neural network相比，CNN有更少的connections(一个connections表示神经元连接到下一层神经元)和parameters，因此也更容易训练，理论上效果只差一点。  
contributions:
一些新的、不常用的特征，可以改善性能的同时减少训练时间；一些阻止过拟合的方法  
2块GTX 580 3GB GPUs，训练了5到6天。

## the dataset
ImageNet包含15million高分辨率图像，大约有22,000类，这些图像是使用亚马逊的众包服务人工标注的。自2010年开始，ImageNet Large-Scale Visual Recognition Challenge作为Pascal Visual Object Challenge的一部分每年举行一届，ILSVRC使用ImageNet中的1000类图像，训练集1.2million，验证集50,000，测试集150,000幅图像进行比赛。2010年的ILSVRC中的测试集是公开的。   
图像的处理方式是将原始图像的短边缩放到256，然后central crop一个$256\times 256$大小的图像作为训练集，没有其它数据增强操作。只是作了减去RGB像素均值操作。

## the architecture
- ReLU  
> $$f(x) = tanh(x)$$ (1)
> $$f(x) = \frac{1}{1+e^{-x}}$$ (2)
1、2式都是saturating nonlinearities，在gradient descent算法中，很费时间，所以使用了ReLU $f(x)=\max(0,x)$，它是non-saturating nonlinearities的。实验中，使用相同的网络结构，达到相同的训练错误率，ReLU激活函数版网络需要的迭代次数为tanh激活函数版的1/3。激活函数在以往的论文中也有出现的更改，但是关注点不同，本篇文章的关注点是它能够加快模型的训练。

- training on multiple gpus  

- overall architecture  
目标函数:最大化multinomial logistic regression objective，多项逻辑回归，等价于最大化在当前预测分布下正确标签的log-probability   

## reducing overfitting


## details of leraning
batch size: 128
weight decay: 0.0005
momentum: 0.9
leraning rate: 0.01，对于所有的层学习率是相同的，训练的时候手动调节学习率，当验证集的误差不再下降的时候除以10，在1.2 million数据集上训练了90轮，训练过程中学习率一共降了三次


## results


## discussion