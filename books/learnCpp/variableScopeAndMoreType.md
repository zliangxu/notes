## 1. blocks
> keep number of nested blocks to at most 3    

变量属性: scope 、 duration   、 linkage
A variable’s linkage determines whether multiple instances of an identifier refer to the same variable or not  
Local variables have block scope (they are only visible within the block they are declared), and have automatic duration (they are created at the point of definition and destroyed when the block is exited). 
> Rule: Define variables in the smallest scope possible.

## 2. global variable and linkage
全局变量的属性 
- static duration，指当程序开始运行时，它被创建，当程序结束时，才被销毁
- file scope(global scope, global namespace scope)
```c++
::value  // 在一个block内，当局部变量与全局变量标识符相同时，可以使用 全局运算符(::)，来指示一个全局变量，而不是 local variable
// 全局变量，最好以 g_ 开头 
```

A variable with internal linkage is called an internal variable (or static variable).  
A variable with external linkage is called an external variable.

Variable forward declarations via the extern keyword

extern 关键字有两个作用  
- give the variables external linkage， non-const global默认的具有 external linkage， const变量默认不具有 external linkage，可以使用extern显式的说明
- forward declaration表示它是一个在其它文件定义过的external variable


Function linkage

常量变量最好不要定义在头文件中，因为每一次修改常量值，都会导致所有包含该头文件的.cpp重新编译一遍