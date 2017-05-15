## 18. 让接口容易被正确使用，不易被误用

## 19. 设计class犹如设计type
什么是type?
class侧重于自定义的类，type侧重于系统预定义的类(int、char……)，指设计class时，要尤其小心
什么是passed-by-value(以值传递)

## 20. 传引用代替传值
pass-by-reference-to-const代替pass-by-value，
- 可以提升效率，避免了构造函数、析构函数的运行
- 可以避免slicing问题(对象切割)，指传值时，子类会被看做父类，从而子类的新特性，无法再使用
pass-by-reference实际上传递的就是指针
当传递内置类型时、STL的迭代器、函数对象时pass-by-value更有效率
对象小并不意味其copy构造函数不昂贵

## 21. 必须返回对象时，别妄想返回其reference
因为local成员会被析构掉
可以使用行参引用，来避免return

## 22. 将成员变量声明为private
- 可以保证语法一致性，避免区分是否需要小括号
- 可以做到读写权限控制
- 起到封装的作用(成员变量发生变化时，成员函数调用方式可以不更改)
protected并不比public更有封装性，protected可以被继承

## 23. 宁以non-member、non-friend替换member函数
成员函数越多，意味着类数据成员的封装性越差
可以采用将non-member函数与类定义在同一个命名空间内

## 24. 若所有参数皆需类型转换，请为此采用non-member函数
member函数　operator　*的例子，使用non-member函数有更好的实用性

## 25. 考虑写出一个不抛异常的swap函数
pimpl(point to implentation手法)