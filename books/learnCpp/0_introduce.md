# introduce
## Goals
- Cover programming topics as well as C++  
    programming style, common pitfalls, debugging, good/bad programming practices, and testing. 
- Provide a lot of examples  
- Provide practice programs  
    可以与答案进行对比，发现不同之处
- Most importantly: have fun
    debugging code tends to take much longer than writing it correctlly in the first place
推荐 stack overflow

## Getting the most out of these tutorials    
- 手动输入代码并编译，杜绝copy
- nothing is better than practice
- learn to debug

# introduction to programing languages
- Machine language  
机器指令，由一位一位的bit构成，bit的值为0或1。例如MIPS架构指令有32bits的固定长度，其它架构如x86长度不一；机器指令指示cpu完成一个特定的任务
- assembly language  
汇编语言为每一条指令指定了一个名字，并且可以定义变量，cpu不能理解汇编语言，汇编需要assembler编译成机器语言。汇编语言只能为固定型号cpu，不能用在其它cpu上
- high-level language  
高级语言 C, C++, Pascal, Java, Javascript, and Perl, are all high level languages，可以脱离于某种具体的cpu，而将高级语言转换为机器语言包含两种形式 compling and interpreting。
A **compiler** is a program that reads code and produces a stand-alone executable program that the CPU can understand directly.  
An **interpreter** is a program that directly executes your code without compiling it into machine code first.

# introduction to c/c++
The C language was developed in 1972 by Dennis Ritchie at Bell Telephone laboratories, primarily as a systems programming language.  
American National Standards Institute (ANSI)   、ANSI C 、C89  
C++ (pronounced see plus plus) was developed by Bjarne Stroustrup at Bell Labs as an extension to C, starting in 1979.

# Introduction to development
1. 定义问题
2. 找到多种解决方法，选出最鲁邦的一种
3. coding
4. compile 把源代码编译成 object file named .o or .obj
5. linking 把 object file 连接成一个可执行文件
6. testing and debugging

# IDE
Visaul C++
[Code::Blocks for linux](http://www.codeblocks.org/downloads/26)

# a few common c++ problems
```cpp
std::cin.clear(); // reset any error flags
std::cin.ignore(32767, '\n'); // ignore any characters in the input buffer until we find an enter character
std::cin.get(); // get one more char from the user
```