# squeezenet: alexnet level accuracy with 50x fewer parameters and <0.5 Mb model size 2016

## abstract
模型小的优点

## introduction and motivation
模型小训练更快，更容易从云平台发布，FPGA可用

## related work
- model compression:剪支(参数阈值)、SVD预训练、量化
- cnn microarchitecture: higher level building blocks or modules
- cnn macroarchitecture(宏架构): ResNet，highway net
- neural network design space exploration: design space exploration

## squeezeNet
### architecture design strategies
- replace $3\times 3$ with $1\times 1$ filters
- decrease input channels to $3 \times 3$ filters
- delayed downsample   

通过设计的fire module来实现上述三个策略

### fire module
并没有什么新意

## evaluation of squeezeNet
对AlexNet使用模型压缩不如直接使用squeezeNet，就是说，与其使用模型压缩减小模型参数，不如重新设计参数量更少的模型。
并且小模型也适用于做模型压缩，如deep compression

## conclusions

