python
------
[python3-cookbook](http://python3-cookbook.readthedocs.io/zh_CN/latest/index.html)  
[python Doc](https://docs.python.org/3/)  
[廖雪峰python](http://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000)
### 一些库的reference
[图像处理库 pil](https://en.wikibooks.org/wiki/Python_Imaging_Library)  
[opencv-python](http://docs.opencv.org/master/d6/d00/tutorial_py_root.html)  
[numpy](https://docs.scipy.org/doc/numpy/reference/)  
[json](https://docs.python.org/3.6/library/json.html) 
### 软件包的管理pip
- 安装pip  
  sudo apt-get install pip 
- pip安装包
  pip install [PACKAGENAME]
### tricks
- python2.7版本在tty里的自动补全功能要自己设置，新版本好像已经默认配置了，不过这样就不能用tab进行缩进了
    python的环境变量像PYTHONSTARTUP，是自己在～/.profile文件或其中包含的命令下设置的，
- 退出python解释器
    快捷键ctrl+d : end-of-file character
    输入 quit() 或者 exit()？
- 在交互式编程中
    上一次的输出会保存到 '_' 变量中，它是只读的
- 交互环境下调用shell脚本
    os.system('./command') #执行当前路径下的命令
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
#### 循环
- 第一种 for循环
for xx in xxx:
  xxx
print(xxx)
- 第二种 while循环
while n < 10
  n = n + 1
print(n)

### 函数
def 
### 模块
一个.py文件就称之为一个模块(module)。  
为了避免模块名的冲突，可以按目录的形式来组织模块，称为包(package)，在包里调用模块可以直接用package.module表示，每个包(目录)里必须存在一个__init__.py文件，可以是空。  
导入模块
```python
import NAME     #不需要.py后缀名
```

### 数据结构
type(data) //返回数据类型
**list** : 一种有序列表，元素访问符号[]。
**tuple**: 元组，一种有序列表，一旦初始化就不能更改(指向元素的指针地址不变，但指向元素的值还可以变)

### 面向对象编程
- 类和实例
  class
  在类中定义的函数，第一个参数是self， 它指类本身，


### QAQ:
- IOError: [Errno 2] No such file or directory: '../data/mnist.pkl.gz'
  vscode下单步无法代开文件？？


