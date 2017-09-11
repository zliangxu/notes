gdb
-----
[linux tools](http://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/gdb.html)  
[cgdb](https://cgdb.github.io/)  

# gdb
- gdb + programName 进入gdb调试模式，q退出。  
- l : 输出代码  
- break + 行数 ： 在第几行设置断点  
- r ： run 运行程序  
- c  : continue 命令  
- n ：单步运行  
- : 进入程序
- p ： print 达因变量  
- bt ：查找函数堆栈  
- q ： 退出gdb  
- 静态程序检测工具  
- 动态程序检测工具  
- 程序调试方法：gdb, printf, core dump, log  

# cgdb
cgdb启动后有两种模式，gdb模式和源码模式。默认打开时是gdb模式，源码模式其实就暗含着cdgb模式

## gdb
- u + line_num: until, 运行到函数
- up :运行
- t： Sets a temporary breakpoint at the current line number.

## 源码模式(cgdb模式下的命令)
- i：从vim框进入gdb模式
- -： Shrink source window 1 line or column (depending on split orientation).
- = ：Grow source window 1 line or column (depending on split orientation).
- _ : Shrink source window 25%
- '+' : Grow source window 25%
- F5 : Send a run command to GDB.
- F6: Send a continue command to GDB.
- F7: Send a finish command to GDB.
- F8: Send a next command to GDB.
- F10: Send a step command to GDB.步入函数


# key
- esc按键 : 从gdb框进入vim框即源码模式
- Ctrl-l :Clear and redraw the screen.

