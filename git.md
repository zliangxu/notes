找什么教程，不如读懂一个readme.txt   https://guides.github.com/
Learning github  https://help.github.com/
Git 命令解释： https://git-scm.com/docs
[廖雪峰git教程](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)
Branch: 分支，branch of master
Master:
Commit:
Pull:

git初始[配置过程](https://help.github.com/articles/set-up-git/) 
1. 设置git
- git config --global user.email " "
- git config --global user.name " "
2. 设置ssh keys


Man git-order Or git help + order得到order相关的帮助文档
## Git 命令
- Git init: 初始化生成一个.init，命令行提示符处提示当前git版本名称
- Git clone+address：克隆到本地
- Git status: 获取当前文件的状态，是否需要更新，比如新添了一个文件
Staged:
Unstaged:
Untracked: git还未对该文件进行版本管理
Deleted:
- Git add filename: 添加文件进入git版本管理。Staging area
Git add all .
Git add '*.txt': 在当前路径下搜索，包含子目录。
       git add *.txt: 在当前路径下搜索，不包含子目录。
- Git rm:从版本库中删除
    - -r: 与linux相近，删除目录及子文件。
- Git commit: 保存staged文件到reposity,进行融合
-m "notica:
- Git log: reposity提交日志文件
- Git remote add <remote branch name> <link,已经在github.com建立好的仓库> :添加远程仓库
- Git push -u <remote branch name> <local branch name>: 把本地文件提交到origin
-u：使软件记住本次命令，以后只需输入git push即可。
- git pull origin master:  把origin文件下载到本地。
- git stash
- git diff:获取pull下的文件有何不同
--staged
- Git reset:
    - git reset --hard HEAD^:回退到上一版本
    - git commit --hard commit_id:回到commit__id版本
- Git checkout:
    - Git checkout branName: 切换进新的分支
    - git checkout --file NAME:撤销修改
    - git checkout -b newName:创建并进入新的分支
- Git branch:输出分支信息
    - Git branch clean_up: 新建branch名为clean_up
    - Git branch:列出当前的分支，与master同一级。
    - Git branch -d clean_up: 删除clean_up分支
    - git branch --graph:显示分支合并图
- Git merge clean_up: 当前在master分支，执行命令把在clean_up分支下的改变应用到master分支。
- 我们的文件在github服务器上的默认名为origin，在本地分支的默认名为master。
man git
git --help

## "to create a new reposity"
echo "# books" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:lxg2015/books.git
git push -u origin master 是合并到当前文件
git clone 是下载新的文件

## "to push an existing reposity from the command line"
git remote add origin git@github.com:lxg2015/books.git
git push -u origin master