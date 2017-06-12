摘要
关键字
1. 引言
文章主要内容，文章结构
2. 软件结构和软件实现方法
算法主要使用了python语言来实现，因为对于数据挖掘，python有易于进行数据处理，数据分析的各种包．这里主要使用了pandas来读写数据，numpy对数据做计算处理，seaborn,matplotlib包做数据分析的可视化．对于算法主要使用了机器学习库sklearn中的ridge回归，还有对各种数据挖掘项目都大放异彩的xgboost库，其次使用了caffe库使用神经网络来做回归
3. 数据描述
数据采用了kaggle比赛中房价预测的数据集(https://www.kaggle.com/c/house-prices-advanced-regression-techniques)，给定房屋的特征属性信息来预测房屋的价格．
数据分析
数据清洗
特征工程

4. 方法或算法
- 线性回归-ridge regression(岭回归)，使用L2 penalty，也就是L2范数
可以让系数变得
线性回归-lasso regression()，使用L1范数，也就是L1 penalty

```
- 逻辑回归
逻辑回归是直接把线性回归的结果再输入到logistic函数上，这样也就把线性回归的输出映射到0-1之间，可以用作分类
一般来说，回归不用在分类问题上，回归是连续模型，受噪声影响比较大
```
- xgboost
树方法

- caffe神经网络
caffe是一个开源的深度学习神经网络框架，


5. 源代码说明
6. 实验结果
7. 组内分工
8. 结论
参考文献


