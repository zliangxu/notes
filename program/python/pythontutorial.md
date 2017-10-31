# [python tutorial 参考手册](https://docs.python.org/3/tutorial/index.html)
### 注释
```python
#在文件头加下面的注释，可以让文件直接运行
#!/usr/bin/env python3

#表示.py文件本身使用标准UTF-8编码，这样才支持在源代码文件中出现中文  
# -*- coding: utf-8 -*-
```
### 换行符
\

# 基础
- 运行.py文件  
  python name.py
- 把包(也可以是包里的一个类)导入并换个名字      
  import PACKAGE as NAME   
- 把包里的一个函数导入  
  from PACKAGE import NAME
## 语句
- iter  
迭代
- enumerate  
想在迭代一个序列的同时跟踪正在被处理的元素索引。

## 循环
- 第一种 for循环
```python
for xx in xxx:
  xxx
print(xxx)
```
- 第二种 while循环
```python
while n < 10
  n = n + 1
print(n)
```
## 函数
```python
def
``` 
## 模块
一个.py文件就称之为一个模块(module)。  
为了避免模块名的冲突，可以按目录的形式来组织模块，称为包(package)，在包里调用模块可以直接用package.module表示，每个包(目录)里必须存在一个__init__.py文件，可以是空。  
导入模块
```python
import NAME     #不需要.py后缀名
```

## 数据结构
type(data) //返回数据类型  
**list** : 一种有序列表，元素访问符号[]。  
**tuple**: 元组，一种有序列表，一旦初始化就不能更改(指向元素的指针地址不变，但指向元素的值还可以变)

## 面向对象编程
- 类和实例
  class   
  在类中定义的函数，第一个参数是self， 它指类本身，

## tricks
- 魔法命令 %matplotlib inline 可以把matplotlib嵌入到booknote之中
## QAQ:
- IOError: [Errno 2] No such file or directory: '../data/mnist.pkl.gz'
  vscode下单步无法代开文件？？

4. More Control Flow Tools
    - 4.4 break and continue statements, and else clauses on loops
        else在循环列表执行完毕时会执行
    - 4.5 pass
    - 4.6 def
        函数定义下面的第一行是docstring，函数注释

5. data structure  
    - list  []  
        lambda返回的是函数，定义形式：   
        ```python
        lambda arguments: expression
        #上面表达式的含义是
        def <lambda>(arguments):
                return expression
        ```
    - del
    - tuples () and sequences
        tuples are immutable，即不支持元素赋值操作
    - sets {}或者函数set()
    - dictionaries 配对方式，key: value，键值不允许有重复
    - looping techniques

6. modules  **package是文件夹，module是.py文件**  
    一个.py文件是一个module；模块内可能包含可执行语句、函数定义，可执行语句被用于初始化模块，只有当第一次import时，才会执行.  
    一个模块只能被导入一次，改变module后，重新导入模块时要用importlib.reload()，而直接import会失败  
    如果在module末尾加上  
    ```python
        if __name__ == "__main__":
            import sys
            FUNCTION(sys.argv[1])
    ```
    那么它可以直接直接调用 python module FUNCTION canshu
    - more on modules
        * executing modules as scipts
        * the module search path
        * compiled python files
    - standard modules
        sys.path是从环境变量PYTHONPATH中初始化的，未定义PYTHONPATH时，从built-in-default中初始化。
    - dir() function
        输出模块的所有定义，variables、modules、functions...
    - packages
        __init__.py

7. inputs and outputs
    - fancier output formatting
    - reading and writing files

8. errors and exceptions
9. classes
10. brief tour of the standard library
11. brief tour of the standard library2
12. virtual environment and packages

Python基础  
     数据类型和变量  
          python是动态语言，指变量本身类型不固定，与之相对的是静态语言，指定义变量时必须指定变量类型。 
          理解变量在内存中的存储形式。  
          语句结尾冒号指，下一个缩进是一个语句块  
     字符串和编码  
          中文：GB2312编码  
          统一编码：unicode  
          可变长编码：utf-8  
          计算机内存中，统一使用unicode编码，当需要保存到硬盘或传输时转换为utf-8
               #!/usr/bin/env python    
               # -- coding: utf-8 -*-       //指定文本编码方式
          格式化输出中 %d、%s……是占位符    
     使用list（列表）和tuple（元组）    
     条件判断    
     循环 ctrl + c退出程序    
     使用dict（字典）和set（）    
          dict的内部存放顺序与放入的顺序是不同的，用到哈希算法    
函数  
     调用函数：函数名其实就是指向一个函数对象的引用，完全可以把函数名赋给一个变量，相当于给这个函数起别名。
     定义函数：pass，空语句占位符；函数返回值是一个tuple；
     函数的参数：默认参数要指向不变对象。
