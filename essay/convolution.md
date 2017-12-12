# [A guide to convolution arithmetic for deep learning](https://arxiv.org/abs/1603.07285)

## introduction
- convolution
transposed convolutional layers 也叫做 fractionally strided convolutional layers。  
CNN一般用的就是2D卷积，每一个2D卷积核都是跨输入特征图的所有通道的，即只slide特征图的长和宽。3D卷积核是一个长方体，它的通道数和输入特征图的通道数不同，它slide特征图的长、宽、通道。  
$stride=2$可以看做卷积核移动步长是$2$，也可以看做移动步长是$1$，而输出只保留其中奇数位的数。
- pooling

# convolution arithmetic
卷积输出特征图的大小等于将卷积核置于左上角，然后它的可移动的步长数加上最初始位置($1$)   
half padding(same padding)：是通过padding，让输出与输入的尺度大小一样($stide=1$时？)$p=\lfloor k/2\rfloor$  
full padding：输入的所有可能卷积的都通过padding做卷积。$p=k-1$

不够一个卷积核尺寸做卷积的边缘会被舍弃。
> $$o=\lfloor \frac{i+2p-k}{s}\rfloor+1 \text{  不考虑有dilation的情况}$$ 

## pooling arithmetic

# transposed convolution arithmetic
transposed convolution，也叫作fractionally strided convolutions。是通过将卷积操作的前向与反向替换来工作的。
这部分的第一节讲的深刻。  

反卷积是一种输出与输入的关系正好与卷积操作相反的操作，同时**保持和卷积操作相同的连接关系**。  
maintain the same connectivity pattern。
