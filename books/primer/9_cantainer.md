所有容器都共享公共接口，不同容器按不同方式对其扩展
## 顺序容器
- vector
- deque   双端队列
- list    双向链表
- forward_list    单向链表
- array   固定大小数组，与内置数组相比，array是一种更安全、更容易使用的数组类型
- string  与vector类型相似，但专门用于保存字符



## 容器适配器
容器、迭代器、函数都有适配器，它是一种机制，使某种事物的行为看起来像另外一种事物
- stack     栈：先进后出
- queue     队列：先进先出
- priority-queue 优先级队列


## 容器操作函数
- swap(a,b)  
    统一使用非成员版本的swap是一个很好的习惯  
    除array外，操作保证会很快，因为元素本身并未交换，只是交换了两个容器的内部数据结构，而array会真正交换元素。　　
- .emplace()  
    该成员函数接收的是构造函数参数，emplace函数使用这些参数在容器管理的内存空间中直接构造元素。
- .push_back()
    会创建一个临时对象，并将其压入容器中。