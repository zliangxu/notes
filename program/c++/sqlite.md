跨平台的轻型数据库
----
[官方文档usage](http://www.runoob.com/sqlite/sqlite-c-cpp.html)
搜索 使用示例
[博客usage](http://www.cnblogs.com/5211314jackrose/p/5815935.html)
## 特点
基于c语言写的，支持c++、python、java等多种语言
## 安装
可以直接下载源码编译安装
```shell
./configure
make #把源代码编译成库文件
#把库文件安装到系统目录'/usr/local/lib/'，把头文件安装到'/usr/local/include/'
sudo make install 
```
## 使用
需要把sqlite的语句写入字符串，再把字符串传入sqlite3_exec()函数来执行。字符串的格式要求包括：
- 注释使用 "--和--":或"/* 和 */"
 - sqlite语句以分号为结尾，可以使用‘/’来换行，是字符串内换行？？？。 


```c++
#include <sqlite3.h>
```
## 数据结构
sqlite3：数据库文件打开对象  
sqlite3_stmt：数据库文件操作对象