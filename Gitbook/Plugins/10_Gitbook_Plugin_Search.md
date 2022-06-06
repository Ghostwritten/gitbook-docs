# 查询

##  1. search 插件
[search](https://www.npmjs.com/package/gitbook-plugin-search) 插件：查找内容, 不支持中文
这个插件是 GitBook 的默认插件，它为你的书添加了一个交互式搜索栏。

该插件与后端无关。

###  1.1 安装

```bash
npm i gitbook-plugin-search
```
###  1.2 配置

```bash
{
    plugins: ["-search"]
}
```

## 2. search-pro 高级搜索

[search-pro](https://www.npmjs.com/package/gitbook-plugin-search-pro)插件支持中文搜索


[!NOTE|style:flat|lable:Mylable|iconVisibility:hidden]
在搜索结果中，关键字会高亮；自带的 search 插件，关键字不会高亮

[!NOTE|style:flat|lable:Mylable|iconVisibility:hidden]
在使用此插件之前，需要将默认的 search 和 lunr 插件去掉；



### 2.1 安装

```bash
npm i gitbook-plugin-search-pro
```
###  2.2 配置
`book.json`配置
```bash
{
    "plugins": [
          "-lunr", 
          "-search", 
          "search-pro"
    ]
}
```
###  2.3 效果
见当前 book 左上角查找框 输入并搜索
![在这里插入图片描述](https://img-blog.csdnimg.cn/ed9a97783f3d465fa9e0a7708ef59023.png)

##  3. search-plus 插件
[search-plus](https://www.npmjs.com/package/gitbook-plugin-search-plus) 插件一个强大的 GitBook 搜索插件。

特征
* 搜索任何字符
* 跨元素搜索(用于搜索代码)
* 记住搜索url
插件地址：[https://www.npmjs.com/package/gitbook-plugin-search-plus](https://www.npmjs.com/package/gitbook-plugin-search-plus)

### 3.1 安装

```bash
npm i gitbook-plugin-search-plus
```
### 3.2 配置
`book.json`配置
```c
{
    plugins: ["-lunr", "-search", "search-plus"]
}
```
### 3.3 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/783f635341af4933ae6b9b1107463afc.gif#pic_center)
![在这里插入图片描述](https://img-blog.csdnimg.cn/e552314e590b4e30ba1bd81e414ef5bd.gif#pic_center)
![在这里插入图片描述](https://img-blog.csdnimg.cn/7e452d4f76b4431ab46efa11e3a7898e.gif#pic_center)
