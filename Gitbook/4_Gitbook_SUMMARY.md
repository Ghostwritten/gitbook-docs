#  Gitbook SUMMARY.md


##  1. 简介
GitBook默认使用SUMMARY.md文件实现目录结构的设定，在该文件中，可以通过缩进实现多级目录的效果，如：

```bash
# Summary

* [第一章](section1/README.md)
    * [第一节](section1/example1.md)
    * [第二节](section1/example2.md)
* [第二章](section2/README.md)
    * [第一节](section2/example1.md)
```
但是有个问题：gitbook默认只支持两层的导航栏，在遇到内容比较多需要章节层次比较深时，很不方便。

好在后来gitbook终于提供了多级导航栏的支持。

##  2. 多级目录实现

```bash
bui# Summary

 * [介绍](introduction/index.md)
    * [mercury 信息](introduction/information.md)
        * [Google Dapper](dapper/index.md)
 * [mercury实现](implementation/index.md)
```
要实现一个多级的导入栏很简单，就改动两个地方：
 * 第一行从 “# Summary” 修改为 “bui# Summary”
 * 章节的层次结构按照原来的格式要求继续缩进

##  3. 标题和水平线
也可以通过使用标题或者水平线标识将GitBook目录分为几个不同的部分：

```bash
# Summary

### Part I

* [Introduction](README.md)
* [Writing is nice](part1/writing.md)
* [GitBook is nice](part1/gitbook.md)

### Part II

* [We love feedback](part2/feedback_please.md)
* [Better tools for authors](part2/better_tools.md)

----

* [Last part without title](part3/title.md)
```
##  5. grunt
为了方便发布到github，我选择了使用grunt。

同样为了支持多层导航栏，grunt相关的插件也需要使用新版本。

具体需要修改package.js中的以下内容，目前最新的版本是这样：

```bash
"devDependencies": {
    "grunt": "~0.4.5",
    "grunt-gitbook": "~1.5.0",
    "grunt-gh-pages": "~0.10.0",
    "grunt-contrib-clean": "~0.6.0",
    "grunt-http-server": "~1.4.0"
},
"peerDependencies": {
    "grunt": "~0.4.5"
}
```
对于旧有项目，为了更新插件版本，可以先删除原来已经安装的插件后重新安装：

```bash
rm -rf node_modules/*
npm install
```
