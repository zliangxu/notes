# faceBoxes: a cpu real-time face detector with hight accuracy
[github](https://github.com/zeusees/FaceBoxes)

## abstract
## introduction
## related work
## FaceBoxes
- anchor 密度定义式
> $$A_{density} = A_{scale} / A_{interval}$$
其中，$A_{interval}$就是步长。
- 损失函数  
与Faster R-CNN中的RPN损失相同，是2-class softmax与smooth L1损失
- 训练参数  
SGD,0.0005 权重衰减，batch-size 32，学习率0.001迭代80k次，0.0001迭代20k，0.00001迭代20k次
## experiment
## conclusion

num | layer name        | kernel size   | padding | receptive field | image size | 
----|-------------------|---------------|---------|-----------------|------------|---
-   | input             |               |         |    1            | 3x1024x1024 | 
1   | conv1             | 7x7x24-s4     |    3    |    4            | 256x256x24 |
-   | CReLU             |               |         |                 | 256x256x48 |
-   | Pool1             | 3x3-s2        |    1    |    15           | 128x128x48 |
2   | conv2             | 5x5x64-s2     |    2    |    47           | 62x62x64   |
-   | CReLU             |               |         |                 | 62x62x128  |
-   | Pool2             | 3x3-s2        |    1    |    79           | 32x32x128  |
3   | inception1        |               |         |                 | 32x32x128  |
-   | inception1_1      | 1x1x32        |    0    |    79           | 32x32x32
-   | inception1_2_Pool | 3x3           |    1    |    143          | 
-   | inception1_2_Conv | 3x3x32        |    0    |    143          | 32x32x32
-   | inception1_3_Conv | 1x1x24        |    0    |    79           |
-   | inception1_3_Conv | 3x3x32        |    1    |    143          | 32x32x32
-   | inception1_4_Conv | 1x1x24        |    0    |    79           |
-   | inception1_4_Conv | 3x3x32        |    1    |    143          |
-   | inception1_4_Conv | 3x3x32        |    1    |    207          | 32x32x32
4   | inception2        |               |         |                 | 32x32x128
5   | inception3        |               |         |                 | 32x32x128
-   | output            | 3x3x(2+4)x21  |         |                 |
6   | Conv3_1           | 1x1x128-s1    |         |                 | 32x32x128
7   | Conv3_2           | 3x3x256-s2    |    1    |                 | 16x16x256
-   | output            | 3x3x(2+4)x21  |         |                 |
8   | Conv4_1           | 1x1x128       |         |                 | 16x16x128
9   | Conv4_2           | 3x3x256-s2    |    1    |                 | 8x8x256
-   | output            | 3x3x(2+4)x21  |         |                 |
