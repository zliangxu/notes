
## 5. 了解c++默默编写并调用哪些函数
编译器会为每一个class声明：
default构造函数
copy构造函数
copy assignment操作符
析构函数
当这些函数被调用时采用被编译器创造出来

## 6. 禁止使用class自动生成的成员函数
把函数声明为　private，　并且只声明不实现

## 7. 为多态基类声明　virtual　析构函数
工厂函数？
多态基类
多态是指，子类可以对于父类中的函数有不同的实现形式
继承是指，子类可以自动获得父类中的函数

virtual 析构函数 
pure virtual 析构函数　
    形式：virtual 析构函数　= 0
    会导致abstract class，不能实体化的class
带多态性质的base　class应该拥有virtual 析构函数

## 8. 析构函数抛出异常
使用try catch语句捕捉异常，使用std::abort()结束程序

## 9. 构造、析构函数不要有virtual函数
因为virtual函数因为着具体实现是在derived　class内，而此时derived class并不存在
声明为explicit的构造函数不能在隐式转换中使用

## 10. 赋值操作符返回一个引用
为了方便　赋值连锁方式

## 11. operator= 自我赋值安全性、异常安全性
> aliasing (别名):有一个以上的方法指称某对象

## 12. copy复制对象