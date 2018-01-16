# interpretable R-CNN   ali 2017

## abstract
提出AOGParsing来替代Roi Pooling，

## introduction
目标检测从有很好理论基础的DPM和AOGs models转到具有很高准确率的卷积神经网络上。 这篇文章主要在于目标检测模型的可解释性   
端到端的结合，top-down hierarchical and compositional grammar model, bottom up ConvNets   
RCNN框架包含两个部分，1.roi proposal, 2. roi prediction，本文主要在第二个方面。  
AOG包含三种节点
1. and node, 表示与节点，binary decomposition of large parts into two smaller ones
2. or node, 表示或节点，alternative ways of decomposition
3. terminal node, 表示终叶节点，a part instance
使用AOGParsing 替代Roi pooling  
使用folding-unfolding method来训练AOG和ConvNet，

## related work
解决模型可解释的方法分两个方面  
1. Interpret post-hoc interpretability of deep neural networks 
2. Learn interpretable models directly
贡献3个方面：
1. 将top-down语法模型嵌入到AOG与ConvNet结合，学习目标检测
2. 提出AOGParsing替代roi pooling
3. 性能还好

## problem formulation
### background
- RCNN  
- AOG  
与roi pooling类似，将roi分成$3\times 3$或$7\times 7$的格子，使用$S_{x,y,w,h}$表示非终叶节点，$t_{x,y,w,h}$表示终叶节点



