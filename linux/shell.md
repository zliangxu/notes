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
## 关闭终端后仍然执行后台程序
```shell
nohup PROGRAM &  #nohup会把程序输出到nohup.out
exit  #据说要用exit，而不是直接点x号时会起作用
```