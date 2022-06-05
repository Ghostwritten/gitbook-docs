# 插件

---

## 1. 默认插件
Gitbook默认带有7个插件（功能性5个，搜索有两个，主题一个）：

 - `livereload` 热加载插件
 - `highlight` 语法高亮插件
 - `search` 搜索插件
 - `lunr` 搜索插件后台服务
 - `sharing` 分享插件
 - `fontsettings` 字体设置插件
 - `theme-default` 主题


## 2. 添加和移除插件
在 `book.json` 中的 plugins 模块能够配置，能够使 Gitbook 的功能更丰富。

在 plugins 中添加对应的插件名称

```bash
"plugins": [
    "highlight",
    "-search",
    "back-to-top-button",
    "expandable-chapters-small",
    "insert-logo"
]
```

其中"`-search`"中的 `-` 符号代表去除默认自带的插件

## 3. 插件配置pluginsConfig
部分插件在引入后需要进行详细的配置，可以在 `pluginsConfig` 中加配置说明。

```bash
"pluginsConfig": {
    "insert-logo": {
      "url": "images/logo.png",
      "style": "background: none; max-height: 30px; min-height: 30px"
    }
}
```

## 4. 插件安装
### 4.1 方法一

插件无需单独下载安装，只有在 `book.json` 中配置好对应的插件，执行 `gitbook install`, 缺少的插件就会自动下载安装

```bash
gitbook install .
```

### 4.2 方法二
自定义的插件也可以通过 npm 或者将解压后的包复制到 node_modules 目录中进行安装。

```bash
npm install gitbook-plugin-xxx
```

### 4.3 方法三
也可以从源码GitHub地址中下载，放到 `node_modules` 文件夹里（GitHub地址在进入插件地址右侧的GitHub链接）.


##  5. 插件预览
| 模块名称                                     | 功能描述                                    |
|------------------------------------------|-----------------------------------------|
| accordion                                | 手风琴折叠模块                                 |
| ace                                      | 代码 ACE 显示                               |
| advanced-emoji                           | 显示 emoji 表情                             |
| alerts                                   | 告警级别信息提示                                |
| anchor-navigation-ex                     | 悬浮目录和回到顶部                               |
| ancre-navigation                         | 悬浮目录和回到顶部                               |
| auto-scroll-table                        | 表格滚动条                                   |
| back-to-top-button                       | 当页面超过一屏幕时，会显示一个 回到顶部按钮                  |
| change_girls                             | 可自动切换的背景                                |
| click-reveal                             | 默认隐藏，点击可显示                              |
| code                                     | 代码添加行号&复制按钮                             |
| copy-code-button                         | 代码复制按钮                                  |
| custom-favicon                           | 修改网页标题图标 favicon                        |
| chapter-fold                             | 导航目录默认折叠                                |
| Chart                                    | 绘制图形                                    |
| donate                                   | 贡献                                      |
| disqus                                   | 评论系统                                    |
| emphasize                                | 为文字加上底色                                 |
| expandable-chapters                      | 导航目录折叠扩展                                |
| expandable-chapters-small                | expandable-chapters-small               |
| edit-link                                | 添加编辑按钮                                  |
| favicon                                  | 显示网站图标                                  |
| flexible-alerts                          | flexible-alerts                         |
| github                                   | 在右上角添加 github 图标                        |
| hide-element                             | 可以隐藏不想看到的元素，比如导航栏中 Published by GitBook |
| insert-logo                              | 插入logo                                  |
| include-codeblock                        | 包含或显示文件                                 |
| include-csv                              | 显示 CSV 文件内容                             |
| KaTex                                    | 数学公式支持                                  |
| klipse                                   | klipse 嵌入类似IDE的功能                       |
| lightbox                                 | 单击查看图片 点击图片可显示，大小不变                     |
| lunr                                     | lunr                                    |
| local-video                              | 视频                                      |
| mermaid                                  | 流程图                                     |
| Mermaid-gb3                              | 流程图                                     |
| Musicxml                                 | 乐谱渲染                                    |
| page-copyright                           | 页面页脚版权                                  |
| page-toc-button                          | 悬浮目录                                    |
| page-top                                 | page-top.md                             |
| page-treeview                            | 生成页内目录                                  |
| page-treeview-simle                      | 生成页内目录精简版本                              |
| pageview-count                           | 阅读量计数                                   |
| popup                                    | 单击图片，在新页面查看大图                           |
| prism                                    | 语法高亮                                    |
| PlantUML                                 | UML                                     |
| reward                                   | 赞赏组件                                    |
| rss                                      | RSS 订阅                                  |
| search                                   | 搜索                                      |
| search-pro                               | 高级搜索                                    |
| search-plus                              | search-plus                             |
| sectionx.md                              | sectionx                                |
| [simple-page-toc(cat-article-content.md) | plugins/simple-page-toc                 |
| sharing-plus                             | 分享当前页面                                  |
| sidebar-style                            | 会替换掉 Published by GitBook               |
| splitter                                 | 侧边栏宽度可调节                                |
| sitemap-general                          | 自动生成 sitemap 文件                         |
| summary                                  | 自动生成 SUMMARY.md                         |
| tbfed-pagefooter                         | 页面添加页脚                                  |
| tags                                     | tags                                    |
| todo                                     | todo                                    |
| Terminal                                 | Terminal 终端                             |
| Version-select                           | 文档多版本                                   |
