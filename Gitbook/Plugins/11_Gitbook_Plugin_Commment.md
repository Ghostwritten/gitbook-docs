#  评论

##  1. Disqus 插件
[Disqus](https://www.npmjs.com/package/gitbook-plugin-disqus) 是一个非常流行的为网站集成评论系统的工具，同样，gitbook 也可以集成 disqus 以便可以和读者交流。

首先，需要在 disqus 上注册一个账号，然后添加一个 website，这会获得一个关键字，然后在集成时配置这个关键字即可。

###  1.1 安装 

```bash
npm i gitbook-plugin-disqus
```
###   1.2 配置
book.json配置：

```bash
{
    "plugins": ["disqus"],
    "pluginsConfig": {
        "disqus": {
            "shortName": "introducetogitbook"
        }
    }  
}
```

> 注意：上面的 shortName 的值就是你在 disqus 上创建的 website 获得的唯一关键字。

### 1.3 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/8d699b3d4f6c4d34b79bf0ea887f115a.png)

