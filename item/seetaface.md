[ubuntu 安装seetaface](http://www.nljb.net/default/%E5%9C%A8Ubuntu%E4%B8%ADBuild%E4%BA%BA%E8%84%B8%E8%AF%86%E5%88%AB%E5%BC%95%E6%93%8ESeetaFace/)
(http://www.cnblogs.com/makefile/p/seetaface-install.html)

## 问题
1. illegal instruction(core stump)
是因为amd 不支持sse，在cmakeLists.txt内set为off就可以了
2. 编译faceIdentification时
需要添加这一行，才会找到lib库文件 link_directories(${PROJECT_BINARY_DIR})