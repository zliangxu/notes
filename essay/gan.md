[gan集合](https://deephunt.in/the-gan-zoo-79597dc8c347)
[gan超分辨率](https://yq.aliyun.com/articles/277845)

# generative adversarial nets
## abstract
为估计generative model提出了一个新的框架，它包括两个模型，一个捕获数据分布的生成模型G，一个判别样本是来自于训练数据还是模型G的判别式模型D。模型G训练的目标是让D识别不出样本的来源。当G和D是多层感知机时，可以通过SGD来训练。

## introduction
深度学习的希望在于发现实际产品在应用过程中，遇到的数据的概率分布，如图像、语言。但是到目前为止，重要突破只在于判别式模型，将高维数据映射到低维的标签变量上。深度生成模型的受到的影响很小，关键在于，很难近似极大似然估计和相关策略中的概率计算，也很难使用分段线性激活函数的优点。本篇的GAN能够避开这些缺陷。  
本文中，G和D都是多层感知机。 叫做adversarial nets。

## related work