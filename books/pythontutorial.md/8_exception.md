# 异常
dir()

## 捕捉异常
一个异常，如果一直没有被处理(捕捉到)，就会向调用方传播，直到主程序，如果依然没有被捕捉，程序会带着**栈跟踪**终止
```python
try:
    x = input('enter x')
    y = input('enter y')
    x / y
except ZeroDivisionError:   # 捕捉除0异常
    if flg == 1:
        pass
    else:
        raise               # 引发异常
except:                     # 空的，捕捉Exception类(包括子类)的所有异常            
    pass        
else:                       # 无异常，则运行
    pass
finally:                    # 不管异常是否发生，本段代码一定执行
    pass
```