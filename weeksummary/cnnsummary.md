# CNN summary

## regularization
- L1
- L2
- dropout
- BatchNormalization
- combine multiple losses(GoogLeNet)

## normalization
- batch normalization
- layer normalization
- cosine normalization
- weight normalization


## 内存消耗
[分析译文](http://blog.csdn.net/shenxiaolu1984/article/details/71522141)
- 模型参数  
和模型复杂度有关  
卷积权重、偏置，BN层方差、均值、$\gamma, \beta$参数，relu、dropout层没有参数等
- 各层响应  
和模型复杂度有关，和模型参数量(参数共享)没有关系，和输入大小有关系  
有的层(relu, dropout)可以使用inplace设置来节省内存，不开辟新内存，直接重写到原有响应上。
- batch_size的影响  
batch_size不影响模型参数的量。但影响各层响应的内存占用，是batch-size倍的关系
- 卷积计算的影响  
CNN卷积的高效方式会提高显存的使用量，$K^2$倍，$K$为卷积核大小。

## CNN卷积运算
[torch cnn blog](http://blog.csdn.net/shenxiaolu1984/article/details/52373174)
