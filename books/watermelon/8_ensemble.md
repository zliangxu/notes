[bagging boosting stacking](https://stats.stackexchange.com/questions/18891/bagging-boosting-and-stacking-in-machine-learning)
# 集成学习(ensemble)

## boosting，提升算法，串行集成学习
下一个基学习器学习的是当前已有基学习器与真是值的残差，adaboost是一个加法模型、损失函数为指数函数的boost算法。通过弱学习器得到强学习期，也就是能够降低模型预测的偏差。

## bagging(Boost Aggreating的缩写)、随机森林(random forest)，并行集成学习
- 随机抽取样本训练模型的方法为bagging
- 随机抽取样本并随机抽取训练集属性的训练模型的方法称为随机森林
能够降低模型预测的方差

## 结合策略
- 平均法    
    简单平均法
    加权平均法
- 投票法
    绝对多数投票法
    相对多数投票法
    加权投票法
- 学习法
    stacking：使用另一个学习器来结合初级学习器(个体学习器)的输出，用于结合的学习器称为次级学习器或元学习器(meta-learner)

