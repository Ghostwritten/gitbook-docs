#  SEO

##  1. sitemap 插件
[sitemap](https://www.npmjs.com/package/gitbook-plugin-sitemap) 插件：生成sitemap


### 1.1 安装

```bash
npm i gitbook-plugin-sitemap
```
###  1.2 配置

```bash
{
    "plugins": ["sitemap"],
    "pluginsConfig": {
        "hostname": {
            "prefix": "https://www.example.com"
        }
    }
}
```
##  2. sitemap-general 插件
[sitemap-general](https://www.npmjs.com/package/gitbook-plugin-sitemap-general) 插件：用来生成网站地图 sitemap (网站中页面的 URL 地址列表)

###  2.1 安装

```bash
npm i gitbook-plugin-sitemap-general
```
###  2.2 配置

```bash
{
    "plugins": ["sitemap-general"],
    "pluginsConfig": {
        "sitemap-general": {
            "prefix": "http://gitbook.example.com"
        }
    }
}
```
