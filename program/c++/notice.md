[参考](http://blog.csdn.net/hackbuteer1/article/details/7558868)
纯虚函数不用定义，包含纯虚函数的类叫做抽象类，它不能被实例化，但可以定义指向抽象类类型的指针或引用，纯虚函数的参数列表里不能使用const修饰。
虚函数必须被实现，否则编译器会报链接错误。
实现了纯虚函数的子类，该纯虚函数在子类中就成为了虚函数。
虚函数是c++中用于实现多态(polymorphism)的机制，核心理念是通过基类访问派生类定义的函数