跨平台的轻型数据库
----
[官方文档usage](http://www.runoob.com/sqlite/sqlite-c-cpp.html)  
[官方文档](https://www.sqlite.org/docs.html)

搜索 使用示例  
[博客usage](http://www.cnblogs.com/5211314jackrose/p/5815935.html)  
[数组](http://blog.csdn.net/xiaoaid01/article/details/17998013)  

## tips
需要把sqlite的语句写入字符串，再把字符串传入sqlite3_exec()函数来执行。字符串的格式要求包括：
- sql语句大小写都可以
- 注释使用 "--和--":或"/* 和 */"
 - sqlite语句以分号为结尾，对于比较长的字符串可以使用‘\’来换行，是c++里的字符串换行。
```c++
#include <sqlite3.h>
```
## 图形化管理界面
```shelll
# 需要sql命令
sudo apt-get install sqliteman  
# 完全图形界面比较好用
sudo apt-get install sqlitebrowser
```
## 特点
基于c语言写的，支持c++、python、java等多种语言

## 安装
可以直接下载源码编译安装，选择 makefile 的版本
```shell
./configure
make # 把源代码编译成库文件
sudo make install  # 把库文件安装到系统目录'/usr/local/lib/'，把头文件安装到'/usr/local/include/'
```
## 数据结构
sqlite3：数据库文件打开对象  
sqlite3_stmt：数据库文件操作对象

## 使用
```c++
// 数据库使用的数据结构定义
sqlite3 *db;
sqlite3_stmt *stat;

// 打开数据库
int sqlite3_open(
  const char *filename,   /* Database filename (UTF-8) */
  sqlite3 **ppDb          /* OUT: SQLite db handle */
);

// sql语句
// sqlite支持的语句 https://www.sqlite.org/lang.html
char *sql = "sql语句"; 

// 将sql语句编译为sqlite内部语言
// 第三个参数一般情况下为-1，表示持续读到第一个为0的字符??
int sqlite3_prepare(
  sqlite3 *db,            /* Database handle */
  const char *zSql,       /* SQL statement, UTF-8 encoded */
  int nByte,              /* Maximum length of zSql in bytes. */
  sqlite3_stmt **ppStmt,  /* OUT: Statement handle */
  const char **pzTail     /* OUT: Pointer to unused portion of zSql */
);

// 如果sql语句中含有'?'，那么在此填充所需要的数据，第二个参数为sql语句中所有'?'的索引，起始值为1，
// 不表示数据库中的第几个数据
// 绑定sqlite语句中需要的数据
int sqlite3_bind_blob(sqlite3_stmt*, int, const void*, int n, void(*)(void*));

// 执行编译好的sqlite语句
// 返回SQLITE_ROW时为执行成功，而不是SQLITE_OK
// 可以循环调用，表示对下一行数据执行相同的操作
int sqlite3_step(sqlite3_stmt*);

// 返回数据库中第iCol列数据的地址，这里可以是数组
const void *sqlite3_column_blob(sqlite3_stmt*, int iCol);
// 返回第iCol列数据所占的字节数
int sqlite3_column_type(sqlite3_stmt*, int iCol);

// sqlite3_stmt析构函数
int sqlite3_finalize(sqlite3_stmt *pStmt);

// 关闭打开的数据库
int sqlite3_close(sqlite3*);
```