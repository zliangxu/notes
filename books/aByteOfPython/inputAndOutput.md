## 用户输入
```python
input()  # 把输入看做一个合法的表达式，相当于 eval(raw_input())，若想接收字符串，需要使用引号
raw_input()  # 把任何输入当做字符串
```
回文： 正反方向看是一样额的文字，如 madam， 而 sir 就不是

## 文件
```python
read()
readline()  # 当返回空字符串时，表示到达了文件末尾
write()
```

## pickle
可以将任何纯 python 对象存入文件，这叫持久的存储对象
```python
pickle.dump(data, file)  # 把data封装(pickling)，写入file
data = pickle.load(file)  # 解封 Unpickling
```

## Unicode
utf-8：统一码、万国码、国际码
[讲解python中的编码的](https://bop.molun.net/15.io.html#fn_1)