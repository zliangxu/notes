# stacked convolutional denoising auto-encoders for feature representation 2017

使用dropout与ZCA whitening，训练时是一层一层训练的，文中的网络只有两层。例如，针对某一个数据集，训练第一层时网络输入为原图采样的$9\times 9$的patch，训练第二层网络是输入为第一层输出特征的$2\times 2$的采样。  
训练后的网络对输入数据提取特征，特征向量使用线性SVM做分类。

## abstract
深度网络在图像数据上已经取得了巨大成功，但是是使用监督学习的方式，这样需要大量的训练样本，为了解决这样的问题，要使用无监督学习。  
将图像转换成hierarchical representations，使用layer-wise training，每一层是denoing auto-encoder，为了更好的训练网络，使用layer-wise whitening，最后使用SVM分类。

## introduction
- SAE(stacked auto-encoder):浅层auto-encoder的叠加
- SSAE(stacked sparse auto-encoder):应用在医学图像识别中，取得成功。
- DAE(denoising auto-encoder):在训练阶段，给输入添加扰动，以增加算法对数据噪声的鲁棒性。
- convolutional auto-encoder:
- SCDAE:采用DAE的添加噪声训练的方法，使用卷积网络   
layer-wise training   
patch-wise training:for better training performance??  
ZCA-whitening  
dropout in hiden layer

## related work
auto-encoder
dropout

## scdae
denosing auto-encoder with dropout
overall architecture
