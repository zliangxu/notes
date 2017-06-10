[pandas](http://pandas.pydata.org/pandas-docs/stable/)

## terms
tabular 表格
tenet 宗旨
NaN: not an number

### Package overiew
所有的数据结构都是value-mutable
Series： 一维同质的标签数据
DataFrame： 二维标签数据，size-mutable
Panel：三维标签数据，size-mutable(大小可变的阵列)
io： csv, hdf5/PyTables

### 10 minutes to pandas

- Object creation
- Viewing data
    sort
- Selection
- Missing data
- Operations
    plotting
- Getting Data in/out
    read_csv()
    to_csv()
### intro to data structures  (data alignment is intrinsic)

<!--assign always returns a copy of the data, leaving the original DataFrame untouched.-->
df.assign() 赋值
df.assign(sepal_ratio = lambda x: (x['SepalWidth'] / x['SepalLength'])).head() 赋值
<!--返回满足条件的-->
df.query()

<!--排序-->
df.sort_index(axis=1, ascending=False)  // 对index排序，axis=1，指对columns index排序；index=0，指对rows index排序
df.sort_values(by='B')                  // 对values排序

<!--数值替换-->
df.replace()

<!--选择-->
df.loc[]        // by label
df.iloc[]       // by position，给定整数坐标, 可以是二维坐标[1,2]
df.iat[]        // For getting fast access to a scalar (equiv to the prior method)
df[]            // by boolean index

<!--setting-->
df.iat[] = 1

<!--缺失值-->
df.drapna()                 // 返回行中不存在NaN的行
df.fillna(values=5)         // 对NaN填充5
df.isnull()                 // 返回boolean值，判断是否NaN

<!--Operations-->
操作通常不考虑缺失值
df.mean(0)                              // 0对所有行求平均值，1或缺省对所有列求平均值
df.apply(np.cumsum)                     // 逐行对df求值并赋值
df.apply(lambda x: x.max() - x.min())   // 代入的x是对列的遍历，返回结果
df.value_counts()                       // 统计直方图

<!--merge-->
df = pd.concat()
df = pd.merge(left, right, on='key', how='left') // 以left为基准进行，以key为标志向左融合，需要返回值，原df不变
df = left.join(right,how='innner')               // 

<!--append-->
增加行
df.append()

<!--group-->
df.groupby().mean()

<!--Categoricals-->
df["grade"] = df["raw_grade"].astype("category")    // 把raw_grade数据复制并转为category类型数据