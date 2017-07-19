基础议题
-----
1. 仔细区别pointers和references
- references必须初始化
- 没有null referecnce，但是有null pointer
- pointers 可以被重新赋值，指向另一个对象，而reference不能。
2. 最好使用C++转型操作符
- static_cast< type >(expression) 与c型旧式转型符相同(type)(expression)
- const_cast< type >(expression) 去除expres的常量性
- dynamic_cast< type >(expression) 只对涉及继承机制的类型执行转型动作，向下转型或跨系转型
- reinterpret_cast< type >(expression) 不具有可移植性，转移函数指针的类型