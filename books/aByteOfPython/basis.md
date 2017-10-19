## 字面常量(Literal Constants)

## 字符串
- python中没有char类型
- 单引号与双引号(''与"")的作用完全相同，没有任何区别，
- 三引号('''与""")用来指定多行字符串，可以在三引号之间自由的使用单引号、双引号
- 格式化方法
```python
a = 1
print('{0}abcd'.format(a))

# 对于浮点数 '0.333' 保留小数点(.)后三位
print('{0:.3f}'.format(1.0/3))

# 在一个字符串中，一个放置在末尾的反斜杠表示字符串将在下一行继续，但不会添加新的一行。
"This is the first sentence. \
This is the second sentence."
# 相当于
"This is the first sentence. This is the second sentence."

# 原始字符串，用r或R来指原始(raw)，原始字符串会保留转移序列
print(r"Newlines are indicated by \n")
# 会得到
'Newlines are indicated by \n'  # 去掉引号
```
## 变量
变量、函数的名称称为 标识符  
针对面向对象编程语言用户的提示：
> Python 是强（Strongly）面向对象的，因为所有的一切都是对象， 包括数字、字符串与函数。

针对静态编程语言程序员的提示  
> 变量只需被赋予某一值。不需要声明或定义数据类型。

逻辑行与物理行
> 所谓物理行（Physical Line）是你在编写程序时 你所看到 的内容。所谓逻辑行（Logical Line）是 Python 所看到 的单个语句。  
> 显示行连接 \\  
> 在某些情况下，会存在一个隐含的假设，允许你不使用反斜杠。这一情况即逻辑行以括号开始，它可以是方括号或花括号，但不能是结束括号。这被称作 隐式行连接（Implicit Line Joining）