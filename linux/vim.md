# vim
vim学习  vimtutor
dd：删除本行 d+num+d删除num行
dw：移至单词词首可以删除该单词
d$：删除光标位置至行末
0：移动光标到行首(零)
$：移动到行末
u：撤销最后执行的命令undo，U撤销对本行的修改
ctrl+r：redo

## 参数
-b: 以二进制打开文件，输入:%!xxd命令可以以十六进制显示

## 复制粘贴
v：进入可视模式进行选择
y：复制选择部分 ?
p：粘贴

## 定位及文件状态
ctrl+g：显示当前行数目、状态
gg：跳到文件第一行
G：跳到文件最后一行
num+G：跳到num行
冒号加数字，可以跳到该行。

## 插入命令
o：在当前行下面另起一行插入
O：在当前行上面另起一行插入
i：在光标出插入字符
a：在光标后插入字符
r：修改一个字符

## 搜索类命令
/+string：正向（从文件开始到文件末尾）搜索string   //使用n向下继续查找，N继续向上查找
?+string：逆向（从文件光标向文件开始）搜索string
ctrl+o：跳转到之前的位置
ctrl+i：跳转到新位置


## 创建启动脚本
如果家目录下没有.vimrc , 则从/usr/share/vim/**下复制一个vimrc到家目录作为.vimrc
在vim环境下获取相关帮助（在vimtutor下）
:help vimrc-intro

## 常见vim设置
语法
"  ：为注释语句
```cpp
set showmatch        " Show matching brackets.
set ignorecase        " Do case insensitive matching
set smartcase        " Do smart case matching
set incsearch        " Incremental search
"set autowrite        " Automatically save before commands like :next and :make
"set hidden        " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)

set tabstop=4  "tab key space num included
set autoindent "auto indent
set hlsearch   "high light search
set bg=dark    "background color
set number  "display number int head

"光标自动移至括号内
imap () ()<left>
imap {} {}<left>
imap "" ""<left>
imap [] []<left>
imap '' ''<left>
```