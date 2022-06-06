# RSS


##  1. RSS 插件
[RSS 插件](https://www.npmjs.com/package/gitbook-plugin-rss)：添加 rss 订阅功能。

###  1.1 安装

```bash
npm i gitbook-plugin-rss
```
### 1.2 配置

```bash
{
    "plugins": [ "rss" ],
    "pluginsConfig": {
        "rss": {
            "title": "GitBook 使用教程",
            "description": "记录 GitBook 的配置和一些插件的使用",
            "author": "Jikai Zhang",
            "feed_url": "http://gitbook.zhangjikai.com/rss",
            "site_url": "http://gitbook.zhangjikai.com/",
            "managingEditor": "me@zhangjikai.com",
            "webMaster": "me@zhangjikai.com",
            "categories": [
                "gitbook"
            ]
        }
    }
}
```
效果见右上角。

###  1.3 参数

 - title (required string) — Title of your site or feed
 - site_url (required url string) — Url to the site that the feed is for.
 - feed_url (required url string) — Url to the rss feed.
 - description (optional string) — A short description of the feed.
 - generator (optional string) — Feed generator.
 - image_url (optional url string) — Small image for feed readers to use.
 - managingEditor (optional string) — Who manages content in this feed.
 - webMaster (optional string) — Who manages feed availability and technical support.
 - categories (optional array of strings) — One or more categories this feed belongs to.
 - copyright (optional string) — Copyright information for this feed.
 - language (optional string) — The language of the content of this feed.
