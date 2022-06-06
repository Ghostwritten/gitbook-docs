# gitbook 插件: 访问统计


##  1. Google 统计
### 1.1 安装

```bash
npm i gitbook-plugin-ga
```
###  1.2 配置

```bash
{
    "plugins": ["ga"]
}
```
`book.json` 中的插件配置设置 Google Analytics 跟踪 ID

```bash
{
    "plugins": ["ga"],
    "pluginsConfig": {
        "ga": {
            "token": "UA-XXXX-Y"
        }
    }
}
```

您可以通过传递其他配置选项来自定义跟踪器对象。您可以传入auto或none对象：
```bash
{
    "plugins": ["ga"],
    "pluginsConfig": {
        "ga": {
            "token": "UA-XXXX-Y",
            "configuration": {
                "cookieName": "new_cookie_name",
                "cookieDomain": "mynew.domain.com"
            }
        }
    }
}
```
##  2. Baidu 统计
### 2.1 配置

```bash
{
    "plugins": ["3-ba"],
    "pluginsConfig": {
        "3-ba": {
            "token": "xxxxxxxx"
        }
    }
}
```
###  2.2 获取 Token
![在这里插入图片描述](https://img-blog.csdnimg.cn/d362b8c32af1456aac89e202615e0e02.png)
###  2.3  效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/448bf5ad7360484ba08fd2a3d5f240cc.png)


##  3. pageview-count 插件
页面阅读量计数

### 3.1 安装

```bash
npm i gitbook-plugin-pageview-count
```
### 3.2 配置
book.json配置：
```bash
{
    "plugins": [
        "pageview-count"
    ]
}
```
###  3.3 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/95f13918844b480da22534d8c9204670.png)
