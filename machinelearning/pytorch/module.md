## Parameter类
继承自Variable，它有一个特殊的属性是当赋值为类的属性时，属性会自动添加到parameter list？，从而让它出现在Module.parameter返回的迭代器中。不过Parameter没有volatile类型，默认需要求导。  
类内有个方法，
```python
# __new__方法始终是静态方法。
# 面向对象的实例化步骤：创建实例对象(new)->初始化实例对象(init)->最后返回实例对象
def __new__(cls, data=None, requires_grad=True):
    return super(Parameter, cls).__new__(cls, data,requires_grad=requires_grad)
```

## Module类
初始化函数
```python
def __init__(self):
    self._backend = thnn_backend
    self._parameters = OrderedDict() # 存储模型学习参数的有序字典
    self._buffers = OrderedDict() # 存储模型状态参数的有序字典
    self._backward_hooks = OrderedDict()
    self._forward_hooks = OrderedDict()
    self._forward_pre_hooks = OrderedDict()
    self._modules = OrderedDict() # 存储模型所有Module的有序字典
    self.training = True
```
绑定方法
```python
__setstate__() # 魔法方法
__setattr__() # 魔法方法
__getattr__() # 魔法方法
__delattr__() # 魔法方法

apply() # recursisively，可用于初始化网络参数

register_buffer() # 用来存放不需要学习的参数，如BatchNorm中的running mean，是用来记录均值、方差，并在最后计算整体均值、方差用到的
register_parameter() # 
register_backward_hook() # 应该与计算图的建立有关
register_forward_pre_hook() # 
register_forward_hook()

state_dict() # 返回包含Module状态的字典，包括parameter和persistent buffers
named_parameters()  # 所有的parameter参数生成器
named_children()  # immediate children modules，直接子模块，网络的属性
named_modules()  # 所有的子模块，类型是module的生成器
```
