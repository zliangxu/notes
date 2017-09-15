使用pip安装的pytorch
import pytorch
使用anaconda安装的pytorch
import torch

# 保存和加载整个模型
torch.save(model_object, 'model.pkl')
model = torch.load('model.pkl')

# 仅保存和加载模型参数(推荐使用)
torch.save(model_object.state_dict(), 'params.pkl')
model_object.load_state_dict(torch.load('params.pkl'))