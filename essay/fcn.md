# Fully Convolutional Networks for segmantic segmentation 2015
## abstract
修改AlexNet,VGGnet,GoogLeNet为全卷机网络，实现网络像素的端到端的训练。
## introduce
patchwise training and fully concolutional training?
语义分割自身就有一个争端在semantics和location上，  
介绍了一种'skip'结构，来连接深层语义信息与浅层appearance信息。
DAG：directed acyclic graph，有向无环图
## related works
fully concolutional networks: 历史上全卷积网络的出现及使用  
dense prediction with convnets: 
## fully convolutional networks

### upsampling is backwards strided convolution
backwards convolution(也叫作deconvolution，反卷积)
## segmentation architecture
使用multinomial logistic loss 多项分布($n\geqslant 2,k\geqslant 2$)，就是一个有k个输出的实验，独立地重复n次。