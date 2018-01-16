# 自带电池

## 模块
site模块会在python解释器初始化时，自动导入

## 探索模块
```python
help(module)
dir(module)
module.__all__
module.__file__
module.__doc__
```

## 标准库
sys  
os  
fileinput  
set、heap、deque(双端队列)
time  
random
shelve  
re  
- 点号'.'，通配符，只能匹配一个，空格或除换行符外的任意字符
- 对特殊字符进行转义，如对'.'变为'\\.'，双斜线表示对解释器转义，对re模块转义，两个转义
- 字符集'[abc]'，反转字符集'[^abc]'，'^'叫做脱字符
- 选择符和子模式 '(|)'
- 可选项和重复子选项
- 字符串的开始和结尾，脱字符'^'表示开始，'$'表示结尾
