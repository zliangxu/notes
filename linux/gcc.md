https://gcc.gnu.org/  
https://gcc.gnu.org/onlinedocs/gcc-6.2.0/gcc/index.html#toc_Invoking-GCC  


## command options
c语言  
-std=   
c++语言  
-std=  

## 段错误

GNU (GNU IS NOT LINUX)
gcc (gnu compiler collection)，gcc是一个混合编译器，目前支持c，c++，fortran，java……，gcc根据文件后缀名判断编译的语言。
     -L 指示编译器第一个搜索(lib)库文件的目录。可以用. 表示当前文件夹
     -c 阻止编译器创建一个完整的程序
     -I (大写 i ) 指示编译器第一个搜索(include)头文件的目录
     -l (小写 L ) 指示连接文件
     -o指定输出文件
gcc编译c++时，需要手动添加链接的库文件，g++才是专门编译cpp的
gcc -l stdc++ helllo.cpp -o a.out

静态库：也作归档文件（archive），按惯例文件名以.a结尾
共享库：惯例文件名以.so结尾。
a.out(assembler output)
查看gcc默认的预设宏定义命令
     gcc -E -dM -</dev/null

## STL
vector definition  
template < class T, class Alloc = allocator<T> > class vector; // generic template
