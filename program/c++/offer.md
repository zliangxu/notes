## 数据结构
- [满二叉树，完全二叉树，堆](http://bubkoo.com/2014/01/14/sort-algorithm/heap-sort/)
    满二叉树：所有层都输满的  
    完全二叉树：除了最后一层，所有层都是满的
- 二叉搜索树(binary search tree,BST,二叉搜索树,二叉排序树)是一种特殊的二叉树，它的左子节点比根节点小，右子节点比根节点大
- 红黑树(RBTree, Red Black Tree)是一种**近似**于平衡的二叉查找树，查找操作时间复杂度为O(log(N))
- 哈希表(Hash Table)是根据关键码值(key)而直接进行访问的数据结构，查找时间复杂度为O(1)，但内存消耗比红黑树大，std::unordered_map类
- 自平衡的二叉搜索树(AVL树(发明人名字缩写)，高度平衡树)，时间复杂度，插入O(log(N))，查找O(log(N))，删除O(log(N))
- 二叉堆(完全二叉树)分为最大堆，最小堆。时间复杂度，插入O(log(N))，查找最大值、最小值O(log(1))
    最大堆中的父节点都大于等于孩子节点
    最小堆中的父节点都小于等于孩子节点。
    最大堆调整
    堆排序
    创建最大堆
    创建、插入、删除
    std::pop_heap()，将最大值移入vector最后一个元素


## 算法
- 分治法
- 快速排序算法，Partition()
    时间复杂度，平均O(nlog(n))次比较，最坏情况O(n^2)。
    空间复杂度，平均O(log(n))，最坏O(n)，是递归调用次数，因为递归会消耗栈
- 动态规划，基于递归的方式分析问题，基于循环的方式编码。自下而上分析。
- 递归，自上而下分析问题。

## STL
- std::set, std::multiset，根据特定的排序准则，自动将元素进行排序。前者元素不能重复，后者元素可以重复。
```cpp
template<
    class Key,
    class Compare = std::less<Key>, // 降序，仿函数
    class Allocator = std::allocator<Key>
> class multiset;

// exception
#include <stdexcept>
// throw exception("error message"); //无字符串参数的构造函数
throw runtime_error("error message")
```

