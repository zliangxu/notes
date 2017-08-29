http://blog.csdn.net/K346K346/article/details/48750417

## 文档对象模型(document object model, DOM)
DOM是W3C(万维网联盟)的推荐标准，分为三部分
核心DOM 
    用于任何结构文档的标准模型
XML DOM
    用于XML文档的标准模型
HTML DOM
    用于HTML文档的标准模型
[XML DOM详细解析](http://www.w3school.com.cn/xmldom/dom_nodes.asp)
XML中的每个部分都是节点，包括文档节点、元素节点、文本节点、属性节点、注释节点
```xml
<!--这是一个注释节点，下面book是一个元素节点，而中间的是文本节点，而不是元素节点的文本值-->
<book>effective c++</book>
```
整个文档应该看做一个节点树来操作


## tinyxml2的使用
```c
#include "tinyxml2.h"
using namespace tinyxml2;
```

## [tinyxml2的类结构](http://grinninglizard.com/)