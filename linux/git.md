[找什么教程，不如读懂一个readme.txt](https://guides.github.com/)  
[Learning github](https://help.github.com/) 
[github pages一个不错的版本](http://csrgxtu.github.io/categories/Linux/)
 
[Git 命令解释](https://git-scm.com/docs)     
[廖雪峰git教程](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)

- HEAD: git用HEAD表示当前版本，实际上HEAD指向master,master指向当前版本
    HEAD^表示上一个版本。
- master: 主分支，本地仓库的分支名
- origin: 我们的文件在github服务器上的默认名为origin，在本地分支的默认名为master。
```
在git clone 远程仓库时，Git 会自动为你将此远程仓库命名为origin（origin只相当于一个别名，运行git remote –v或者查看.git/config可以看到origin的含义），并下载其中所有的数据，建立一个指向它的master 分支的指针，我们用(远程仓库名)/(分支名) 这样的形式表示远程分支，所以origin/master指向的是一个remote branch（从那个branch我们clone数据到本地），*但你无法在本地更改其数据*
```
## git初始配置
git初始[配置过程](https://help.github.com/articles/set-up-git/) 
1. 设置git
- git config --global user.email " "
- git config --global user.name " "
2. 设置ssh keys


Man git-order Or git help + order得到order相关的帮助文档

## Git 命令
- Git init: 初始化生成一个.init，命令行提示符处提示当前git版本名称
- Git clone + ADDRESS：将远程仓库克隆到本地，会自动创建一个和远程仓库同名的文件夹
- Git status: 获取当前文件的状态，是否需要更新，比如新添了一个文件
```
    Staged:
    Unstaged:
    Untracked: git还未对该文件进行版本管理
    Deleted:
```
- Git add filename: 添加文件进入git版本管理。Staging area
```
    Git add all .
    Git add '*.txt': 在当前路径下搜索，包含子目录。
    git add *.txt: 在当前路径下搜索，不包含子目录。
```
- Git rm:从版本库中删除,
    - -r:  与linux相近，删除目录及子文件。本地仓库，远程仓库都可以删除
- Git commit: 保存staged文件到reposity,进行融合
    - -m "notica:
- Git log: reposity提交日志文件
- Git remote add [remote branch name] [link,已经在github.com建立好的仓库] :添加远程仓库
    - -v 查看远程仓库
- Git push [-u] [remote branch name] [local branch name]: 把本地文件提交到origin
    - -u：使软件记住本次命令，以后只需输入git push即可。
- git pull origin master:  把origin文件下载到本地，相当于运行git fetch，后又运行 git merge。
- git stash
- git diff:可以查看文件的修改内容，获取pull下的文件有何不同
--staged
- Git reset:
    - git reset --hard HEAD^:回退到上一版本
    - git commit --hard commit_id:回到commit__id版本
- Git checkout:
    - Git checkout branName: 切换进新的分支
    - git checkout --file NAME:撤销修改
    - git checkout -b newName:创建并进入新的分支
- Git branch:
    - 无参数：输出本地分支信息
    - -a show all the branches git knows about
    - -r show remote branches git knows about
    - Git branch clean_up: 新建branch名为clean_up
    - Git branch:列出当前的分支，与master同一级。
    - Git branch -d clean_up: 删除clean_up分支
    - git branch --graph:显示分支合并图
- Git merge clean_up: 合并分支，当前在master分支，执行命令把在clean_up分支下的改变应用到master分支。

## 帮助信息获取
```shell
man git
git --help
```

## "to create a new reposity"
```shell
echo "# books" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:lxg2015/books.git
<<<<<<< HEAD
git push -u origin master 是合并到当前文件  
git clone 是下载新的文件

=======
git push -u origin master # 是合并到当前文件
git clone # 是下载新的文件
```
>>>>>>> e8de293fe8af072ec7915e4c4e78c2373b2f89b8
## "to push an existing reposity from the command line"
git remote add origin git@github.com:lxg2015/books.git
git push -u origin master

## gitignore
文件的书写规则
```shell
*.a       # 忽略所有 .a 结尾的文件
!lib.a    # 但 lib.a 除外
/TODO     # 仅仅忽略项目根目录下的 TODO 文件，不包括 subdir/TODO
build/    # 忽略任意位置的 build/ 目录下的所有文件
doc/*.txt # 会忽略 doc/notes.txt 但不包括 doc/server/arch.txt
```
对于已经提交过的文档，需要设置忽略时，要在git库中删除该文件
```shell
git rm -r --cached .
git add .
git commit -m 'update .gitignore'
```

_site
.sass-cache
.jekyll-metadata
*.aux
*.fdb_latexmk
*.fls
*.log
*.pdf
*.gz