[lmdb](http://lmdb.readthedocs.io/en/release/#)
## interface

- Enviroment Class
    打开数据库，path为lmdb的路径文件夹，而不是文件
    lmdp.open(path)
    class lmdb.Environment(path, map_size=10485760, subdir=True, readonly=False, metasync=True, sync=True, map_async=False, mode=493, create=True, readahead=True, writemap=False, meminit=True, max_readers=126, max_dbs=0, max_spare_txns=1, lock=True)

- Transaction Class
    数据库的读写操作都要依赖transaction对象
    with env.begin(write=True) as txn:
        pass

- Cursor Class
    数据库单元访问
    cursor = txn.cursor()

- Exceptions