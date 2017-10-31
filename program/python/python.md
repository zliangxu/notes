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
### python 性能分析器
python profiler，可以用于分析python程序每行的耗时
1. cProfile
2. profile
3. hotshot
4. line_profiler

### 调试软件
pdb
     
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
```python
# 1. 在home目录下创建.pythonstartup文件，复制以下内容到此文件内
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
# 2. 在.bashrc文件添加变量
export PYTHONSTARTUP="/home/xxxx/.pythonstartup"
# 3. 使用命令，结束
source ~/.bashrc
```



