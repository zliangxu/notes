convolution and pooling
------

## tips
特征就是在自编码网络中使各个隐藏层神经元激活度最大的数据。

## convolve
前面的网络都是全连接网络，而为了模仿生物学里面的视觉系统结构，可以使用部分连通网络，具体形式就是小窗口，也就是卷积。那么由前面的自编码提取特征可知，卷积也是在提特征。

## pooling
包括平均池化、最大池化。  
使特征具有平移不变形。

## exercise
