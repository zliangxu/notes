## 13. 以对象管理资源
资源取得时机便是初始化时机(resource acquisition is initialization,RAII)
因为对象在超出作用域后会自动调用析构函数
- 智能指针的析构函数可以自动的释放内存  
std::auto_ptr<>  
- 引用计数型智慧指针(reference-counting smart pointer,RCSP)｀
std::tr1::shared_ptr


## 14. copy行为
## 15. 对原始资源的访问
## 16. 相同形式　成对使用 new和delete
```c++
new int a[4];
delete []a;
```
## 17. 以独立语句将newed对象置入智能指针
