markdown 语法  ,可以用instant markdown 将页面在线显示在浏览器内，或者访问 http://localhost:8090/
理想的学习环境： http://www.yangzhiping.com/tech/writing-space.html
github markdown: 
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
__粗体__

#### 11. 斜体：文字两端使用一个(*)或一个(_) 

_斜体_
#### 12. 链接：[防文字](放链接地址)，不显示地址，但是可以链接到网页
[百度](https://www.baidu.com/) 
#### 13. 图片: ![description of images](network)
![test]()
#### 12. Markdown 扩展
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