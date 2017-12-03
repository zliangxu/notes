# latex

## 安装
```shell
sudo apt-get install texlive-full
sudo apt-get install texlive
sudo apt-get install texmaker
```

<http://www.latexstudio.net/>

## latex入门
1. 卸载 CTeX 套装，安装 TeX Live。原因及教程见：TeX Live 下载及安装说明.
1. 看完：一份其实很短的 LaTeX 入门文档，你迷惑的「CTeX 和 LaTeX 都是啥」在倒数第二节有答案.
1. 看完：zip.liam0205.me 或者 刘海洋的《LaTeX 入门》。

## 编译
```shell
xelatex main.tex # beamer

```
## beamer
是latex的一个文档类，用于制作ppt  
中文支持，需要使用xelatex编译，即$ xelatex main.tex。main.tex内容：
```tex
%!TEX program = xelatex
\documentclass{beamer}
    \usepackage{xeCJK}
    % \setCJKmainfont{Adobe Song Std}
    % \setCJKmainfont{楷体}
    \usetheme{Warsaw}
    \usecolortheme{rose}
    \title{你好！beamer}
    \date{2017}
\begin{document}
\begin{frame}
    \titlepage
\end{frame}
\end{document}
```
## markdown画流程图

```flow
st=>start: 开始
e=>end: 结束
op=>operation: 操作
cond=>condition: 确认？

st->op->cond
cond(yes)->e
cond(no)->op
```