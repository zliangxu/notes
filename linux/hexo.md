[hexo博客配置，个人主页示例](https://xzhewei.github.io/2017/09/29/Hexo-%E6%90%AD%E5%BB%BA%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2/)
[hexo mathjax](http://yelog.org/2017/07/05/3-hexo-mathjax/)
公式显示不正常
## 操作
先hexo g再执行hexo d布署，也可使直接用hexo d -g
hexo -s # 本地网页浏览

## tips
- 根目录下_config.xml是站点配置文件，主题目录下_config.xml是主题配置文件
- hexo 更新到3.0之后，deploy的type 的github需要改成git
- 在执行 hexo deploy 后,出现 error deployer not found:git 的错误处理   
输入代码：
```shell
npm install hexo-deployer-git --save
```