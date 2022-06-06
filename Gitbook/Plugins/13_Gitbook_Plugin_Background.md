#  gitbook 插件：背景设置


## 1. change_girls 插件
change_girls插件功能是设置背景，并可自动切换的背景图片

### 1.1 安装

```bash
npm i gitbook-plugin-change_girls
```
### 1.2 配置
book.json配置：

```bash
{
    "plugins":["change_girls"],
    "pluginsConfig": {
        "change_girls" : {
            "time" : 10,
            "urls" : [
                "https://www.bizhishe.com/d/file/2019-08-26/1566827846505876.jpg", "https://www.bizhishe.com/d/file/2019-07-24/1563977671157231.jpg", "https://www.bizhishe.com/d/file/2019-07-14/1563116649970786.jpg"
            ]
        }
    }
}
```
###  1.3 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/a26778eaec6349a18a9d387579396a82.png)
