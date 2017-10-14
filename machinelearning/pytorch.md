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

