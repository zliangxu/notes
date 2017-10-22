Raise 抛出异常
ErrorHandler 错误处理器
## try 
```python   
try: # 提出异常
    pass
except EOFError:  # 捕捉异常
    pass
else:   # 正常情况
    pass
```
## finally
在 try 块中获取资源，然后在 finally 块中释放资源是一种常见的模式。因此，还有一个 with 语句使得这一过程可以以一种干净的姿态得以完成。

## with
with 语句所使用的协议（Protocol）。它会获取由 open 语句返回的对象，在本案例中就是“thefile”。