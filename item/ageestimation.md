mAP: average precision
adience benchmark for age and gender estimation
feret benchmark：数据是在统一的条件下采集的，条件比较理想
labeled faces in the wild(LFW) benchmark
作者说是由于神经网络在人脸识别领域的突出表现，才想应用于年龄估计、性别识别

[modle download](http://www.openu.ac.il/home/hassner/projects/cnn_agegender/)
adience dataset accout:
user: adiencedb
password: adience

## multi-view face detection 
提出全连接转为卷积的方法，生成heat map，由于训练集中包含各种方向的脸所以，训练模型可以检测任意方向的脸
基于AlexNet进行修正
deep dense face detector(DDFD)
- fine-tunning a pre-trained AlexNet for face detection
    AlexNet 共８层网络，前５层是卷及网络，后３层是全连接网络
    [14] 作者通过改变网络层的参数把全连接网络的计算方式转成了卷积网络 
    非极大值抑制确定脸的位置
    把图像进行了缩放以检测不同尺度的目标
    通常，脸部定位可以通过bounding-box regression的方法进一步改善精度，通过实验并没有得到改善，论文中并没有添加此步骤
- sliding window approach

数据集: AFLW dataset   21K images with 24K face annotation
论文中作者使用镜像、旋转等技术扩充数据集，使数目达到200K positive 和　20millions negative examples, size为227*227
selective search: image segmentation technique
bounding-box regression
deformable part models

[全连接转为卷积网络](http://blog.csdn.net/zizi7/article/details/49506979)
方式：与卷积层的稀疏连接和权值共享不同，全连接层的每一个神经元都和上一层的所有神经元相连接。但是，无论卷积层还是全连接层都是通过上一层的输出与参数矩阵相乘的方式得到下一层的输出，所以可以通过改变全连接层的参数的排列形式将全连接转化为卷积层。
假设最后一个卷积层的输出为7*7*512，即512个7*7的feature map，连接次层的是1*1*4096个神经元的全连接层，可通过如下方式转换。设计一个卷积层，其有4096组滤波器，每组滤波器有512个滤波核，每个滤波核的大小为7*7，这样进行卷积后就得到4096个1*1的feature map。
意义：因为卷积网络是对输入图像的遍历窗口与卷积核的乘积，遍历步骤使输出结果成为一幅图像。通过全连接转为卷积，使AlexNet的５层卷积＋3层全连接转为全部是卷积网络，这样对于一幅输入图像，通过AlexNet后得到的依旧是图像，即heatmap

### [14] DenseNet: implenting efficient convnet descriptor pyramids
本篇论文提出了DenseNet，主要为了避免因为选框的重叠区域而造成重复计算，而设计的 denseNet feature descriptors　提取方法
    
- multiscale image pyramids for cnns
    把不同金字塔拼接在了一幅图像上，做完特征提取，再分解
- data centering
    [4] cnn classifier减去了一个从ImageNet获取到的 mean image, mean image 是由数据集计算平均得来的，
    作者这里使用了一个从mean image计算得到的RGB mean pixel，准确率降低0.2%，可以忽略
- aspect ratios(长宽比)


#### [4] Alexnet: imagenet classification with deep convolutional neural networks
5层卷积、３层全连接  
从3*227*227输入  
local response normalization 局部归一化公式  

$${b}^{i}_{x,y}={a}^{i}_{x,y}/{(k + \alpha\sum_{j=max(0,i-n/2)}^{min(N-1,i+n/2)}{{a}^{j}_{x,y}}^2)}^2$$

[batch normalization](http://blog.csdn.net/hjimce/article/details/50866313)


#### [4] CaffeNet
[cffenet network](http://blog.csdn.net/sunbaigui/article/details/39938097)
