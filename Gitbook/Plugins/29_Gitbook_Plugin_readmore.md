#  gitbook 插件 阅读更多

##  1. readmore 插件
Gitbook 整合 OpenWrite 平台的 [readmore](https://www.npmjs.com/package/gitbook-plugin-readmore) 插件,实现博客的每一篇文章自动增加阅读更多效果,关注公众号后方可解锁全站文章,从而实现博客流量导流到微信公众号粉丝目的.

###  2. 安装

```bash
npm i gitbook-plugin-readmore
```
or

```bash
gitbook install
```
###  3. 配置
book.json

```bash
{
    "plugins": ["readmore"],
    "pluginsConfig": {
        "readmore":{
            "blogId": "30114-1655653552581-278",
            "name": "爱死亡机器人",
            "qrcode": "https://raw.githubusercontent.com/Ghostwritten/gitbook-demo/master/assets/imgs/wechat.png",
            "keyword": "vip"
        }
    }
}
```
其中,配置参数含义如下:

 - blogId : [必选]OpenWrite 后台申请的博客唯一标识,例如:`30114-1655653552581-278`
 - name : [必选]OpenWrite 后台申请的博客名称,例如：爱死亡机器人
 - qrcode : [必选]OpenWrite 后台申请的微信公众号二维码,例如：`https://raw.githubusercontent.com/Ghostwritten/gitbook-demo/master/assets/imgs/wechat.png`

 - keyword : [必选]OpenWrite 后台申请的微信公众号后台回复关键字,例如:vip

### 4. 效果
（略）
