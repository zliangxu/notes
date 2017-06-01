## 1. about this book
• Input/output (I/O) classes
• String types and regular expressions
• Various data structures, such as dynamic arrays, linked lists, binary trees, and hash tables
• Various algorithms, such as a variety of sorting algorithms
• Classes for multithreading and concurrency
• Classes for internationalization support
• Numeric classes
• Plenty of utilities

class 
inheritance
templates 
exception handling
namespace

## 2. introduction to c++ and the standard library
c++98 　第一个标准
c++03 　技术修正(technical corrigendum,TC)
TR1   　容器库扩展(std::tr1,2007)
c++11　　第二个标准

Big-O notation(Big-O标记)
算法复杂度度量，将一个算法的运行时间以输入量n的函数表示。
有些复杂度被称为amortized(分期摊还)，指长期而言大量操作将如上述描述般进行，但单一操作可能花费比平均值更长的时间。

## 3. new language features
- vector<list<int>> c++11开始允许可以不在">>"中添加空格
- nullptr c++11中添加的一个关键字，它可以自动转换成被赋值的指针类型(std::nullptr_t)
- auto 添加新特性，需要初始化，根据初始值推断数据类型
- c++一致性初始化，任意数据类型，使用初值表，形式为变量名+花括号{}
    对于自定义的类型，可以使用std::initializer_list<> vals来扩充接收列表初始化的能力
    初始化值不能出现narrowing，如下
```c
int x1(5.3);         //ok,x1被初始化为5
int x2{5.3};         //error,不被初始化，
vector<int> x3 = {1,2};  //这种是什么赋值 
```
- range-based for loop
- nonexcept 使函数不能throw
- constexpr,使语句在程序编译期时执行
- lambdas
    也称为匿名函数，有函数体，没有函数名，首次在lisp语言中使用，最常用的是作为回调函数
    函数对象能维护状态，但语法开销大，而函数指针语法开销小，却没法保存范围内的状态。
- decltype, 返回语句的数据类型，是typeof的替代
- new function declaration syntax
- scoped enumerations

