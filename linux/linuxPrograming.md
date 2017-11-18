[linux-turtorial for befinners](http://www.ee.surrey.ac.uk/Teaching/Unix/index.html)
[ubuntu wiki](http://wiki.ubuntu.org.cn/%E9%A6%96%E9%A1%B5)
[the linux programing interface](http://www.man7.org/tlpi/index.html)
[linux usb](http://www.linux-usb.org/)
[linux man-pages](https://www.kernel.org/doc/man-pages/)
[linux kernel api](https://www.kernel.org/doc/htmldocs/kernel-api/)
[gnu c library](http://www.gnu.org/software/libc/manual/html_node/)

## LINUX程序设计 第三版（neil...）
```
linux使用技巧
ctrl+d 关闭终端
ctrl+c 结束进程
ctrl+z 后台运行

ctrl+alt+t打开终端
ctrl+shift+t在终端窗口打开一个tab
ctrl+alt+escape进入任务管理器
ctrl+alt+f1进入CLI（命令行界面command line interface），xterm(控制台)
ctrl+alt+t进入终端
ctrl+alt+f7进入桌面
alt + ~切换同应用的多窗口
alt+tab切换不同应用的窗口

长按super键(windows下的win键)，显示快捷键
```
ctrl+c和ctrl+z都是中断命令,但是他们的作用却不一样.ctrl+c是强制中断程序的执行,而ctrl+z的是将任务中断,但是此任务并没有结束,他仍然在进程中他只是维持挂起的状态,用户可以使用fg/bg操作继续前台或后台的任务,fg命令重新启动前台被中断的任务,bg命令把被中断的任务放在后台执行.例如:当你vi一个文件是,如果需要用shell执行别的操作,但是你又不打算关闭vi,因为你得存盘推出,你可以简单的按下ctrl+z,shell会将vi进程挂起~,当你结束了那个shell操作之后,你可以用fg命令继续vi你的文件

删除内核命令 ubuntu tweak，或者sudo apt-get remove linux-image

linux下c与cplusplus混合编程头文件需要以如下方式把
extern "C"
{
     #include "xtofReadSonar.h"
};

挂载windows硬盘： ntfsfix /dev/sda5
usb设备在/dev文件下
系统安装

linux系统启动，双系统默认启动项选择，配置文件是/boot/grub/grub.cfg，更改里面的set default = “number” 数值就可以改变启动项。

### 第三章 文件操作
操作系统的核心部分，即内核，是一组设备驱动程序。
设备驱动程序的底层函数（系统调用库函数）包括:(文档man 2 read，第二小节)
     open
     read
     write
     close
     ioctl:把控制信息传递给设备驱动程序
     ……
使用系统调用效率较低，所以有了更高层的接口函数，标准函数库:(man 3 printf，第三小节)
     stdio.h的库函数带有缓冲区，实际上是当缓冲区满时，进行系统调用。此处的文件流与系统调用中的底层文件描述符相对应。
     fopen,fclose//文件打开、关闭
     fread,fwrite//文件读、写
     fflush//（清空）刷新缓冲区
     fseek//文件地址查找
     fgetc,getc,getchar//文件读一个字符、、标准输入读一个字符
     fputc,putc,putchar//文件写一个字符、、标准输出一个字符
     fgets,gets//从文件、标准输入读取字符串
     printf,fprintf,sprintf//标准输出、文件写入、字符串写入
     scanf,fscanf,sscanf//标准输入、文件读取、字符串读取
LINUX程序运行时，自动在PATH搜索路径下搜索（目录名以冒号（：）分隔），当在运行自己编写的程序时，因为其不在搜索路径以范围内，所以要在程序名前面添加./，表示程序在当前路径下
文件和目录的维护
chmod//改变文件和目录的访问权限
chown//改变文件属主
第四章 Linux环境
cd -  //返回上一个进入的目录
getopt(); putopt();//程序参数解析
set：命令，列出所有的环境变量
getenv(); putenv();//读取设置环境变量
/var/log/；//文件下各种日志信息
安装库的默认路径 ： /usr/local/include
搜索文件命令： sudo update
                         locate FILENAME

### 第五章 终端termios
### 第六章 curses库函数，屏幕操作
### 第七章 数据管理
### 内存管理
void *malloc(size_t size);
calloc()//用来分配结构数组的内存
realloc()//用来改变已经分配内存块的长度
void *free(void *ptr_to_memory);
文件所定//为多用户多任务操作系统设计
数据库//linux系统自带的数据库dbm
## 第八章 MySQL
## 第九章 开发工具
make makefile、版本控制工具、rpm
## 第十章 常用调试技巧
gcc -Wall -pedantic -ansi输出警告信息ll
编译器定义的调试宏，在编译时，宏被对应的字符串替换，运行时可以输出这些字符串
__DATE__  
__LINE__  
__FILE__  
__TIME__  


perrr() 系统函数，输出系统调用失败时的错误信息。  
### 第十一章 进程和信号  
ps： 显示当前运行的进程  
system("");//调用  
execlp();//替换进程  
//复制进程  
信号  
kill -s 9（发送杀死进程命令）//发送信号给进程  
signal() //接受到指定信号后调用函数  

进程间通信：管道  
进程管道(由一个运行程序创建的多个进程(相关的进程))  
FILE *popen()；  
int pclose();  
int pipe(int file_descriptor[2]);//descriptor[0]读文件描述符，descriptor[1]写文件描述符  
对文件描述符操作用read(),write;  
对文件流操作用fread(),fwrite();   
命名管道：FIFO（用于不相关进程数据传输）  
mkfifo filename//命令创建filename fifo   
### 第十二章 POSIX线程
&emsp 线程与其创建者共享全局变量、文件描述符、信号句柄、当前目录状态。
同步的方法（用于控制线程的切换）
     信号量：如同看守一段代码的看门人，计数信号量，常用来保护一段代码，使其每次只能被一个执行线程运行；  
         有两组接口函数用于信号量，一组用于POSIX的实时扩展，用于线程；另一组为系统PV信号量，用于进程的同步。  
         int sem_init()//初始化信号量对象  
         int sem_wait()//以原子操作的方式给信号量加一；（原子操作，大致是操作过程中不会被中断，结果会保证正确）  
         int sem_post()//以原子操作的方式给信号量减一；  
         int sem_trywait()//sem_wait()的非阻塞版本;    
         int sem_destroy()//对信号量进行清理；  
     互斥量：同一时间只有一个线程可以对某对象进行操作。  

三大IPC机制（inter-process communication）（可以是多个运行程序创建的进程（不相关的进程））
信号量
（pv操作，信号量在不同进程间是可见的，相当于信号量是全局的，而要保护的数据放在pv操作之间）
int semget()//创建一个新信号量或取得一个已有信号量的键
只有semget函数直接使用信号量键，所有其它函数都使用由semget函数返回的信号量标识符。
int semop()//用于改变信号量的值。
int semctl()//直接控制信号量信息。
共享内存
同一段物理内存（段地址，偏移地址），可能是不同的逻辑地址
int shmget()//创建共享内存，返回共享内存标识符
void *shmat()//将共享内存段连接到一个进程的地址空间中
shmdt()//将共享内存从当前进程中分离
int shmctl()//控制函数
消息队列
套接字连接
服务器端
1，服务器应用程序系统调用socket创建一个套接字，对于网络套接字需要一个未被使用的端口号。
2，系统调用bind给套接字命名，服务器进程开始等待客户连接
     在AF_INET域，套接字被绑定到IP端口号上，
     在AF_UNIX域，套接字被绑定到文件系统上的文件上。
3，listen创建一个套接字队列，用于存放来自客户的进入连接
4，accept接受客户的连接
客户端：客户程序通过在一个未命名套接字和服务器监听套接字之间建立连接的方法来连接到服务器。
1，调用socket创建一个未命名套接字
2，将服务器的命名套接字作为一个地址来调用connect与服务器建立连接？？？
套接字属性
1，域domain：指定套接字通信中使用的网络介质；
AF_INET,互联网络。
AF_UNIX，UNIX域协议（文件系统套接字）
2，类型type:与域的种类有关，一个域可以提供多种通信方式，例如一个网络域包括如下两种方式
SOCK_STREAM：流（stream）
SOCK_DGRAM：数据报（datagram）
3，协议protocol：底层传输机制；
网络套接字可以用于局域网，也可以用于带有因特网连接的机器，单机上也可以。
回路网路只包含一台计算机 （localhost）127.0.0.1
一般情况下路由器地址： 192.168.1.1
在文件/etc/hosts中，网络地址
在文件/etc/services，端口号
netstat命令     输出网络连接状况。

### LINUX套接字的概念
首先，套接字的主要作用就是连接网络中进程间的通信，可以是一个主机上的两个进程，也可以是局域网中的两台主机上的进程，当然也可以是网络上连接因特网的设备；它们的连接方式有流、数据包等形式，这些都可以通过设置套接字的属性来区别不同的使用场合。  
套接字包含三个属性：
```
     域（domain）：指定了套接字通信中使用的网络介质。常见的包括：
          AF_UNIX：UNIX域协议（文件系统套接字，即通信时是通过创建文件，然后以文件为媒介传递信息）
          AF_INET：ARPA因特网协议（UNIX网络套接字，可以用于包括互联网在内的TCP/IP网络进行通信）
     类型（type）：一个域包含多种不同的通信方式，像AF_INET域包括流和数据报两种通信方式。
```
SOCK_STREAM：流（stream）  
SOCK_DGRAM：数据报（datagram）  
     协议（prototype）：网络套接字和文件系统套接字可以用默认的协议。  
套接字是一个具体的东西，在数据通信的两端客户端、服务器端都存在，通过一个具体的例子来理解套接字整个传输的过程。  
服务器端的套接字  
可以通过一个系统调用创建套接字，系统调用函数的参数分别决定了套接字的三个属性，返回值就是所创建的套接字描述符，类似于UNIX系统中的文件描述符，后续的操作都是对这个描述符进行处理。
```cpp
int socket(int domain, int type, int protocol);
```
现在还需要把这个套接字绑定到一个地址上，这个起连接作用的地址也可以被其它进程访问，这样才能实现通信，这个绑定地址的过程叫套接字命名，进行绑定的系统调用函数是：
```cpp
int bind(int socket, const struct sockaddr *address, size_t address_len);
```
不同的套接字域的套接字地址结构定义形式不同，AF_UNIX域的套接字地址
```cpp
struct sockaddr_un{
     sa_family_t sun_family;   //指定域AF_UNIX
     char sun_path[];     //指定地址路径名
};
```
AF_UNIX域套接字地址就是一个临时文件，软件运行过程中是可以看到的。
```cpp
AF_INET域的套接字地址
struct sockaddr_in{
     short int sin_family;     //指定域AF_INET
     unsigned short int sin_port; //指定网络端口，因为IP地址仅仅确定了通信双方的主机地址，还需要确定端口号进一步指定通信的进程。
     struct in_addr sin_addr; //指定网络地址，即IP地址
};
```
端口号是一个通信双方约定好的数字，比如QQ通信过程中的端口号就是默认的4000，这个是在编写软件时就设定好的。
现在有了地址，就需要监听客户程序什么时候发出了连接请求，监听是通过一个系统调用程序设置进行的
```cpp
int listen(int socket, int backlog);
```
backlog指定监听套接字队列的最大长度，即服务器套接字可以容纳的未处理连接的最大数目。
当监听到连接请求时，就可以接受连接了。
```cpp
int accept(int socket, struct sockaddr *address, size_t *address_len);  
```
参数sockaddr指定了客户的地址，如果不关心客户的地址，可以设置为NULL，系统调用返回的是一个新的套接字描述符，可以直接对这个描述符进行read()、write()操作。  
客户端套接字。  
客户端同样需要创建套接字，创建方法与服务器端相同，然后直接请求连接就可以了，请求连接的系统调用  
```cpp
int connect(int socket, const struct sockaddr *address, size_t address_len);  
```
该套接字没有绑定地址，即通过一个未命名套接字与服务器端监听套接字之间建立连接的方法来连接到服务器。
