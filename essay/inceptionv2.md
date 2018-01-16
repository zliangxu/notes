# rethinking the inception module architecture for computer vision 2015
## abstract
分解卷积及更强的规则化技术。  
$5$billion multiply-adds，$25$million参数，使用$4$模型集成，多crop评测，在ImageNet2012上$17.1\%$的top-1错误率

## introduction

## general design principles
作者进行了大量实验得到了以下结论，
1. 避免表达瓶颈　　
想到参加的商品识别kaggle比赛，在最后的分类层，就犯了一个错误，要分$5000$多个类，却只使用$2048$的全连接输出，造成严重的信息压缩，冠军队伍就将这一参数改为了$5270$。

## utility of auxiliary classifiers
添加辅助分类层后，网络训练结果的精度会更高一点，文中分析它起到规则化的作用。

## incetpion-v2
## model regularization via label smoothing
label smoothing regularization
## training methodology
使用RMSPro优化器，使用gradient clipping
## conclutions


# tips
为什么inception模块要放在普通conv2d的后面？？？