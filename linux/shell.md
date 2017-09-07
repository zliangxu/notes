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