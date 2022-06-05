# Gitbook README.md

## 1. 自述和介绍
书本的首页内容默认是从文件 `README.md` 中提取的。

`README.md`是 gitbook 最基础的文件之一，它一般用来描述这本书最基本的信息。 它呈现给读者这本书最初的样子，如果内容不够简洁明了，很可能就没有看下去的欲望了。

可以通过 `gitbook init` 自动创建该文件。

如果这个文件名没有出现在 `SUMMARY.md` (目录索引文件) 中，那么它会被添加为章节的第一个条目。

## 2.  其他文件替代 README.md
一些项目更愿意将 `README.md` 文件作为项目的介绍而不是书的介绍。

大部分代码托管平台将 README.md 自动显示到项目首页，如果你不喜欢这样。 从`GitBook >2.0.0` 起，就可以在 `book.json` 中定义某个文件作为README。

```bash
book.json
{
    "structure" : {
        "readme" : "information.md"
    }
}
```
