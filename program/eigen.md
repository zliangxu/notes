[eigen](http://eigen.tuxfamily.org/index.php?title=Main_Page)  
[quick reference](http://eigen.tuxfamily.org/dox/group__QuickRefPage.html)  
一个矩阵运算库
-------

## basics
基本数据结构包括 Matrix Vector，Vector可以看做是行或列为1的Matrix。
Matrix的声明分为静态内存分配和动态内存分配，动态内存分配因为存在内存的变化，所以相对消耗资源多一些。编程时，两种的用法如下L:
```c++
Eigen::Matrix2f m1; //静态内存分配
Eigen::MatrixXf m2(rows, columns); //动态内存分配
```
## 初始化

## table of header
Geometry  
LU  
Cholesky  
Householder  
SVD  
QR  
Eigenvalues  
Sparse  