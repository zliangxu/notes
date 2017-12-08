# binarized neural network: training neural networks with weights and activations contrained to +1 or -1
## abstract
介绍了一种训练BNN的方法，BNN是一种权重系数及激活函数输出都是二值的网络。训练时，二值系数及激活函数输出用于计算梯度。

## introduction
贡献
- 提出一种训练BNN的方法，测试时及训练时，网络系数及激活函数输出都是二值。
- 在torch及theano框架下，做了MNIST、CIFAR-10、SVHN数据集上做实验，并取得了很好的结果。
- BNN极具的降低了运行时间及消耗的内存
- 作者编写了GPU版本的二值矩阵乘积的代码，并公布到网上

## binarized neural networks
