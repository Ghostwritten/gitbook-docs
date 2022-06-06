#  gitbook 插件：图片查看


##  1. lightbox 插件
[lightbox](https://www.npmjs.com/package/gitbook-plugin-lightbox) 插件：单击查看图片

点击图片可显示，大小不变

以弹窗形式查看图片，查看原图：lightbox

### 1.1 安装

```bash
npm i gitbook-plugin-lightbox
```
## 1.2 配置

```bash
{
  "plugins": ["lightbox"]
}
{
  "pluginsConfig": {
    "lightbox": {
      "includeJQuery": false
      "sameUuid": true
      "options": {
      "resizeDuration": 200,
      "wrapAround": true
      }
    }
  }
}
```

###  1.3 效果

##  2. popup 插件
popup 插件：单击图片，在新页面查看大图。
###  2.1 安装

```bash
npm i gitbook-plugin-popup
```
###  2.2 配置

```bash
{
  "plugins": [ "popup" ]
}
```
###  2.3 效果
略
