#  Gitbook 插件 主题


![在这里插入图片描述](https://img-blog.csdnimg.cn/3dd355e4403b45a38456df33e1082cb7.gif#pic_center)


##  1. theme-default 插件
[theme-default](https://www.npmjs.com/package/gitbook-plugin-theme-default) 插件是 默认主题,大多数插件针对的都是默认主题。

默认情况下,左侧菜单不显示层级属性,如果将 `showLevel` 属性设置为 true 可以显示层级数字.
###  1.1 安装

```bash
npm i gitbook-plugin-theme-default
```
###  1.2 配置

```bash

"pluginsConfig": {
    "theme-default": {
        "showLevel": true
    }
}

   "plugins": [
        "theme-default"
    ]
```

###  1.3 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/6051abe6064e48eeb7a0cb5c69abd064.png)

![showLevel": true，可以显示层级数字](https://img-blog.csdnimg.cn/4d928cc828ce44cab2d394bee6365f05.png)

##  2. theme-comscore 插件
theme-default 插件默认主题是黑白的,而[theme-comscore](https://www.npmjs.com/package/gitbook-plugin-theme-comscore)插件 主题是彩色的,即标题和正文颜色有所区分.

### 2.1 安装

```bash
npm i gitbook-plugin-theme-comscore

npm i -g gitbook-cli // maybe need sudo permission
gitbook install
```


### 2.2 配置

```bash
{
"plugins": [
        "theme-comscore"
    ]
}
```

###  2.3 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/db1fc1c6889b4521863d62eec23b02ef.png)

##  3. theme-api 插件
使用 GitBook 发布 API 文档的主题。

[theme-api](https://www.npmjs.com/package/gitbook-plugin-theme-api) 主题与搜索插件（如默认插件或algolia）完美配合。
### 3.1 安装

```bash
npm i gitbook-plugin-theme-api
```

### 3.2 配置

```bash
{
    "plugins": ["theme-api"],
    "pluginsConfig": {
        "theme-api": {
            "theme": "dark"
        }
    }
}
```
###  3.3 语法
该主题允许使用模板块语法轻松定义具有不同语言示例的方法。

一个方法块可以包含任意数量的嵌套`sample`和`common`块。

这些嵌套块记录在下面。

```bash
{% method %}
## Install {#install}

The first thing is to get the GitBook API client.

{% sample lang="js" %}
\```bash
$ npm install gitbook-api
\```

{\% sample lang="go" %}
\```bash
$ go get github.com/GitbookIO/go-gitbook-api
\```
{\% endmethod %}
```

在每个包含示例块的页面上，右上角method会自动添加一个切换器，以轻松选择要显示的语言。

可以在book.json文件中配置每种语言的名称，其lang属性对应于sample块lang参数：

```bash
{
  "plugins": ["theme-api"],
  "pluginsConfig": {
    "theme-api": {
      "languages": [
        {
          "lang": "js",          // sample lang argument
          "name": "JavaScript",  // corresponding name to be displayed
          "default": true        // default language to show
        },
        {
          "lang": "go",
          "name": "Go"
        }
      ]
    }
  }
}
```

### 3.4 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/cfc2ef47ab5f4e8bb2b3a0b9776c95d3.png)
![在这里插入图片描述](https://img-blog.csdnimg.cn/9cb010a0f2884bb1acded6ea2db71ed3.png)
###  3.5 布局
该主题提供了两种布局来显示您的示例：一列或两列（拆分）。当"split": true时为拆分布局。
```bash
{
  "plugins": ["theme-api"],
  "pluginsConfig": {
    "theme-api": {
      "split": true
    }
  }
}
```
一栏布局
![在这里插入图片描述](https://img-blog.csdnimg.cn/6d14bd09993149bdbf20c1cf05864192.png)
拆分布局
![在这里插入图片描述](https://img-blog.csdnimg.cn/f939649c2dc34a7e8426141a2501267e.png)
