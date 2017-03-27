python
------
[廖雪峰python](http://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000)
### 注释
```python
#在文件头加下面的注释，可以让文件直接运行
#!/usr/bin/env python3

#表示.py文件本身使用标准UTF-8编码  
# -*- coding: utf-8 -*-
```
### 函数
### 模块
一个.py文件就称之为一个模块(module)。  
为了避免模块名的冲突，可以按目录的形式来组织模块，称为包(package)，在包里调用模块可以直接用package.module表示，每个包(目录)里必须存在一个__init__.py文件，可以是空。  
导入模块
```python
import NAME     #不需要.py后缀名
```
