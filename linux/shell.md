#!/bin/bash

## 随机数
linux自带了一个5位的随机数变量
```shell
echo $RANDOM
```

## 从一个txt随机输出n行
```shell
shuf -n100 main.txt
sort #这个命令好像也可以
```
## 求两个txt文件的交集、并集、差集
```shell
# 求解a.txt与b.txt的交集，sort命令读出a.txt与b.txt中的所有行并排序，uniq使得两个文件中的内容为唯一的，使用-d输出两个文件中次数大于1的内容，即是得到交集 
sort a.txt b.txt | uniq -d
# 求解两个文件的并集,将两个文件进行排序，uniq使得两个文件中的内容为唯一的，即可得到两个文件的并集
sort a.txt b.txt | uniq
# 求解两个文件的差集，a.txt-b.txt， 将两个文件排序，最后输出a.txt b.txt b.txt文件中只出现过一次的内容，因为有两个b.txt所以只会输出只在a.txt出现过一次的内容(b.txt的内容至少出现两次)，即是a.txt-b.txt差集；对于b.txt-a.txt同理。
sort a.txt b.txt b.txt | uniq -u 
```

## 统计文件行数并赋值给一个变量
```shell
# 命令替换是指shell能够将一个命令的标准输出插在一个命令行中任何位置。shell中有两种方法作命令替换：把shell命令用反引号或者$(...)结构括起来，其中，$(...)格式受到POSIX标准支持，也利于嵌套 
a=`wc -l < a.txt`
```

## [变量的数学运算](http://blog.chinaunix.net/uid-20671208-id-3552751.html)
```shell
# 在shell中具有最基本的数学计算能力，如可以使用expr 、let 。但这些都只能处理整形数据。为了要计算小数,就需要通过bc命令扩展。 
```

## 关闭终端后仍然执行后台程序
```shell
nohup PROGRAM &  #nohup会把程序输出到nohup.out
exit  #据说要用exit，而不是直接点x号时会起作用
```