# sequence modeling: recurrent and recursive nets(循环网络、递归网络)
推荐RNN书籍: Graves, A. (2012). Supervised Sequence Labelling with Recurrent Neural Networks.
time-delay neural networks

## 展开计算图
将循环神经网络展开成具有重复结构的计算图。  
RNN有两种图解释：recurrent graph，unfolded graph 

## recurrent neural network
模型：  
> $$\begin{aligned} a^{(t)}&=b+Wh^{t-1}+Ux^{(t)} \\
h^{(t)} &= \tanh(a^{(t)})  \\
o^{(t)} &= c+Vh^{(t)} \\
\hat y^{(t)} &= \text{softmax}(o^{(t)}) \end{aligned}$$ (10.8 10.9 10.10 10.11)

损失：
> $$\begin{aligned} & L(\{{x^{(1)},……,x^{(t)}\}}, \{y^{(1)},……,y^{(t)}\}) \\
&= \sum_{t} L^{(t)} \\ 
&= -\sum_{t} \log p_{model}(y^{(t)}| \{x^{(1)},……,x^{(t)}\})\end{aligned}$$(10.12 10.13 10.14)
teacher forcing, BPTT(back propagation through time), curriculum learning

## 双向RNN
## 基于编码-解码的序列到序列架构
将输入序列映射到不一定等长的输出序列。
RNN的输入称为“上下文”，
## 深度循环网络
RNN的计算
1. 从输入到隐藏状态
2. 从前一隐藏状态到下一隐藏状态
3. 从隐藏状态到输出状态

## 递归神经网络
与循环神经网络不同，它的构造为深的树状结构而不是RNN(循环网络)的链状结构。

## 长期依赖的挑战

## 长短期记忆和其它门控RNN
门控RNN(gated RNN)，它包括长短期记忆(long short-term memory)和基于门控循环单元(gated recurrent unit)的网络
