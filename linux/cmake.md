https://cmake.org/Wiki/CMake //系统wiki  
https://cmake.org/cmake/help/v3.7/  
https://cmake.org/cmake/help/v3.0/index.html  

# CMakeLists.txt
## tips
- 指令是大小写无关的，参数、变量名是大小写相关的
- if语句是直接使用变量名，if语句内涵取变量值的工作(${VAR})
- 参数之间使用空格或分号分开
- 注释使用"#"

## 指令
1. project(PROJECTNAME [CXX] [C] [Java])  
    指定工程名、工程支持的语言，默认支持所有语言。  
    会自动定义两个变量project_binary_dir、project_source_dir
2. set(VAR [VALUE] [CACHE TYPE DOCSTRING [FORCE]])  
    取变量值${VAR}
3. add_executable(EXECUTABLE_NAME [SRC_FILE])  
    工程名和可执行文件名没有关系
4. message([SEND_ERROR | STATUS | FATAL_ERROR] "display" ...)  
    send_error:产生错误
    status:输出后缀为-的信息？？
    fatal_error:终止编译
5. add_subdirectory(SOURCE_DIR [BINARY_DIR] [EXCLUDE_FROM_ALL])  
    向当前工程添加存有源代码的子目录(SOURCE_DIR)；BINARY_DIR为对应的编译输出文件夹；EXCLUDE_FROM_ALL表示将这个目录从编译过程中排除，因为它可以是个例子，独立于整个工程的编译。
6. install(TARGETS myrun mylib mystaticlib  
            RUNTIME DESTINATION bin  
            LIBRARY DESTINATION lib  
            ARCHIVE DESTINATION libstatic)  
    把可执行文件、动态库、共享库安装到${CMAKE_INSTALL_PREFIX}<DESTINATION定义的命令> 
7. add_library(LIBRARY_NAME [SHARED|STATIC|MODULE] [EXCLUDE_FROM_ALL] [SRC_FILE]) 
    exclude_from_all:表示不会被默认构建，除非有其它模块依赖或手动创建
    前缀名lib和后缀名.a或.so是自动添加的，不在name的定义范围内
8. set_target_properties()
9. include_directories([after|before] [system] dir1 dir2 ...)
    向工程添加多个特定的头文件搜索路径，如果路径存在空格，需使用双引号括起来;
    默认是将搜索路径追加到已有的搜索路径的后面，即默认参数after
10. link_directories(dir1 dir2 ...)
    添加非标准的共享库搜索路径
11. target_link_libaries(target lib1<debug|optimized> lib2 ...)
    为target添加需要的共享库、静态库
## cmake变量
- project_binary_dir: 执行make的目录
- project_source_dir: 整个工程目录
- executable_output_path: 可执行文件的生成目录，在哪里add_executable在哪里设置这个变量
- library_output_path: 共享库、静态库的生成目录，在哪里add_library在哪里设置这个变量
- cmake_install_prefix: 文件安装目录的前缀，默认是/usr/local
## 环境变量(不是cmake变量，而是操作系统的环境变量)
- CMAKE_INCLUDE_PATH
    cmake中的find_path命令会搜索这个路径下的目录，查找头文件
- CMAKE_LIBARAY_PATH
    cmake中的find_library命令会搜索这个路径下的库文件
# make
## 指令
- make clean  
    清除编译出的可执行文件
- make distclean  
    不支持，编译过程的临时文件是无法清除的
- make VERBOSE=1
    输出编译错误信息
- [cmake设置指定版本opencv](http://www.cnblogs.com/xzd1575/p/5555523.html)
```shell
set(OpenCV_DIR "/home/lxg/app/opencv-2.4.9/build")
```

make是一条命令，其有三个常用的选项：  
     -f <fileName>: 它的作用是告诉make命令将哪个文件作为makefile文件，如果未使用这个选项，将在当前路径下寻找默认的文件名，makefile， 之后是 Makefile。  
     -n：输出将要执行的步骤，而不执行编译  
     -k：让make命令在发现错误时仍然继续执行，而不是在检测到第一个错误时就停下来。  
make myapp、clean、install即指定了编译生成的目标；当不指定特定目标时，默认创建makefile文件里的第一个目标，第一个all：，一个特殊目标。  
makefile文件的组成：
- 依赖关系：定义了每个输出文件与源文件的依赖关系。
- 规则：定义了输出文件的创建方式，如编译命令gcc。必须以tab键开头。
- 注释：已#开头
makefile官网 ： http://www.gnu.org/software/make/manual/make.html


# CMakeLists.txt的编写
Cmake  
set(ENV{variable} <value>) //设置环境变量  
options  
-Wall //显示提示消息  WW
-o0 //optimization级别  
-g //带有调试信息  

CMakeLists.txt  
在cmake中要编译debug模式的话，在CMakeLists.txt添加如下两行。  
SET(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -o0 -Wall -g -ggdb")  
SET(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -o3 -Wall")  
然后，在编译的时候，使用如下命令  
cmake -DCMAKE_BUILD_TYPE=Debug（Release） path  

## 一个常见的CMakeLists.txt内容
- 声明要求的cmake最低版本
    cmake_minimum_required(VERSION 2.8)
- 声明一个cmake工程
    project(HelloSLAM)
- 添加一个可执行程序
    add_executable(helloSLAM helloSLAM.cpp)
- 声明包含的头文件
    include_directories()
- 链接库文件，所有用到的库文件都可以用路径指明
    target_link_libraries()

执行cmake . 得到makeFile，接着可以执行 make ，编译得到可执行文件 。更好的方法是mkdir build，在build文件夹下执行cmake .. ,接着make，这样可以把编译文件留到build文件夹下
## 静态库、共享库
在linux中，库文件分为静态库和共享库两种，静态库以 .a结尾，共享库以 .so结尾， 所有库都是一些函数的打包集合，差别在于静态库每次调用都会生成一个副本，而共享库只有一个副本，更省空间。库文件是一个二进制压缩包，使用时，还需要对应的头文件。

find_package : cmake提供的寻找某个库的头文件与库的指令，如果成功找到，则提供头文件和库文件所在的目录的变量（libraryName_INCLUDE_DIRS, libraryName_LIBRARIES）

cmake生成库文件
add_library(hello_shared SHARED libHelloSLAM.cpp)，可以得到 libhello_shared.so。

cmake调用库
target_link_libraries(useHello hello_shared) //usehello是要生成的可执行文件。
查看库的安装版本  pkg-config --modversion opencv

error :

- 无法找到**Config.cmake，这个文件由安装包的配置决定，不是cmake自动提供的。
# blog

一、      基本使用

安装：下载二进制包后可直接解压使用

从源码安装则执行命令：./bootstrap; make; make install——尝试执行bootstrap失败

使用：cmake dir_path，生成工程文件或makefile文件

二、      概念

out-of-source build，与in-source build相对，即将编译输出文件与源文件放到不同目录中；

三、      基本结构

1，依赖CMakeLists.txt文件，项目主目标一个，主目录中可指定包含的子目录；

2，在项目CMakeLists.txt中使用project指定项目名称，add_subdirectory添加子目录

3，子目录CMakeLists.txt将从父目录CMakeLists.txt继承设置（TBD，待检验）

四、      语法

1.       #注释

2.       变量：使用set命令显式定义及赋值，在非if语句中，使用${}引用，if中直接使用变量名引用；后续的set命令会清理变量原来的值；
3.       command (args ...)  #命令不分大小写，参数使用空格分隔，使用双引号引起参数中空格
4.       set(var a;b;c) <=> set(var a b c)  #定义变量var并赋值为a;b;c这样一个string list
5.       Add_executable(${var}) <=> Add_executable(a b c)   #变量使用${xxx}引用

6.       条件语句：
if(var) #var 非empty 0 N No OFF FALSE... #非运算使用NOT
       …
else()/elseif() … endif(var)

7.       循环语句
Set(VAR a b c)
Foreach(f ${VAR})       …Endforeach(f)

8.       循环语句
WHILE() … ENDWHILE()

五、 内部变量  
CMAKE_C_COMPILER：指定C编译器   
CMAKE_CXX_COMPILER：  
CMAKE_C_FLAGS：编译C文件时的选项，如-g；也可以通过add_definitions添加编译选项  
    add_definitions(-std=c++11)  //指定c++11  
EXECUTABLE_OUTPUT_PATH：可执行文件的存放路径  
LIBRARY_OUTPUT_PATH：库文件路径  
CMAKE_BUILD_TYPE:：build 类型(Debug, Release, ...)，CMAKE_BUILD_TYPE=Debug  
BUILD_SHARED_LIBS：Switch between shared and static libraries  
内置变量的使用：   
    在CMakeLists.txt中指定，使用set  
    cmake命令中使用，如cmake -DBUILD_SHARED_LIBS=OFF  

六、      命令

project (HELLO)   #指定项目名称，生成的VC项目的名称；
>>使用${HELLO_SOURCE_DIR}表示项目根目录

include_directories：指定头文件的搜索路径，相当于指定gcc的-I参数
>> include_directories (${HELLO_SOURCE_DIR}/Hello)  #增加Hello为include目录

link_directories：动态链接库或静态链接库的搜索路径，相当于gcc的-L参数
       >> link_directories (${HELLO_BINARY_DIR}/Hello)     #增加Hello为link目录

add_subdirectory：包含子目录
       >> add_subdirectory (Hello)

add_executable：编译可执行程序，指定编译，好像也可以添加.o文件
       >> add_executable (helloDemo demo.cxx demo_b.cxx)   #将cxx编译成可执行文件——

add_definitions：添加编译参数
>> add_definitions(-DDEBUG)将在gcc命令行添加DEBUG宏定义；
>> add_definitions( “-Wall -ansi –pedantic –g”)

target_link_libraries：添加链接库,相同于指定-l参数
>> target_link_libraries(demo Hello) #将可执行文件与Hello连接成最终文件demo
add_library:
>> add_library(Hello hello.cxx)  #将hello.cxx编译成静态库如libHello.a
add_custom_target:
message( status|fatal_error, “message”):
set_target_properties( ... ): lots of properties... OUTPUT_NAME, VERSION, ....
link_libraries( lib1 lib2 ...): All targets link with the same set of libs

七、      说明

1，CMAKE生成的makefile能够处理好.h文件更改时只编译需要的cpp文件；

八、      FAQ

1）  怎样获得一个目录下的所有源文件
>> aux_source_directory(<dir> <variable>)

>> 将dir中所有源文件（不包括头文件）保存到变量variable中，然后可以add_executable (ss7gw ${variable})这样使用。

2）  怎样指定项目编译目标
>>  project命令指定

3）  怎样添加动态库和静态库
>> target_link_libraries命令添加即可

4）  怎样在执行CMAKE时打印消息
>> message([SEND_ERROR | STATUS | FATAL_ERROR] "message to display" ...)

>> 注意大小写

5）  怎样指定头文件与库文件路径
>> include_directories与link_directories
>>可以多次调用以设置多个路径
>> link_directories仅对其后面的targets起作用

6）  怎样区分debug、release版本
>>建立debug/release两目录，分别在其中执行cmake -DCMAKE_BUILD_TYPE=Debug（或Release），需要编译不同版本时进入不同目录执行make即可；
Debug版会使用参数-g；Release版使用-O3 –DNDEBUG

>> 另一种设置方法——例如DEBUG版设置编译参数DDEBUG
IF(DEBUG_mode)
    add_definitions(-DDEBUG)
ENDIF()

在执行cmake时增加参数即可，例如cmake -D DEBUG_mode=ON

7）  怎样设置条件编译

例如debug版设置编译选项DEBUG，并且更改不应改变CMakelist.txt

>> 使用option command，eg：
option(DEBUG_mode "ON for debug or OFF for release" ON)
IF(DEBUG_mode)
    add_definitions(-DDEBUG)
ENDIF()

>> 使其生效的方法：首先cmake生成makefile，然后make edit_cache编辑编译选项；Linux下会打开一个文本框，可以更改，该完后再make生成目标文件——emacs不支持make edit_cache；

>> 局限：这种方法不能直接设置生成的makefile，而是必须使用命令在make前设置参数；对于debug、release版本，相当于需要两个目录，分别先cmake一次，然后分别make edit_cache一次；

>> 期望的效果：在执行cmake时直接通过参数指定一个开关项，生成相应的makefile——可以这样做，例如cmake –DDEBUGVERSION=ON

8）  怎样添加编译宏定义

>> 使用add_definitions命令，见命令部分说明

9）  怎样添加编译依赖项

用于确保编译目标项目前依赖项必须先构建好
>>add_dependencies

10）        怎样指定目标文件目录

>> 建立一个新的目录，在该目录中执行cmake生成Makefile文件，这样编译结果会保存在该目录——类似
>> SET_TARGET_PROPERTIES(ss7gw PROPERTIES
                      RUNTIME_OUTPUT_DIRECTORY "${BIN_DIR}")

11）        很多文件夹，难道需要把每个文件夹编译成一个库文件？

>> 可以不在子目录中使用CMakeList.txt，直接在上层目录中指定子目录

12）        怎样设定依赖的cmake版本
>>cmake_minimum_required(VERSION 2.6)

13）        相对路径怎么指定
>> ${projectname_SOURCE_DIR}表示根源文件目录，${ projectname _BINARY_DIR}表示根二进制文件目录？

14）        怎样设置编译中间文件的目录
>> TBD

15）        怎样在IF语句中使用字串或数字比较
>>数字比较LESS、GREATER、EQUAL，字串比STRLESS、STRGREATER、STREQUAL，
>> Eg：
set(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS ON)
set(AAA abc)
IF(AAA STREQUAL abc)
    message(STATUS "true")   #应该打印true
ENDIF()

16）        更改h文件时是否只编译必须的cpp文件

>> 是

17）        机器上安装了VC7和VC8，CMAKE会自动搜索编译器，但是怎样指定某个版本？
>> TBD

18）        怎样根据OS指定编译选项
>> IF( APPLE ); IF( UNIX ); IF( WIN32 )

19）        能否自动执行某些编译前、后命令？
>> 可以，TBD

20）        怎样打印make的输出
make VERBOSE=1

参考文献：

[1] CMake_Tutorial.pdf  
[2] CMake使用总结，http://blog.csdn.net/keensword007/archive/2008/07/16/2663235.aspx  
[3] http://www.cmake.org/  
[4] 安装包中文档  
[5] Andrej Cedilnik，HOWTO: Cross-Platform Software Development Using CMake，October, 2003  
[6] Cjacker，CMake实践.PDF  