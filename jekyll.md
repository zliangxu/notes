[jekyll](http://jekyllcn.com/)

#### 1. ubuntu安装jekyll
依赖项 
- Ruby
- RubyGems
- NodeJS
- Python2.7

安装完依赖项后，运行以下命令就成功了。
- $ sudo gem install jekyll

### 2. 安装成功Jekyll后，接着就是网站初始化，把一个文件夹设置为网站存储地址
- $ jekyll new myblog
myblog为网站安装到的文件夹，可以用 '.'表示安装到当前目录，如果当前目录非空，需要添加 --force 参数，即 
- $ jekyll new . --force
<pre>
输出错误  Dependency Error: Yikes! It looks like you don't have bundler or one of its dependencies installed. 
In order to use Jekyll as currently configured, you'll need to install this gem. The full error message from 
Ruby is: 'cannot load such file -- bundler' 
If you run into trouble, you can find helpful resources at https://jekyllrb.com/help/! 
解决方法： sudo jem install boundler
</pre>

- $ jekyll build??

### 3. 设置当前电脑为网站服务器
- jekyll serve
访问 'localhost:4000' 即为网站页面

### 4. 给网站主页添加链接
在自己写的markdown文件头部添加Jekyll要求的头信息，jekyll就会把mardown自动翻译成html。

