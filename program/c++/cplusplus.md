[cppblog](http://cppblog.com/)
------

## 关键字
- explicit: 使用explicit修饰的构造函数不能使用转换构造函数进行隐式准换

- 转换构造函数： 当一个类的构造函数只有一个参数，并且该参数不是本类的const引用。

## 二维数组  double (*a)[N]; // N为常数，a即二维数组指针变量。，但是不能把第二维或者更高维的大小省略
### 常用库 
- boost  
    是一个可移植、提供源代码的C++库，作为标准库的后备，是C++标准化进程的开发引擎之一。  
    逻辑错误：结果与理想不匹配  
    语法错误：编译不通过  
    运行时错误：除数为0类似的错误  
- sqlite  
    轻量型数据库

- [A*](http://grinninglizard.com/MicroPather/index.htm)

### 捕获异常
```cpp
try{
    // 可能抛出异常的语句
}
catch(exceptionType variable){
    // 处理异常的语句
}
```
### 仿函数
仿函数(functor)又称为函数对象(function object)是一个能行使函数功能的类，使一个类看上去像一个函数。仿函数的语法几乎和我们普通的函数调用一样，不过作为仿函数的类，都必须重载operator()运算符，即函数调用运算符

### std::bind
### boost::bind

### class的静态成员

[静态成员 常量类型](http://www.cnblogs.com/wanyuanchun/p/4041080.html)
> class静态成员函数
- static void classmember()  
静态成员函数不能访问非静态成员、非静态成员函数，因为静态成员函数没有省略的形参this  
静态成员函数能够使用类名::函数名的形式访问，普通函数需要使用类的对象名  
静态成员函数不能被同时声明为const、virtual或volatile类型
> class静态成员变量
- static int tmp;  
静态成员变量的初始化不能放在构造函数、初始化列表内，要在类体外
静态成员变量可以成为普通函数的可选参数，而普通成员变量不可以