# flow-guided feature aggreation for video object detection 2017

## abstract

## introduction
- box level modthods  
通过对静态图片做目标检测，然后根据视频中目标的连贯性来做视频目标检测的方法，即预测框的后处理。
- feature level methods  
如FGFA一样的，通过提取特征辅助相邻帧的目标检测  
- FGFA包括  
feature extraction, flow estimation, feature aggreation, detection

## related work
视频跟踪与视频目标检测不同，主要体现在视频跟踪需要提供目标的初始位置，并且视频跟踪不需要预测目标类别。

## flow-guided feature aggreation
### a baseline and motivation
### model design
- flow-guided warping
先使用FlowNet计算$i,j$帧之间的光流，然后使用双线性插值计算第$j$帧图像的特征图到第$i$帧图像特征图的映射特征。
- feature aggreation
> $$\bar f_i=\sum_{i-K}^{i+K} w_{j\rightarrow i}\cdot f_{j\rightarrow i}$$
其中，$K$表示使用前、后相邻$K$帧图像的特征图来辅助当前帧$i$中的目标检测，$w_{j\rightarrow i}$表示其它帧图像特征到第$i$帧图像特征的$2D$权重，即不同位置的权重不同，而不同通道的权重相同。它很类似于注意力机制？
- adaptive weight  
使用cosine计算$j$与$i$帧特征的相似度来确定权重的大小，这里的特征是embedding后的(即内容相同的另一种表达)

### network architecture
- flow network  
使用Flying Chairs dataset预训练，输出stride为$4$，而目标检测特征图的输出stride为$16$，所以降采样$1/2$

## conclusion and future work
主要在特征层面对视频目标检测进行改进。
遗留问题
- 速度慢，可以使用轻量化网络代替
- 使用其它聚合方法，以替换注意力机制模型，以改善内存的使用

## tips
- without additional bells-and-whistles  
没有使用其它技巧，比如，这里没有使用模型集成、多尺度训练等。