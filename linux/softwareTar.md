## 打包库文件
```shell
#!/bin/sh  
  
exe="/home/lxg/Qt5.8.0/mycode/build-test-Desktop_Qt_5_8_0_GCC_64bit-Release/test" #发布的程序名称  
des="/home/lxg/Qt5.8.0/mycode/build-test-Desktop_Qt_5_8_0_GCC_64bit-Release" #你的路径  
  
deplist=$(ldd $exe | awk  '{if (match($3,"/")){ printf("%s "),$3 } }')  
cp $deplist $des  
```

## 编写可执行脚本
```shell
#!/bin/sh  
appname=`basename $0 | sed s,\.sh$,,`  
  
dirname=`dirname $0`  
tmp="${dirname#?}"  
  
if [ "${dirname%$tmp}" != "/" ]; then  
dirname=$PWD/$dirname  
fi  
LD_LIBRARY_PATH=$dirname  
export LD_LIBRARY_PATH  
$dirname/$appname "$@"  
```