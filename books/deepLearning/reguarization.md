规则化是以降低泛化误差而不是训练误差为目的时，对模型做的修改的总称。

## 1.parameter norm penalties
通过使用规则项降低模型容量来提升泛化性能  
- L2规则项  
- L1规则项  
L1规则项有稀疏特性，可以用于特征选择

## 2. Norm as Constrained Optimization

## 4. dataset augmentation
- 朝各个方向平移
- 旋转
- 缩放
- 水平、上下翻转
- 引入输入噪声、隐藏层噪声
- dropout can be seen as a process of constructing new inputs by multiplying by noise
数据增强的划分有很强的主管性，如图像剪切被认为是一种预处理操作而不是增强，通用的对输入添加高斯噪声被认为是一种机器学习算法而不是增强。

## 5. noise robustness

