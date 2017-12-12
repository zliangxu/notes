# 更抽象
多态、封装、方法、特性、子类、超类、继承  
多态：来自希腊语，意思是“有多种形式”，对不同对象执行相同的操作，如'+'运算符既可以处理整数相加，也可以连接字符串

issubclass(), isinstance()
```python
class.__dict__                  # 查看对象内所有存储的值，或使用inspect模块
hasattr(class, 'attr')        # 验证对象是否有'attr'特性
getattr(class, 'attr', None)  # 返回对象内的'attr'特性，如不存在，返回None
class example:
    a = 1                       # 这里是类的作用域空间
    def tool():
        self.a = 2              # 这是对象的作用域空间
        print(self.a)           # 访问的是对象的作用域空间
```