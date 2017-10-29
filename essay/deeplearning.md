# science

## supervised learning
SGD之所以称为stochastic是因为每次计算梯度时，都是从整体数据中抽取的一部分样本来估计梯度，这样每一次的估计都伴有随机性地噪声。
线性分类器基于
人工设计的特征，因为提取的特征不具有区分性，对相似的物体没有区分性
非线性特征，如核方法，缺点：没有很好的泛化性能
传统的方法是人工设计特征提取器，但是这肯定没有直接利用算法在数据上自动提取特征方便

## backpropagation to train multilayer architectures
只要模型的输出对于输入与参数的变化是平滑的，就可以使用backpropagation
[model visualization](http://colah.github.io/)

## convolutional neural networks
four key ideas:
1. local connection
2. shared weights
3. pooling
4. use of many layers

## image understanding with deep convolutional networks