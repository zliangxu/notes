queue
--------
- priority_queue
```cpp
/*
template<
    class T,    //排序键值类型
    class Container = std::vector<T>,   //priority_queue是基于别的容器建立的，可以是vector或dequeue……
    
    class Compare = std::less<typename Container::value_type>   
    
    //The behavior is undefined if T is not the same type as Container::value_type
    //Container::value_type，SDL容器的成员变量里有value_type，此处也就是说value_type的类型需要与T一致
    //默认排序是从降序, 也可以是升序std::greater<tpye……>
> class priority_queue;
*/
```