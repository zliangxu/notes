python
------
[python3-cookbook](http://python3-cookbook.readthedocs.io/zh_CN/latest/index.html)  
[python Doc](https://docs.python.org/3/)  
[廖雪峰python](http://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000)
### 一些库的reference
[图像处理库 pil](https://en.wikibooks.org/wiki/Python_Imaging_Library)  
[opencv-python](http://docs.opencv.org/master/d6/d00/tutorial_py_root.html)  
[json](https://docs.python.org/3.6/library/json.html)   
[python基础教程](http://www.runoob.com/python/python-tutorial.html)

### 中文支持
```python
# coding=utf-8 
```
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

     
### 软件包的管理pip
- 安装pip  
  sudo apt-get install pip 
- pip安装包
  sudo pip install [PACKAGENAME]
### tricks
- 退出python解释器
    快捷键ctrl+d : end-of-file character
    输入 quit() 或者 exit()？
- 在交互式编程中
    上一次的输出会保存到 '_' 变量中，它是只读的
- 交互环境下调用shell脚本
```python
os.system('./command') #执行当前路径下的命令
```
- python2.7版本在tty里的自动补全功能要自己设置，新版本好像已经默认配置了，不过这样就不能用tab进行缩进了
    (python的环境变量像PYTHONSTARTUP，是自己在～/.profile文件或其中包含的命令下设置的，)
1. 在home目录下创建.pythonstartup文件，复制以下内容到此文件内
```python    
# python startup file  
import readline  
import rlcompleter  
import atexit  
import os  
#tab completion  
readline.parse_and_bind('tab: complete')  
#history file  
historyfile = os.path.join(os.environ['HOME'],'.pythonhistory')  
try:  
    readline.read_history_file(historyfile)  
except:  
    pass  
atexit.register(readline.write_history_file,historyfile)  
del os,historyfile,readline,rlcompleter  
```
2. 在.bashrc文件添加变量
```shell
export PYTHONSTARTUP="/home/xxxx/.pythonstartup"
```
3. 使用命令，结束
```shell
source ~/.bashrc
```



