# 字典
列表通过序号对值进行引用，映射通过名字来引用值。字典是python中唯一的內建映射类型。键(key)可以是数字、字符串、元组。

## 使用
是为了方便通过查找某个特定的词语(键)来找到它的定义(值)。

## 创建
键是任意的不可变类型，键是唯一的。
```python
clear()
copy()                  # 浅复制，deepcopy()深复制
fromkeys()              # 建立dict
get()                   #
has_key()
ites(),iteritems()
keys(),iterkeys()
pop()                   # 弹出给定键值的项
popitem()               # 随机弹出一项
setdefault()            # 在不含有给定键的情况下设定键值
update()
values(),itervalues()
```