## 1. 视c++为一个语言联邦


## 2. const
enums　可被拿来当一个　ints　使用(不应该这样用)

## 3. 尽可能使用const
- bitwise constness     conceptual constness
- 因为修改const变量所造成的错误是编译时错误
- const 类型成员函数的声明是在成员函数参数列表后加上关键字const
    在类体之外定义成员函数时，也需要加上const
- 作为一种良好的编程风格，在声明一个成员函数时，若该成员函数并不对数据成员进行修改操作，应尽可能将该成员函数声明为const 成员函数。


## 4. 确定对象被使用前已被初始化
成员初值列表
成员变量是const或regerences的话，需要初值而不能被赋值。
static 对象，其寿命是从被构造出来直至程序结束。
编译单元(translation unit)：指产出单一目标文件的那些源码
跨编译单元之初始化次序问题

