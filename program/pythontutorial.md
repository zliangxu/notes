# [python tutorial](https://docs.python.org/3/tutorial/index.html)

4. More Control Flow Tools
    - 4.4 break and continue statements, and else clauses on loops
        else在循环列表执行完毕时会执行
    - 4.5 pass
    - 4.6 def
        函数定义下面的第一行是docstring，函数注释

5. data structure  
    - list  []  
        lambda返回的是函数，定义形式：   
        ```python
        lambda arguments: expression
        #上面表达式的含义是
        def <lambda>(arguments):
                return expression
        ```
    - del
    - tuples () and sequences
        tuples are immutable，即不支持元素赋值操作
    - sets {}或者函数set()
    - dictionaries 配对方式，key: value，键值不允许有重复
    - looping techniques

6. modules  **package是文件夹，module是.py文件**  
    一个.py文件是一个module；模块内可能包含可执行语句、函数定义，可执行语句被用于初始化模块，只有当第一次import时，才会执行.  
    一个模块只能被导入一次，改变module后，重新导入模块时要用importlib.reload()，而直接import会失败  
    如果在module末尾加上  
    ```python
        if __name__ == "__main__":
            import sys
            FUNCTION(sys.argv[1])
    ```
    那么它可以直接直接调用 python module FUNCTION canshu
    - more on modules
        * executing modules as scipts
        * the module search path
        * compiled python files
    - standard modules
        sys.path是从环境变量PYTHONPATH中初始化的，未定义PYTHONPATH时，从built-in-default中初始化。
    - dir() function
        输出模块的所有定义，variables、modules、functions...
    - packages
        __init__.py

7. inputs and outputs