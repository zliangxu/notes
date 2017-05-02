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
    put()
    get(key, default=None, db=None)
    put(key, value, dupdata=True, overwrite=True, append=False, db=None)


- Cursor Class
    数据库单元访问，应该类似于iterator
    
    成员函数
    next() //返回下一个有效的cursor
    get(key, default=None)
    item() //返回当前cursor指向的(key, value)
    value() //返回value
    key() //返回key

- Exceptions

<<<<<<< HEAD:machinelearning/lmdb.md
## usage

- write

```python
import caffe
import lmdb
import pandas as pd

train = pd.read_csv('data/csv/train.csv')
#train.values是ndarray的数据格式
train = train.values

train_image = train[:500, 1:]  #读图像数据
label_image = train[:500, :1]  #读标签数据

train_image = train_image.reshape((train_image.shape[0], 1, 28, 28)) #转成图像格式

# We need to prepare the database for the size. We'll set it 10 times
# greater than what we theoretically need. There is little drawback to
# setting this too big. If you still run into problem after raising
# this, you might want to try saving fewer entries in a single
# transaction.
# coding=utf-8 
map_size = train_image.nbytes * 10

env = lmdb.open('tolmdb', map_size = map_size)
with env.begin(write=True) as txn:
    for i in range(train_image.shape[0]):
        datum = caffe.proto.caffe_pb2.Datum()
        datum.channels = train_image.shape[1] 
        datum.height = train_image.shape[2]
        datum.width = train_image.shape[3]
        datum.data = train_image[i].tostring()
        datum.label = int(label_image[i])
        str_id = '{:08}'.format(i)
        txn.put(str_id.encode('ascii'), datum.SerializeToString())
```

- read

```python
path = ''

import caffe
import lmdb
import numpy as np

env = lmdb.open(path, readonly = True) #创建环境
txn = env.begin()   #创建操作对象
cursor = txn.cursor()   #创建迭代指针，是空的
cursor.next()   #移到下一个对象
#cursor.item()   #返回cursor所指的对象对(key,value)
cursor.value()  #返回cusor所指对象的值

datum = caffe.proto.caffe_pb2.Datum()   #创建caffe的内置数据类型
datum.ParseFromString(cursor.value())   #把数据解析到datum

flat_x = np.fromstring(datum.data, dtype=np.uint8)  #把datum.data数据由字符串转为整数
x = flat_x.reshape(datum.channels, datum.height, datum.width)
```
 
=======
[lmdb documentation](http://lmdb.readthedocs.io/en/release/)

lmdb: lightning memory-mapped database manager
>>>>>>> 10bd36a85cae26978749584d5e7d5f546cb239f3:program/python/lmdb.md
