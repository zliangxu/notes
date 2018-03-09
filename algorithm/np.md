[matrix67](http://www.matrix67.com/blog/archives/105)
P问题、NP问题等的概念区分是定义在时间复杂度基础之上的，所以要先弄清楚时间复杂度的概念。时间复杂度并不表示一个程序解决一个问题所花的时间，而是当问题规模扩大后(输入数据的多少？比如对于求最大值问题，输入数组的长度)，衡量程序需要的时间长度增长得有多快的量度。

- P问题(polynomial，在多项式时间内可计算出解的问题)
- NP问题(not polynomial，不等价于非P类问题，它定义的是在多项式时间内可以验证解的问题)
- NPC问题(not polynomial complete，NP完全问题，包括两个条件，1.是NP问题，2.所有NP问题都可以约化到它)
- NP-hard问题(NP难问题，只有一个条件，所有NP问题都可以约化到它，但它可以不是NP问题)


## tips
约化(规约)：一个问题A可以约化为另一个问题B，表示问题B的解法同样可以解决问题A。