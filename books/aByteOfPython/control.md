## if
针对 C/C++ 程序员的提示
> Python 中不存在 switch 语句。你可以通过使用 if..elif..else 语句来实现同样的事情（在某些情况下，使用一部字典能够更快速地完成）。

## while
while 语句同样可以拥有 else 子句作为可选选项。
```python
while(True):
    pass
else:
    print('while is over')
```
else 代码块在 while 循环的条件变为 False 时开始执行——这个开始的时机甚至可能是在第一次检查条件的时候。如果 while 循环中存在一个 else 代码块，它将总是被执行，除非你通过 break 语句来中断这一循环。  
True 和 False 被称作布尔（Boolean）型，你可以将它们分别等价地视为 1 与 0。


## for
else 部分是可选的。当循环中包含他时，它总会在 for 循环结束后开始执行，除非程序遇到了 break 语句。
```python
for ... in  :
    pass
else:
    print('for is over')
```


## break
如果你的 中断 了一个 for 或 while 循环，任何相应循环中的 else 块都将不会被执行。


## continue
跳过本次循环剩余语句，进入下一次迭代