[例子](https://zhuanlan.zhihu.com/p/29024978)

使用pip安装的pytorch
import pytorch
使用anaconda安装的pytorch
import torch

# Variable
Variable是torch.Tensor的打包，大部分Tensor的操作，Variable都是支持的。对于一个操作(op)，如果它的输入存在一个是required_grad=True，那么它的输出就是required_grad=True的，只有当输入全部是required_grad=False时，输出才required_grad=False的。而Variable()构造操作，默认的required_grad=False，而网络参数的类型也是Variable，热它默认的required_grad=True，所以对于网络内的前向传播是有梯度记录的。

## 保存和加载整个模型
torch.save(model_object, 'model.pkl')  
model = torch.load('model.pkl')

## 仅保存和加载模型参数(推荐使用)
torch.save(model_object.state_dict(), 'params.pkl')  
model_object.load_state_dict(torch.load('params.pkl'))


## 选择GPU
```python
import os
os.environ["CUDA_VISIBLE_DEVICES"] = "1" # gpu
```
## pytorch
```python
# Sets the module in evaluation mode. This has any effect only on modules such as Dropout or BatchNorm.
# 具体的是设置　module.training变量为False，及子module的training变量为False，在模型内使用是self.training
model.eval()
# dropout 层直接在网络定义里添加
# 规则项在optim里又，不过默认系数为0
```

## 可视化
visdom  
tensorboard

## Tensor
```python
# 增加维度、减维度
a.squeeze() #默认移除所有size为1的维度，也可以指定维度。
a.unsqueeze()
a[None,:,:,:]

# 类型转换
# type_as() 不起作用？
a.type()
a.float()
torch.FloatTensor() # 内部是float类型，而不是floatTensor()?

# tensor转矩阵
numpy()
from_numpy()
```
## tips
验证的时候模型的输入应该是
```python
# 保证没有梯度求解，以防止浪费计算量，以volatile为输入的网络，都不会计算梯度，should be used in inference time
Variable(in, volatile=True) 
optimizer 返回的是Variable，Variable.data是FloatTensor， Variable.data[0]是float类型
(<class 'torch.autograd.variable.Variable'>, <class 'torch.cuda.FloatTensor'>)
```

## 使用问题
- 定义模型后，调用model.cuda()会卡住，网上找的原因是cuda版本与pytorch版本不兼容  
重新安装pytorch解决


## 使用源码安装，Import有错
- 问题描述： 
```python
>>> import torch
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/home/lxg/anaconda2/lib/python2.7/site-packages/torch/__init__.py", line 53, in <module>
    from torch._C import *
ImportError: /home/lxg/anaconda2/lib/libstdc++.so.6: version `GLIBCXX_3.4.21' not found (required by /home/lxg/anaconda2/lib/python2.7/site-packages/torch/lib/libshm.so)
```
- 解决方法：
conda install gcc，不要在pytorch的源代码目录下使用pytorch
