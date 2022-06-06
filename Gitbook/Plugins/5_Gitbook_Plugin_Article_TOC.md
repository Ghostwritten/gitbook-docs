#  TOC 目录


## 1. page-treeview 插件
[page-treeview](https://www.npmjs.com/package/gitbook-plugin-page-treeview-simple) 插件是生成页内目录

不需要插入标签，能支持到6级目录，安装可用

安装

```bash
npm i gitbook-plugin-simple-page-toc
```
`book.json`配置：
```bash
{
    "plugins": ["page-treeview"]
}
```
非必要配置：

```bash
"pluginsConfig": {
    "page-treeview": {
        "copyright": "Copyright &#169; aleen42",
        "minHeaderCount": "2",
        "minHeaderDeep": "2"
    }
}
```
这个插件生成目录以后，下面有一行关于版权的文字。如果想去掉的话，找到插件目录下的index.js文件：`***/node_modules/gitbook-plugin-page-treeview/lib/index.js` 找到如下这段代码
![在这里插入图片描述](https://img-blog.csdnimg.cn/04c1ae2c75a047189edfd8fd062de00e.png)


##  2. page-treeview-simple 插件
和 `page-treeview` 功能相同，在其基础之上修改了以下内容：

 - 去除 `copyRight` 的提示内容与占用的空白高
 - 取消章节的折叠效果，默认展开显示完整章节



效果图
![在这里插入图片描述](https://img-blog.csdnimg.cn/77a476ec9fe44d379c8ab85d8b0be4ac.png)

##  3. simple-page-toc 插件
[simple-page-toc](https://www.npmjs.com/package/gitbook-plugin-simple-page-toc) 插件生成本页目录 需要在文章中插入标签，支持1-3级目录 页面顶端生成。另外 GitBook 在处理重复的标题时有些问题，所以尽量不适用重复的标题。

安装

```bash
npm i gitbook-plugin-simple-page-toc
```
`book.json`配置：
```bash
{
    "plugins" : [
        "simple-page-toc"
    ],
    "pluginsConfig": {
        "simple-page-toc": {
            "maxDepth": 3,
            "skipFirstH1": true
        }
    }
}
```
|参数|	说明|
|--|--|
|"maxDepth": 3|	使用深度最多为maxdepth的标题。|
|"skipFirstH1": true|	排除文件中的第一个h1级标题。|

使用方法: 在需要生成目录的地方用下面的标签括起来，全文都生成的话就在首尾添加
![在这里插入图片描述](https://img-blog.csdnimg.cn/69b03f7c58834e09b9d5584c4104653f.png)
效果图：
![在这里插入图片描述](https://img-blog.csdnimg.cn/8f54c5805d0e4e98afe45444bdc347fd.png)

##  4. page-toc 插件
[page-toc](https://www.npmjs.com/package/gitbook-plugin-page-toc-af) 插件在你的 Gitbook 的每个页面上添加了一个目录 (TOC)。您可以设置目录是否默认显示在所有页面上，您可以启用或禁用个别页面上的目录以覆盖默认值。
安装

```bash
npm i gitbook-plugin-page-toc-af
```
`book.json`配置:

```bash
{
  "plugins": [ "page-toc" ],
  "pluginsConfig": {
    "page-toc": {
      "selector": ".markdown-section h1, .markdown-section h2, .markdown-section h3, .markdown-section h4",
      "position": "before-first",
      "showByDefault": true
    }
  }
}
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/e373d300df9f456f935b6e2aa0bcd512.png)
