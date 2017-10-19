## 列表 List, Mutable(可变数据类型)
方法： 这个类定义仅对于它启用某个函数。  
字段：它是只为该类定义且只为该类所用的变量。
```python
shoplist = ['apple', 'mango', 'carrot', 'banana']
# 使用索引(index, [])运算符 

```

## 元组 Tuple, unMutable
元组通常用于保证某一语句或某一用户定义的函数可以安全地采用一组数值，意即元组内的数值不会改变。
```python
a = ('1', '2', '3')
# 使用索引(index, [])运算符 
# 对于只有一个项目的元组，为了避免表达一个被括号环绕的对象的歧义，必须后接一个逗号，如
b = ('4',) 
```

## 字典 Dictionary
将键值(keys) 与 值(values) 联立到一起的结构。键值必须是唯一的，并且只能是不可变对象。
```python
ab = {
    'Swaroop': 'swaroop@swaroopch.com',
    'Larry': 'larry@wall.org',
    'Matsumoto': 'matz@ruby-lang.org',
    'Spammer': 'spammer@hotmail.com'
}
# 使用索引运算符
ab['Larry'] 
```
## 序列
列表、元组、字典都属于序列。序列的主要功能是**资格测试**(membership test，即 in 与 not in 表达式)，和索引操作。序列还支持**切片**(slicing)运算符
```python
# 切片操作可以指定初始位置、结束位置、步长(缺省时为1)
a[::2] 
```

## 集合 Set
集合（Set）是简单对象的无序集合（Collection）。当集合中的项目存在与否比起次序或其出现次数更加重要时，我们就会使用集合。  
可以验证一个集合是否为另一集合的子集，用于求两个集合的交集、并集等
```python
bri = set(['brazil', 'russia', 'india'])
```

## 引用
对于序列对象制作副本时，必须使用切片操作，否则生成的只是原对象的引用，即变量名只是指向你计算机内存中存储了相应对象的那一部分。这叫作将名称绑定（Binding）给那一个对象。

