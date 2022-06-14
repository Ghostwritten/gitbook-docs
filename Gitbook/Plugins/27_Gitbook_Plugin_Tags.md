#  gitbook 插件 标签

##  1. tags 插件
[tags](https://www.npmjs.com/package/gitbook-plugin-tags) 插件 给文章带上标签
###  1.1 安装

```bash
npm i gitbook-plugin-tags
```

### 1.2 配置

```bash
{
  "plugins": [
    "tags"
  ],
}
```


创建一个以`tags.md`根目录命名的文件并将其放在`SUMMARY.md`. 有效`SUMMARY.md`的是：

```bash
# Summary

* [Introduction](README.md)
* [First Chapter](chapter1.md)
* [Tags](tags.md)
```
您可以将文件保留为`tags.md`空或添加标题，例如

```bash
# Tags
```
在md文章页面中添加标签

```bash
$ head  Linux-Command/Linux_Command_ab.md 
#  linux Command ab 网站性能压力测试工具
tags: 测试
.....
```



###  1.3 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/9d91b2f580214d26b6d0453a1e4c3cd5.png)
![在这里插入图片描述](https://img-blog.csdnimg.cn/d07f3f7c4a7545b6b61db61bdb44f02f.png)

###  1.4 评价
很完美
综合指数：⭐️⭐️⭐️⭐️⭐️
