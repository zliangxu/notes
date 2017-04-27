[lmdb](http://lmdb.readthedocs.io/en/release/#)
## interface

- Enviroment Class
    打开数据库，path为lmdb的路径文件夹，而不是文件
    lmdb.open(path) //
    lmdb.version() //返回lmdb的版本
    class lmdb.Environment(path, map_size=10485760, subdir=True, readonly=False, metasync=True, sync=True, map_async=False, mode=493, create=True, readahead=True, writemap=False, meminit=True, max_readers=126, max_dbs=0, max_spare_txns=1, lock=True)
    
    成员函数
    begin() //返回transaction class

- Transaction Class
    数据库的读写操作都要依赖transaction对象
    class lmdb.Transaction(env, db=None, parent=None, write=False, buffers=False)
    
    成员函数
    cursor() //返回cursor，没有指向任何对象，需要调用迭代



- Cursor Class
    数据库单元访问，应该类似于iterator
    
    成员函数
    next() //返回下一个有效的cursor
    get(key, default=None, db=None)
    item() //返回当前cursor指向的(key, value)
    value() //返回value
    key() //返回key

- Exceptions