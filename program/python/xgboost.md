## XGBoost(extreme gradient boosting)
[document](http://xgboost.readthedocs.io/en/latest/model.html#model-and-parameters)

essay: Greedy Function Approximation: A Gradient Boosting Machine, by Friedman.
论文数学公式太多了，并不适合看


cart(classification and regression tree, regression tree, 回归树)
decision trees,决策树
大部分的数据挖掘比赛都是由决策树集成的方法获奖的


## [xgboost API](http://xgboost.readthedocs.io/en/latest/python/python_api.html)
```python
# 基本的数据结构
class xgboost.DMatrix(data, label=None, missing=None, weight=None, silent=False, feature_names=None, feature_types=None)
class xgboost.Booster(params=None, cache=(), model_file=None)

## learning api
# 开始训练
xgboost.train(params, dtrain, num_boost_round=10, evals=(), obj=None, feval=None, maximize=False, early_stopping_rounds=None, evals_result=None, verbose_eval=True, xgb_model=None, callbacks=None, learning_rates=None)¶
# cv: cross-validation,交叉验证
xgboost.cv(params, dtrain, num_boost_round=10, nfold=3, stratified=False, folds=None, metrics=(), obj=None, feval=None, maximize=False, early_stopping_rounds=None, fpreproc=None, as_pandas=True, verbose_eval=None, show_stdv=True, seed=0, callbacks=None, shuffle=True)

# Scikit-Learn对XGBoost做的封装接口
# 回归
class xgboost.XGBRegressor(max_depth=3, learning_rate=0.1, n_estimators=100, silent=True, objective='reg:linear', booster='gbtree', n_jobs=1, nthread=None, gamma=0, min_child_weight=1, max_delta_step=0, subsample=1, colsample_bytree=1, colsample_bylevel=1, reg_alpha=0, reg_lambda=1, scale_pos_weight=1, base_score=0.5, random_state=0, seed=None, missing=None, **kwargs)
# 分类
class xgboost.XGBClassifier(max_depth=3, learning_rate=0.1, n_estimators=100, silent=True, objective='binary:logistic', booster='gbtree', n_jobs=1, nthread=None, gamma=0, min_child_weight=1, max_delta_step=0, subsample=1, colsample_bytree=1, colsample_bylevel=1, reg_alpha=0, reg_lambda=1, scale_pos_weight=1, base_score=0.5, random_state=0, seed=None, missing=None, **kwargs)

# 画图接口
xgboost.plot_importance(booster, ax=None, height=0.2, xlim=None, ylim=None, title='Feature importance', xlabel='F score', ylabel='Features', importance_type='weight', max_num_features=None, grid=True, **kwargs)
xgboost.plot_tree(booster, fmap='', num_trees=0, rankdir='UT', ax=None, **kwargs)
xgboost.to_graphviz(booster, fmap='', num_trees=0, rankdir='UT', yes_color='#0000FF', no_color='#FF0000', **kwargs)
```


## [调参](http://xgboost.readthedocs.io/en/latest/how_to/param_tuning.html)
- overfitting
    当训练数据集的准确率高，验证训练集的准确率低时，说明模型产生了过拟合
    第一种方法直接改变模型参数来降低复杂度，　
        max_depth
        min_child_weights
        gamma
    第二种方法，增加训练数据的噪声
        subsample
        colsample_bytree
        eta: stepsize 同时改变 num_round
-　不平衡数据处理
调整正负样本的权重　scale_pos_weight
max_delta_step = 1  



