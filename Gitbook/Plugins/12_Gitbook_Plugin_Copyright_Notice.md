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
