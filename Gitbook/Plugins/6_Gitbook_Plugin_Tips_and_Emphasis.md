# 提示与强调
@[toc]

---

##  1. alerts 插件
[alerts](https://www.npmjs.com/package/gitbook-plugin-alerts) 插件功能是告警级别信息提示。这个GitBook插件将块引用转换为漂亮的警报。

###  1.1 安装

```bash
npm i gitbook-plugin-alerts
```

###  1.2 配置
`book.json`配置：

```bash
{
    "plugins": ["alerts"]
}
```
###  1.3 效果

 - info 信息样式

```bash
> **[info] For info**
>
> Use this for infomation messages.
```
> **[info] For info**
>
> Use this for infomation messages.

 - warning 警告造型

```bash
> **[warning] For warning**
>
> Use this for warning messages.
```
> **[warning] For warning**
>
> Use this for warning messages.

 - danger 危险造型

```bash
> **[danger] For danger**
>
> Use this for danger messages.
```
> **[danger] For danger**
>
> Use this for danger messages.

 - success 成功造型

```bash
> **[success] For success**
>
> Use this for success messages.
```

> **[success] For success**
>
> Use this for success messages.

##  2. flexible-alerts 插件
[flexible-alerts](https://www.npmjs.com/package/gitbook-plugin-flexible-alerts) 插件将块引用转换为漂亮的警报，相比 alerts 具有更多的拓展功能。

可以在全局和警报特定级别配置外观，因此输出确实符合您的需求（如下图）。此外，您还可以提供自己的警报类型（比如最后的comment）。

Github地址：[https://github.com/zanfab/gitbook-plugin-flexible-alerts#readme](https://github.com/zanfab/gitbook-plugin-flexible-alerts#readme)
### 2.1 安装

```bash
npm i gitbook-plugin-flexible-alerts
```

###  2.2 配置
book.json配置：

```bash

{
  "plugins": [
    "flexible-alerts"
  ],
  "pluginsConfig": {
    "flexible-alerts": {
      "note": {
        "label": "Hinweis"
      },
      "tip": {
        "label": "Tipp"
      },
      "warning": {
        "label": "Warnung"
      },
      "danger": {
        "label": "Achtung"
      }
    }
  }
}

```
### 2.3 扩展配置
语法：

```bash
> [!type|style:xx|label:xx|icon:xx|className:xx|labelVisibility:xx|iconVisibility:xx]
> 内容部分
```
字段介绍，如果不设置的表示选择默认，除了`!type`都不是必需
| 键               | 允许的值                     | 说明                          |
|-----------------|--------------------------|-----------------------------|
| !type           | NOTE，TIP，WARNING和DANGER  | 警告级别设置                      |
| style           | 以下值之一: callout（默认）, flat | 警告样式，见图19的左右不同              |
| label           | 任何文字                     | 警告块的标题位置，即Note这个字段位置（不支持中文） |
| icon            | 比如： fa fa-info-circle    | 一个有效的Font Awesome图标，那块小符号   |
| className       | CSS类的名称                  | 指定css文件，用于指定外观              |
| labelVisibility | 以下值之一：visible（默认），hidden | 标签是否可见                      |
| iconVisibility  | 以下值之一：visible（默认），hidden | 图标是否可见                      |

效果对比：

```bash
> [!NOTE]
> 这是一个简单的Note类型的使用，所有的属性都是默认值。


> [!NOTE|style:flat|lable:Mylable|iconVisibility:hidden]
> "!type":`NOTE`、"style":`flat`、"lable":`自定义标签`、图标不可见
```
默认的 NOTE
> [!NOTE]
> 这是一个简单的Note类型的使用，所有的属性都是默认值。

添加设置的 NOTE

> [!NOTE|style:flat|lable:Mylable|iconVisibility:hidden]
> "!type":`NOTE`、"style":`flat`、"lable":`自定义标签`、图标不可见

###  2.4 效果1
![在这里插入图片描述](https://img-blog.csdnimg.cn/8f29023966f84cb6896fcb4dcaccb164.png)


###  2.5  自定义一个COMMENT类型
在`book.json`中添加以下内容。然后执行`gitbook install`，或者使用NPM安装（单独安装推荐NPM）`npm install gitbook-plugin-flexible-alerts`，也可以从源码GitHub地址中下载，放到`node_modules`文件夹里（GitHub地址在进入插件地址右侧的GitHub链接）：

```bash
{
  "plugins": [
    "flexible-alerts"
  ],
  "pluginsConfig": {
    "flexible-alerts": {
      "style": "callout",
      "comment": {
        "label": "Comment",
        "icon": "fa fa-comments",
        "className": "info"
      }
    }
  }
}
```
自定义COMMENT

```bash
> [!COMMENT]
> An alert of type 'comment' using style 'callout' with default settings.
```
> [!COMMENT]
> An alert of type 'comment' using style 'callout' with default settings.

###  2.6. 效果2

 - Info styling

```bash
Info styling
> [!NOTE]
> An alert of type 'note' using global style 'callout'.
```
Info styling

> [!NOTE]
> An alert of type 'note' using global style 'callout'.

 - Info flat

```bash
Info flat
> [!NOTE|style:flat]
> An alert of type 'note' using alert specific style 'flat' which overrides global style 'callout'.
```
Info flat
> [!NOTE|style:flat]
> An alert of type 'note' using alert specific style 'flat' which overrides global style 'callout'.

 - Tip style

```bash
Tip style
> [!TIP|style:flat|label:My own heading|iconVisibility:hidden]
> An alert of type 'tip' using alert specific style 'flat' which overrides global style 'callout'.
> In addition, this alert uses an own heading and hides specific icon.
```
Tip style
> [!TIP|style:flat|label:My own heading|iconVisibility:hidden]
> An alert of type 'tip' using alert specific style 'flat' which overrides global style 'callout'.
> In addition, this alert uses an own heading and hides specific icon.

 - Warning styling

```bash
Warning styling
> **[!WARNING] For warning**
> Use this for warning messages.
```
Warning styling
> **[!WARNING] For warning**
> Use this for warning messages.

 - danger styling

```bash
danger styling
> **[!DANGER] For danger**
> Use this for danger messages.
```
danger styling
> **[!DANGER] For danger**
> Use this for danger messages.

##  3. emphasize 插件
[emphasize](https://www.npmjs.com/package/gitbook-plugin-emphasize) 插件功能是为文字加上底色

### 3.1 安装

```bash
npm i gitbook-plugin-simple-page-toc
```

### 3.2 配置

```bash
{
    "plugins": [
        "emphasize"
    ]
}
```

### 3.3 效果
在 markdown / asciidoc 内容中，使用以下内容突出显示一些文本：

```bash
- This text is {% em %}highlighted !{% endem %}
- This text is {% em %}highlighted with **markdown**!{% endem %}
- This text is {% em type="green" %}highlighted in green!{% endem %}
- This text is {% em type="red" %}highlighted in red!{% endem %}
- This text is {% em color="#ff0000" %}highlighted with a custom color!{% endem %}
```

效果:

This text is highlighted !
This text is highlighted with markdown!
This text is highlighted in green!
This text is highlighted in red!
This text is highlighted with a custom color!
