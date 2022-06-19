#  gitbook 插件: 版权声明

##  1. tbfed-pagefooter 插件
页面添加页脚

###  1.1 安装

```bash
npm i gitbook-plugin-tbfed-pagefooter
```
###  1.2 配置

```bash
{
    "plugins": [
       "tbfed-pagefooter"
    ],
    "pluginsConfig": {
        "tbfed-pagefooter": {
            "copyright":"Copyright &copy smoothies.com.cn 2022",
            "modify_label": "该文件修订时间：",
            "modify_format": "YYYY-MM-DD HH:mm:ss"
        }
    }
}
```
###  1.3 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/3b32479c48e5446480b7b3123aea1575.png)
##  2. page-copyright 插件
[page-copyright](https://www.npmjs.com/package/gitbook-plugin-page-copyright)插件是页面页脚版权（内容更多）

###  2.1 安装

```bash
npm i gitbook-plugin-page-copyright
```

### 2.2 配置

```bash
{
    "plugins" : ["page-copyright"],
    "pluginsConfig" : {
        "page-copyright": {
          "description": "modified at",
          "signature": "宗勋",
          "wisdom": "全栈工程师",
          "format": "YYYY-MM-dd hh:mm:ss",
          "copyright": "Copyright &#169; ",
          "timeColor": "#666",
          "copyrightColor": "#666",
          "utcOffset": "8",
          "style": "normal",
          "noPowered": false,
        }
    }
}
```
运行以后有很多信息是原创作者的，这些配置都在你的插件安装目录 `**\node_modules\gitbook-plugin-page-copyright` 下的 `index.js` 中，自己可以修改。大部分信息都在 `defaultOption` 中。

那个二维码可以在文件中找到 `QRcode` 改成自己的，或者直接把所有的 d`efaultOption.isShowQRCode` 改成`false`

## 3. copyright 插件
[gitbook-plugin-copyright](https://www.npmjs.com/package/gitbook-plugin-copyright) 是基于Gitbook实现的版权保护插件,用于复制内容时追加版权信息以及文章末尾添加版权小尾巴.

###  3.1 安装

```bash
npm i gitbook-plugin-copyright
```

or

```bash
gitbook install
```

###  3.2 配置

```bash
{
    "plugins": ["copyright"],
    "pluginsConfig": {
       "copyright": {
         "site": "https://smoothies.com.cn/gitbook-demo/",
         "author": "ghostwritten",
         "website": "ghostwritten",
         "image": "https://pic4.zhimg.com/80/v2-94401c2c3fa20c1d5525cf6c16742909_xl.jpg",
         "copyProtect": false
        }
    }
}
```

### 3.3 效果
（略）

### 3.4 评价
此设置致使文章界面增加无用、复杂，污染简约。
综合指数：综合指数：⭐️⭐️
