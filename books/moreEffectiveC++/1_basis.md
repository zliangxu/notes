基础议题
-----
1. 仔细区别pointers和references
- references必须初始化
- 没有null referecnce，但是有null pointer
- pointers 可以被重新赋值，指向另一个对象，而reference不能。

2. 最好使用C++转型操作符
- static_cast< type >(expression) 与c型旧式强制转型符相同(type)(expression)，编译时期转换。
- const_cast< type >(expression) 去除express的常量性
- dynamic_cast< type >(expression) 对指针、引用进行类型转换。运行时期转换。只对涉及继承机制的类型执行转型动作，向下转型或跨系转型
- reinterpret_cast< type >(expression) 不具有可移植性，转移函数指针的类型

3. 绝对不要以多态的(polymorphically)方式处理数组  
    继承的重要性质之一是可以通过指向base class objects的指针或引用来操作derived class objects。如此的指针或引用说其行为是**多态**的，犹如它们有多重类型。  
    因为数组是按照“指针算数表达式”来寻址的，即i*sizeof(class)的形式，而这里的class只会是指针的类型，但是他可能会指向继承的类型，这就造成寻址错误。  
    本质上是多态不能和指针算术混用。  

4. 非必要不提供default constructor  
    没有默认的构造函数(即无参数构造函数)，在使用数组和模板时会不方便。  
    如果有默认的构造函数，而默认的构造函数不能完全提供类所需要的参数时，在类的成员函数内就必须检验类数据成员的有效性，这就造成了效能浪费。