instant markdown 插件将页面显示在浏览器内，或者访问   http://localhost:8090/      
[理想的学习环境]( http://www.yangzhiping.com/tech/writing-space.html)  
[github markdown](https://guides.github.com/features/mastering-markdown/)   
[markdown在线学习网站](https://stackedit.io/editor)

#### 1.标题： '# + space'表示标题  
# h1
## h2
### h3
#### h4
##### h4
###### h5
#### 2.换行： 在行末输入两个空格，再回车实现换行 
```
  
```  
#### 3.分割线： 在一行中用三个以上的星号(*)、减号(-)，下划线(_),

***
#### 4.文本块：在连续几行的文本开头加入一个tab或四个空格    
    test1
    test2
    test3
#### 5.代码块：使用一对各三个的反引号
```
```
#### 6.文字高亮：使用一对反引号

`高亮，Github无效果`

#### 7. 无序列表:(*)或(-)后跟一个空格
```
* test1  
- test2  
* test3  
```
#### 8. 有序列表：数字后加一个点再加一个空格
```
1. test1
2. test2
3. test3
```
#### 9. 代码高亮：在三个反引号后面加上编程语言的名字，最后以三个反引号结尾
```c++
/*
*@param argc = 1
*@return none
*/
void main(int argc, char **argv)
```
#### 10. 粗体：文字两端使用两个(*)或者两个(_)
__粗体__, **粗体**

#### 11. 斜体：文字两端使用一个(*)或一个(_) 
_斜体_ *斜体*

#### 12. 链接：[显示文字] + (链接地址)，不显示地址，但是可以链接到网页
```
[百度](https://www.baidu.com/) 
```
[百度](https://www.baidu.com/) 
#### 13. 图片: ! + [description of images] + (network_id Or path)
```
![test](image/aa.png)
```
效果  
![test](image/aa.png)
#### 14. 列表：第一行用 '-' 分开，列用 '|' 分开
```
first header | second header
-------------|------------
content form cell 1 | content from cell 2
content in the first column | content in the second column
```
效果
first header | second header
-------------|------------
content form cell 1 | content from cell 2
content in the first column | content in the second column
#### 15. 对齐,不起作用？？？
  :  test1  
  :  test2  
  :  test3

## Markdown 扩展
``` 
Markdown 扩展支持:
 
* 表格
* 定义型列表
* Html 标签
* 脚注
* todo list
* 目录
* 时序图与流程图
* MathJax 公式
```

#### 1.  扩展HTML 字体、颜色、字号设置
markdown本身不支持更改颜色、字体、字号，但是它的扩展HTML支持
```
 - <font face="黑体">黑体字</font>
 - <font face="微软雅黑" size=3 color=#0099ff> face="微软雅黑" size= 3 color=#0099ff </font>
```
效果
 - <font face="黑体">黑体字</font>
 - <font face="微软雅黑" size=3 color=#0099ff> face="微软雅黑" size= 3 color=#0099ff </font>

#### 2. 公式
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>
 
$$x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}$$  
\\(x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}\\)

$1+1=2$

\begin{equation}
F(x)=\int_0^t\sin(t)\mathrm{d}\,t+\left[\lim_{x\rightarrow0}g(x)\times\sum_{m=0}^\infty\frac{(-1)^m}{\Gamma(m+{\color{red}α}+1)}\right]
\end{equation}