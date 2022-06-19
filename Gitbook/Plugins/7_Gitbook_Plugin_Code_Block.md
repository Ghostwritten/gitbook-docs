#  代码块


![在这里插入图片描述](https://img-blog.csdnimg.cn/28301dbce8fc446eb46091097440f9ec.gif#pic_center)
##  1. code 插件
[code](https://www.npmjs.com/package/gitbook-plugin-code-pro) 代码添加行号&复制按钮

###  1.1 安装

```bash
npm i gitbook-plugin-code-pro
```

###  1.2 配置
book.json配置：


```bash
{
    "plugins" : [ "code" ]
}
```
如果想去掉复制按钮，可配置

```bash
"pluginsConfig": {
      "code": {
        "copyButtons": false
      }
}
```
###  1.3 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/8a9553603096433ab6ed05c17763d282.png)
注意左侧行数编号和右上角的复制按钮

## 2. copy-code-button 插件
[copy-code-button](https://www.npmjs.com/package/gitbook-plugin-copy-code-button) 插件功能是代码复制按钮

###  2.1 安装

```bash
npm i gitbook-plugin-copy-code-button
```

### 2.2 配置

```bash
{
    "plugins": ["copy-code-button"]
}
```
###  2.3 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/f8f9dc9eec51415fae6581df951f462a.png)
##  3. klipse 插件
[klipse](https://www.npmjs.com/package/gitbook-plugin-klipse) 插件是嵌入类似IDE的功能

###  3.1 安装

```bash
npm i gitbook-plugin-klipse
```

###  3.2 方法

```bash
{
    "plugins": ["klipse"]
}
```
用法，在 markdown 中
```eval-python
print [x + 1 for x in range(10)]
```
###  3.3 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/bd19d85715844d6caf6068ad63995856.png)
klipse 目前支持下面的语言：

 - javascript: evaluation is done with the javascript function eval and pretty printing of the result is done with pretty-format
 - clojure[script]: evaluation is done with Self-Hosted Clojurescript
 - ruby: evaluation is done with Opal
 - C++: evaluation is done with JSCPP
 - python: evaluation is done with Skulpt
 - scheme: evaluation is done with BiwasScheme
 - PHP: evaluation is done with Uniter
 - BrainFuck
 - JSX
 - EcmaScript2017
 - Google Charts: See Interactive Business Report with Google Charts.

## 4. Prism 插件
[Prism](https://www.npmjs.com/package/gitbook-plugin-prism) 插件使用 `Prism.js` 为语法添加**高亮显示**，需要将 `highlight` 插件去掉。该插件自带的主题样式较少，可以再安装 [prism-themes](https://www.npmjs.com/package/gitbook-plugin-prism-themes) 插件，里面多提供了几种样式，具体的样式可以参考 这里，在设置样式时要注意设置 css 文件名，而不是样式名。



###  4.1 安装

```bash
npm i gitbook-plugin-prism
```

### 4.2 配置

```bash
{
    "plugins": [
        "prism",
        "-highlight"
    ]
}
```
####  4.2.1 css
覆盖默认样式。所有css文件必须位于同一个文件夹中。

```bash
"pluginsConfig": {
  "prism": {
    "css": [
      "prismjs/themes/prism-solarizedlight.css"
    ]
  }
}
```
####  4.2.2 lang
通过别名现有前缀来支持非标准语法前缀。

```bash
"pluginsConfig": {
  "prism": {
    "lang": {
      "flow": "typescript"
    }
  }
}
```
####  4.2.3 ignore
由于其他插件使用代码块的概念来表示其他功能，你可以忽略某些语言。

```bash
"pluginsConfig": {
  "prism": {
    "ignore": [
      "mermaid",
      "eval-js"
    ]
  }
}
```


###  4.3 效果
#### 4.3.1 Prism Themes
[https://github.com/PrismJS/prism](https://github.com/PrismJS/prism)

```bash
$ ls node_modules/prismjs/themes/
prism-coy.css      prism.css       prism-dark.min.css  prism-funky.min.css  prism-okaidia.css      prism-solarizedlight.css      prism-tomorrow.css      prism-twilight.css
prism-coy.min.css  prism-dark.css  prism-funky.css     prism.min.css        prism-okaidia.min.css  prism-solarizedlight.min.css  prism-tomorrow.min.css  prism-twilight.min.css
```

Okaidia `prismjs/themes/prism-okaidia.css`
![在这里插入图片描述](https://img-blog.csdnimg.cn/4da072b057fc4ea8b42c012e90935fea.png)

Solarized Light `prismjs/themes/prism-solarizedlight.css`
![在这里插入图片描述](https://img-blog.csdnimg.cn/cf61554724bb4024a677227773a5de29.png)

Tomorrow `prismjs/themes/prism-tomorrow.css`
![在这里插入图片描述](https://img-blog.csdnimg.cn/8e494b61f15f4aa89f1dcee4cdd5689c.png)

Dark `prismjs/themes/prism-dark.css`
![在这里插入图片描述](https://img-blog.csdnimg.cn/7198b062396b4a76bedd168153150e47.png)

Coy `prismjs/themes/prism-coy.css`
![在这里插入图片描述](https://img-blog.csdnimg.cn/94cb31d8711944a6bae30923be834c08.png)

#### 4.3.2 Atelierbram Themes
[https://github.com/atelierbram/syntax-highlighting](https://github.com/atelierbram/syntax-highlighting)

Base16 Ocean Dark `syntax-highlighting/assets/css/prism/prism-base16-ocean.dark.css`
![在这里插入图片描述](https://img-blog.csdnimg.cn/1f3e7eb81dc94311b6db260eaa9fa3f3.png)

Google Light `syntax-highlighting/assets/css/prism/prism-base16-google.light.css`
![在这里插入图片描述](https://img-blog.csdnimg.cn/54b7c2489d5e4c32bb94bcda7f0862c4.png)

Xonokai `syntax-highlighting/assets/css/prism/prism-xonokai.css`
![在这里插入图片描述](https://img-blog.csdnimg.cn/5528b121ac9246818981ddd6db4d17b0.png)
##  5. prism-themes 插件
当使用gitbook-plugin-prism时，[prism-themes](https://github.com/PrismJS/prism-themes) 插件提供了额外的主题。

### 5.1 安装

```bash
npm i gitbook-plugin-prism-themes
```
或者

```bash
gitbook install
```

### 5.2 配置

```bash
{
  "plugins": ["-highlight", "prism", "prism-themes"]
}

"pluginsConfig": {  
  "prism": {
    "css": [
      "prism-themes/themes/prism-duotone-dark.css"
    ]
  }
}
```
###  5.3 效果

 - [Available themes](https://github.com/PrismJS/prism-themes)

##  6. ACE 插件
[ACE](https://www.npmjs.com/package/gitbook-plugin-ace)插件是使 `GitBook` 支持`ace` 。

### 6.1 安装

```bash
npm i gitbook-plugin-ace
```

### 6.2 配置

默认情况下，`line-height` 为 1，会使代码显得比较挤，而作者好像没提供修改行高的选项，如果需要修改行高，可以到 `node_modules -> github-plugin-ace -> assets -> ace.js` 中加入下面两行代码 (30 行左右的位置)：

```bash
editor.container.style.lineHeight = 1.25;
editor.renderer.updateFontSize();
```
不过上面的做法有个问题就是，每次使用 `gitbook install` 安装新的插件之后，代码又会重置为原来的样子。另外可以在 `website.css` 中加入下面的 css 代码来指定 ace 字体的大小

```bash
.aceCode {
  font-size: 14px !important;
}
```
使用插件：

```bash
"plugins": [
    "ace"
]
```
使用示例:

```bash
// This is a hello world program for C.
#include <stdio.h>

int main(){
  printf("Hello World!");
  return 1;
}
```

###  6.3 效果
略
##  7. Terminal 插件
[Terminal](https://www.npmjs.com/package/gitbook-plugin-terminal) 插件功能是模拟终端显示，主要用于显示命令以及多行输出，不过写起来有些麻烦。

###  7.1 安装

```bash
npm i gitbook-plugin-terminal
```

###  7.2 配置

`terminal` 支持下面 5 种样式，如果需要更换样式，在 `pluginsConfig` 里配置即可。

 - black: Just that good old black terminal everybody loves.
 - classic: Looking for green color font over a black background? This  is for you.
 - flat: Oh, flat colors. I love flat colors. Everything looks modern with them.
 - ubuntu: Admit it or not, but Ubuntu have a good looking terminal.
 - white: Make your terminal to blend in with your GitBook.

book.json配置：
```c
{
    "plugins": [
        "terminal"
    ],
    "pluginsConfig": {
        "terminal": {
            "copyButtons": true,
            "fade": false,
            "style": "flat"
        }
    }
}
```
现在支持 6 种标签：

```bash
command: Command "executed" in the terminal.
delimiter: Sequence of characters between the prompt and the command.
error: Error message.
path: Directory path shown in the prompt.
prompt: Prompt of the user.
warning: Warning message.
```
标签的使用格式如下所示：

```bash
**[<tag_name> 内容]
```

为了使标签正常工作，需要在代码块的第一行加入 `**[termial]` 标记，下面是一个完整的示例：

```bash
**[terminal]
**[prompt foo@joe]**[path ~]**[delimiter  $ ]**[command ./myscript]
Normal output line. Nothing special here...
But...
You can add some colors. What about a warning message?
**[warning [WARNING] The color depends on the theme. Could look normal too]
What about an error message?
**[error [ERROR] This is not the error you are looking for]
```

###  7.3 效果
略

##  8. codesnippet 插件
[codesnippet](https://www.npmjs.com/package/gitbook-plugin-codesnippet) 插件可以轻松导入代码文件或在 GitBook 的代码块中使用变量。
### 8.1 安装

```bash
npm i gitbook-plugin-codesnippet
```

### 8.2 配置

```bash
{
    "plugins": ["codesnippet"]
}
```
###  8.3 语法

```bash
添加代码内容:

This is a code snippet:
 
{% codesnippet "./myfile.js" %}{% endcodesnippet %}

```
指定语言类型:
```bash


This is a code snippet, display as HTML:
 
{% codesnippet "./myfile.ejs", language="html" %}{% endcodesnippet %}
```
指定行范围：
```bash
This is a code snippet, display as HTML:
 
{% codesnippet "./myfile.ejs", lines="2:5" %}{% endcodesnippet %}
```
带有模板语法的代码块
```bash
This is a code snippet, display as HTML:
 
{% codesnippet %}
curl {{ book.hostname|d("http://localhost") }}/myapi
{% endcodesnippet %}
```

### 8.4 效果
（略）
### 8.5 评价
很方便，但用处不太大，略感繁琐。
综合指数：⭐️⭐️⭐️
