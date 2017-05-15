## 26. 尽可能延后变量定义式的出现时间
尽量延后定义至使用，至有值可以初始化；当在循环代码块的情况下，需要具体比较在循环内、在循环外定义变量的代价

## 27. 尽量少做转型动作
新式转型
const_cast<T>(expression):常量性移除
dynamic_cast<T>(expression)：安全向下转型，用来决定某对象是否归属继承体系中的某个类型
reinterpret_cast<T>(expression)：低级转型，实际动作取决于编译器，具有不可移植性
static_cast<T>(expression)：强迫隐式转换

要倾向于使用新式转型，因为更容易辨识
core dump(核心倾印)

## 28. 避免返回handles指向对象内部成分
references、指针、迭代器都是handles(号码牌，用来取得某个对象)

## 29.为异常安全而努力是值得的