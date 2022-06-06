#  gitbook 插件：图标与LOGO

##  1. custom-favicon 插件
[custom-favicon 插件](https://www.npmjs.com/package/gitbook-plugin-custom-favicon): 修改网页标题图标 favicon

> 这个 pluginsConfig 和其他的不大一样。图标只能用 .ico 文件。

### 1.2 安装

```bash
npm i gitbook-plugin-custom-favicon
```
###  1.3 配置

```bash
{
    "plugins" : ["custom-favicon"],
    "pluginsConfig" : {
        "favicon": "path/to/favicon.ico"
    }
}
```
把`.ico` 格式的图标放进项目中。这个路径可以使用相对路径，比如`./images/a.ico`

###  1.4 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/7503355dfa4948529c418117717fc445.png)

##  2. favicon 插件
favicon 插件 ：修改网站图标

### 2.1 安装

```bash
npm i gitbook-plugin-favicon
```

### 2.2 配置

```bash
{
    "plugins": [
        "favicon"
    ],
    "pluginsConfig": {
        "favicon": {
            "shortcut": "assets/images/favicon.ico",
            "bookmark": "assets/images/favicon.ico",
            "appleTouch": "assets/images/apple-touch-icon.png",
            "appleTouchMore": {
                "120x120": "assets/images/apple-touch-icon-120x120.png",
                "180x180": "assets/images/apple-touch-icon-180x180.png"
            }
        }
    }
}
```

##  3. insert-logo 插件
[insert-logo 插件](https://www.npmjs.com/package/gitbook-plugin-insert-logo) ：insert-logo 插入logo

### 3.1 安装

```bash
npm i gitbook-plugin-insert-logo
```
###  3.2 配置

```bash
{
    "plugins": [ "insert-logo" ]
    "pluginsConfig": {
      "insert-logo": {
        "url": "http://www.fuming.site/dist/avator.jpg",
        "style": "background: none; max-height: 30px; min-height: 30px"
      }
    }
}
```
###  3.3 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/c6833ebfe676494f8ac1826548a93c39.png)
