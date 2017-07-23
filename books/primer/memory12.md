## 内存分为静态内存、栈内存、动态内存(堆、heap)
静态内存包括static类型数据、全局变量、(宏定义??)
栈内存包含了局部变量、函数调用中的形参
动态内存指通过new操作符分配得到的heap空间

## 用于实现自动回收动态内存的机制
- shapred_ptr类
类内实现了对使用内存空间的变量的数目的统计，当数目减为０时，自动调用析构函数销毁变量、回收内存
- unique_ptr类
保证了程序中同一时间只有一个变量在使用内存空间，同样自动回收内存