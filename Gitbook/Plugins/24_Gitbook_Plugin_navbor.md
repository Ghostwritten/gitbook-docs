#  Gtibook 插件 顶部导航


## 1. NavBar 插件
## 2. 安装

从源码GitHub地址中下载，放到 `node_modules` 文件夹里（GitHub地址在进入插件地址右侧的GitHub链接）.

```bash
$ cd node_modules
$ git clone https://github.com/jchamath/gitbook-plugin-navbar.git
```

## 3. 配置

```bash
{
    "plugins": ["navbar"]
}

"pluginsConfig": {
  "navbar": {
    "logo": {
      "link": "http://example.com/",
      "image": "http://example.com/resources/static/logo.png",
      "alt": "Example"
    },
    "menu": {
      "items": [{
        "text": "Home",
        "link": "http://example.com"
      }, {
        "text": "Page",
        "link": "http://example.com/page/"
      }],
      "style": {
        "color": "black",
        "hover": "#3579e2"
      }
    },
    "style": {
      "backgroundColor": "white",
      "linkColor": "black",
      "linkHoverColor": "blue"
    }
  },
}
```
##  4.  效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/b428c5d2cebd4e0ebd134efc26f0bf85.png)
