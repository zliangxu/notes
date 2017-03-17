# h1
## h2
### h3
#### h4
##### h4
###### h5
```
 
## 4. 代码
 
示例:
 
    function get(key) {
        return m[key];
    }
    
代码高亮示例:
 
``` javascript
/**
* nth element in the fibonacci series.
* @param n >= 0
* @return the nth element, >= 0.
*/
function fib(n) {
  var a = 1, b = 1;
  var tmp;
  while (--n >= 0) {
    tmp = a;
    a += b;
    b = tmp;
  }
  return a;
}
 
document.write(fib(10));
```
 
```python
class Employee:
   empCount = 0
 
   def __init__(self, name, salary):
        self.name = name
        self.salary = salary
        Employee.empCount += 1
```
 
# 5. Markdown 扩展
 
Markdown 扩展支持:
 
* 表格
* 定义型列表
* Html 标签
* 脚注
* todo list
* 目录
* 时序图与流程图
* MathJax 公式
# Welcome to Leanote! 欢迎来到Leanote!
