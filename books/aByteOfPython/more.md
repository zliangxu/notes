## 传递元组  

## 特殊方法
```python
__init__()
```

## 单语句块
避免使用

## lambda表格
从本质上说，lambda 需要一个参数，后跟一个表达式作为函数体，这一表达式执行的值将作为这个新函数的返回值。
```python
points = [{'x': 2, 'y': 3},
          {'x': 4, 'y': 1}]
points.sort(key=lambda i: i['y'])
print(points)
```

## line comprehension(列表推导)
```python
listone = [2, 3, 4]
listtwo = [2*i for i in listone if i > 2]
print(listtwo)
```

## assert
当失败时，会报错

## 包装器
decorators