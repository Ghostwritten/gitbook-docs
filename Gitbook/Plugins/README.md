# 插件


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
| [accordion](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/17_Gitbook_Plugin_Text_Hiding.html)                                | 手风琴折叠模块                                 |
| [ace](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/7_Gitbook_Plugin_Code_Block.html#5-ace-%E6%8F%92%E4%BB%B6)                                      | 代码 ACE 显示                               |
| [advanced-emoji](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/17_Gitbook_Plugin_Emoji.html?h=advanced-emoji)                           | 显示 emoji 表情                             |
| [alerts](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/6_Gitbook_Plugin_Tips_and_Emphasis.html?h=alerts)                                   | 告警级别信息提示                                |
| [anchor-navigation-ex](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/4_Gitbook_Plugin_Directory_Navigation.html?h=anchor-navigation-ex)                     | 悬浮目录和回到顶部                               |
| [ancre-navigation](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/4_Gitbook_Plugin_Directory_Navigation.html#2-ancre-navigation-%E6%8F%92%E4%BB%B6)                         | 悬浮目录和回到顶部                               |
| auto-scroll-table                        | 表格滚动条                                   |
| [back-to-top-button](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/4_Gitbook_Plugin_Directory_Navigation.html#3-back-to-top-button-%E6%8F%92%E4%BB%B6)                       | 当页面超过一屏幕时，会显示一个 回到顶部按钮                  |
| [change_girls](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/13_Gitbook_Plugin_Background.html?h=change_girls)                             | 可自动切换的背景                                |
| [click-reveal](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/17_Gitbook_Plugin_Text_Hiding.html#2-click-reveal-%E6%8F%92%E4%BB%B6)                            | 默认隐藏，点击可显示                              |
| [code](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/7_Gitbook_Plugin_Code_Block.html?h=code)                                     | 代码添加行号&复制按钮                             |
| [copy-code-button](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/7_Gitbook_Plugin_Code_Block.html#2-copy-code-button-%E6%8F%92%E4%BB%B6)                         | 代码复制按钮                                  |
| [custom-favicon](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/15_Gitbook_Plugin_Icons_and_Logos.html#1-custom-favicon-%E6%8F%92%E4%BB%B6)                           | 修改网页标题图标 favicon                        |
| [chapter-fold](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/3_Gitbook_Plugin_Side_Navigation.html#1-chapter-fold-%E6%8F%92%E4%BB%B6)                             | 导航目录默认折叠                                |
| Chart                                    | 绘制图形                                    |
| [donate](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/9_Gitbook_Plugin_Appreciate.html?h=donate)                                   | 贡献                                      |
| [disqus](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/11_Gitbook_Plugin_Commment.html?h=disqus)                                   | 评论系统                                    |
| [emphasize](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/6_Gitbook_Plugin_Tips_and_Emphasis.html#3-emphasize-%E6%8F%92%E4%BB%B6)                                | 为文字加上底色                                 |
| [expandable-chapters](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/3_Gitbook_Plugin_Side_Navigation.html#2-expandable-chapters-%E6%8F%92%E4%BB%B6)                      | 导航目录折叠扩展                                |
| [expandable-chapters-small](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/3_Gitbook_Plugin_Side_Navigation.html#3-expandable-chapters-small-%E6%8F%92%E4%BB%B6)                | expandable-chapters-small               |
| [edit-link](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/19_Gitbook_Plugin_Page_Editing.html?h=edit-link)                                | 添加编辑按钮                                  |
| [favicon](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/15_Gitbook_Plugin_Icons_and_Logos.html#2-favicon-%E6%8F%92%E4%BB%B6)                                  | 显示网站图标                                  |
| [flexible-alerts](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/6_Gitbook_Plugin_Tips_and_Emphasis.html#2-flexible-alerts-%E6%8F%92%E4%BB%B6)                          | flexible-alerts                         |
| [github](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/16_Gitbook_Plugin_Github.html?h=github)                                   | 在右上角添加 github 图标                        |
| [hide-element](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/17_Gitbook_Plugin_Text_Hiding.html#3-hide-element-%E6%8F%92%E4%BB%B6)                             | 可以隐藏不想看到的元素，比如导航栏中 Published by GitBook |
| [insert-logo](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/15_Gitbook_Plugin_Icons_and_Logos.html#3-insert-logo-%E6%8F%92%E4%BB%B6)                              | 插入logo                                  |
| include-codeblock                        | 包含或显示文件                                 |
| include-csv                              | 显示 CSV 文件内容                             |
| KaTex                                    | 数学公式支持                                  |
| [klipse](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/7_Gitbook_Plugin_Code_Block.html#3-klipse-%E6%8F%92%E4%BB%B6)                                   | klipse 嵌入类似IDE的功能                       |
| [lightbox](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/14_Gitbook_Plugin_Image_View.html?h=lightbox)                                 | 单击查看图片 点击图片可显示，大小不变                     |
| lunr                                     | lunr                                    |
| [local-video](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/21_Gitbook_Plugin_Video.html?h=local-video)                              | 视频                                      |
| mermaid                                  | 流程图                                     |
| Mermaid-gb3                              | 流程图                                     |
| Musicxml                                 | 乐谱渲染                                    |
| [page-copyright](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/12_Gitbook_Plugin_Copyright_Notice.html#2-page-copyright-%E6%8F%92%E4%BB%B6)                           | 页面页脚版权                                  |
| [page-toc-button](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/4_Gitbook_Plugin_Directory_Navigation.html#4-page-toc-button-%E6%8F%92%E4%BB%B6)                          | 悬浮目录                                    |
| page-top                                 | page-top.md                             |
| [page-treeview](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/5_Gitbook_Plugin_Article_TOC.html?h=page-treeview)                            | 生成页内目录                                  |
| [page-treeview-simple](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/5_Gitbook_Plugin_Article_TOC.html#2-page-treeview-simple-%E6%8F%92%E4%BB%B6)                      | 生成页内目录精简版本                              |
| [pageview-count](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/23_Gitbook_Plugin_Statistics.html#3-pageview-count-%E6%8F%92%E4%BB%B6)                           | 阅读量计数                                   |
| [popup](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/14_Gitbook_Plugin_Image_View.html#2-popup-%E6%8F%92%E4%BB%B6)                                    | 单击图片，在新页面查看大图                           |
| [prism](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/7_Gitbook_Plugin_Code_Block.html#4-prism-%E6%8F%92%E4%BB%B6)                                    | 语法高亮                                    |
| PlantUML                                 | UML                                     |
| reward                                   | 赞赏组件                                    |
| [rss](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/20_Gitbook_Plugin_RSS.html?h=rss)                                      | RSS 订阅                                  |
| [search](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/10_Gitbook_Plugin_Search.html?h=search)                                   | 搜索                                      |
| [search-pro](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/10_Gitbook_Plugin_Search.html#2-search-pro-%E9%AB%98%E7%BA%A7%E6%90%9C%E7%B4%A2)                               | 高级搜索                                    |
| [search-plus](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/10_Gitbook_Plugin_Search.html#3-search-plus-%E6%8F%92%E4%BB%B6)                              | search-plus                             |
| [sectionx](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/17_Gitbook_Plugin_Text_Hiding.html#4-sectionx-%E6%8F%92%E4%BB%B6)                              | 将页面分块显示                                |
| [simple-page-toc](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/5_Gitbook_Plugin_Article_TOC.html#3-simple-page-toc-%E6%8F%92%E4%BB%B6)                     | 生成本页目录                 |
| [sharing-plus](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/8_Gitbook_Plugin_Sharing.html?h=sharing-plus)                             | 分享当前页面                                  |
| [sidebar-style](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/3_Gitbook_Plugin_Side_Navigation.html#4-sidebar-style-%E6%8F%92%E4%BB%B6)                            | 会替换掉 Published by GitBook               |
| [splitter](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/3_Gitbook_Plugin_Side_Navigation.html#5-splitter-%E6%8F%92%E4%BB%B6)                                 | 侧边栏宽度可调节                                |
| [sitemap-general](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/22_Gitbook_Plugin_SEO.html#2-sitemap-general-%E6%8F%92%E4%BB%B6)                          | 自动生成 sitemap 文件                         |
| [summary](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/1_Gitbook_Plugin_Summary.html?h=summary)                                  | 自动生成 SUMMARY.md                         |
| [tbfed-pagefooter](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/12_Gitbook_Plugin_Copyright_Notice.html?h=tbfed-pagefooter)                         | 页面添加页脚                                  |
| tags                                     | tags                                    |
| [todo](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/18_Gitbook_Plugin_TODO.html?h=todo)                                     | todo                                    |
| [Terminal](https://smoothies.com.cn/gitbook-docs/Gitbook/Plugins/7_Gitbook_Plugin_Code_Block.html#6-terminal-%E6%8F%92%E4%BB%B6)                                 | Terminal 终端                             |
| Version-select                           | 文档多版本                                   |
