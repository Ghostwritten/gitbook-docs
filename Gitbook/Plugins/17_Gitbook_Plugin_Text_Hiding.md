#  文本隐藏

##  1. accordion 折叠模块
折叠模块, 别名叫[accordion](https://www.npmjs.com/package/gitbook-plugin-accordion)。可以实现将内容隐藏起来，外部显示模块标题和显示箭头，点击箭头可显示里面的内容。

在文章中对主体内容进行细化说明较长，又不是文章核心逻辑时，可以隐藏细化说明部分，有需要时可以由读者决定是否阅读该部分细化说明。

###  1.1 安装

```bash
npm i gitbook-plugin-accordion
```
### 1.2 配置

```bash
{
  "plugins": ["accordion"]
}
```
在文章中使用标记对内容进行折叠

###  1.3 效果

```bash
%accordion% 模块标题 %accordion%

- 内容部分第1行
- 内容部分第2行
- 内容部分第3行
- 内容部分第4行
- 内容部分第5行
- 内容部分第6行
- 内容部分第7行
- 内容部分第8行
- 内容部分第9行

%/accordion%
```
##  2. click-reveal 插件
[click-reveal](https://www.npmjs.com/package/gitbook-plugin-click-reveal) 点击显示 默认隐藏，点击可显示。

###  2.1 安装

```bash
npm i gitbook-plugin-click-reveal
```

### 2.2 配置

```bash
{
    "plugins": [
        "click-reveal"
    ]
}
```
使用方式，markdown中

```bash
{% reveal %}

要被隐藏的内容

{% endreveal %}
```
默认显示的文字是 Click to show , 使用自定义显示文字

```bash
{% reveal text="点击显示" %}

要被隐藏的内容

{% endreveal %}
```
支持html语法

```bash
<div class="click_reveal">
    <span> 点击显示 </span>
    <div><pre><code>隐藏的文字</code></pre></div>
</div>
```
### 2.3 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/9abfc11027b2438e9f35a61d48b14399.gif#pic_center)

##  3. hide-element 插件
[hide-element 插件](https://www.npmjs.com/package/gitbook-plugin-hide-element)：可以隐藏不想看到的元素，比如导航栏中 Published by GitBook

###  3.1 安装

```bash
npm i gitbook-plugin-hide-element
```

###  3.2 配置

```bash
{
    "plugins": [
        "hide-element"
    ],
    "pluginsConfig": {
        "hide-element": {
            "elements": [".gitbook-link"]
        }
    }
}
```
###  3.3 效果
默认可以移除最左侧下方的提示信息：

```bash
Published with GitBook

或

本书使用 Gitbook 发布
```

##  4. sectionx 插件
将页面分块显示 用于将页面分成多个部分，并添加按钮以允许读者控制每个部分的可见性。 下面有个更好的折叠模块功能accordion 

###  4.1 安装

```bash
npm i gitbook-plugin-sectionx
```

###  4.2 配置

```bash
{
    "plugins": [
           "sectionx"
    ]
}
```
容分块：

在 .md 文件中定义一个部分（就是插入下面的字段）。 markdown中示例代码：

```bash
<!--sec data-title="标题2" data-id="section0" data-show=true ces-->
内容部分2；
<!--endsec-->
```
这里只采用三个参数，其他参数如下所示：
| 键               | 允许的值                     | 说明                          |
|-----------------|--------------------------|-----------------------------|
| !type           | NOTE，TIP，WARNING和DANGER  | 警告级别设置                      |
| style           | 以下值之一: callout（默认）, flat | 警告样式，见图19的左右不同              |
| label           | 任何文字                     | 警告块的标题位置，即Note这个字段位置（不支持中文） |
| icon            | 比如： fa fa-info-circle    | 一个有效的Font Awesome图标，那块小符号   |
| className       | CSS类的名称                  | 指定css文件，用于指定外观              |
| labelVisibility | 以下值之一：visible（默认），hidden | 标签是否可见                      |
| iconVisibility  | 以下值之一：visible（默认），hidden | 图标是否可见                      |

###  4.3 添加按钮，控制部分可见性
通过在 GitBook 中添加内联HTML，以下代码可以添加一个按钮，以允许您查看或隐藏其他部分。 简单来说，就是在【使用1】的内容部分添加一个按钮：

```bash
<button class="section" target="section1" show="显示下一部分" hide="隐藏下一部分"></button>
```
标签说明：
| 标签     | 说明                                     |
|--------|----------------------------------------|
| class  | 该按钮必须属于类“section”。//这里就是用到 1部分的section |
| target | 当按下时，将切换id为target的部分。                  |
| show   | 隐藏目标部分时按钮上的文本。                         |
| hide   | 目标部分可见时按钮上的文本。                         |

markdown中示例代码：

```bash
<button class="section" target="section2" show="显示模块2" hide="隐藏模块2"></button>
<!--sec data-title="模块2" data-id="section2" data-show=true ces-->
内容部分2
<!--endsec-->
```
###  4.4 混合使用
将第2节的button块添加到第1节的内容部分 markdown中示例代码：

```bash
<!--sec data-title="标题1" data-id="section0" data-show=true ces-->
内容部分1；
<button class="section" target="section1" show="显示下一部分" hide="隐藏下一部分"></button>
<!--endsec-->
<!--sec data-title="标题2" data-id="section1" data-show=true ces-->
内容部分2
<!--endsec-->
```
效果图3：
![在这里插入图片描述](https://img-blog.csdnimg.cn/7500722cf84b4776a7a5cd8fc8e2458b.png)
