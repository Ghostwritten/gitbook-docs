#  gitbook 插件 赞赏
@[toc]
##   1. donate 打赏插件
如果喜欢，请打赏
###  1.1 安装

```bash
npm i gitbook-plugin-donate
```

### 1.2 配置
book.json配置：
```bash
{
    plugins: [
        ”donate“
    ],

    "pluginsConfig": ['
        "donate": {
          "wechat": "https://github.com/Ghostwritten/gitbook-demo/blob/gh-pages/img/aplipay.png?raw=true",
          "alipay": "https://github.com/Ghostwritten/gitbook-demo/blob/gh-pages/img/wechat.png?raw=true",
          "title": "鼓励一下",
          "button": "赏",
          "alipayText": "支付宝打赏",
          "wechatText": "微信打赏"
        },
    ]
}
```
###  1.3 效果
[!TIP|style:flat|label:My own heading|iconVisibility:hidden]
请点击"打赏"，查看效果。
