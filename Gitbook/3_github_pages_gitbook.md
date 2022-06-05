# gitbook 发布 github pages

## 1. github 创建仓库

例如：`git-handbook`

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bb05e974-b186-4008-bccd-0a8394e728d7/Untitled.png)

# 2. 本地创建github仓库

## 2.1 linux

仓库名：`git-handbook`

初始化配置操作，推送[github pages](https://pages.github.com/)

```bash
$ mkdir git-handbook
$ cd git-handbook
$ gitbook init
$ gitbook build
$ ls _book/
gitbook  index.html  search_index.json
$  ls
_book  README.md  SUMMARY.md

$ git init
$ echo "*~" > .gitignore
$ echo "_book" >> .gitignore
$ cp -r _book/* .
$ ls
_book  gitbook  index.html  README.md  search_index.json  SUMMARY.md
$ git add --all
$ git commit -m "Publish book"
$ git remote add origin https://github.com/Ghostwritten/git-handbook.git
$ git push -u origin master

Username for 'https://github.com': ghostwritten
Password for 'https://ghostwritten@github.com':<token>
```

# 3. 配置 github pages

## 3.1 ****新建分支****

```bash
git checkout --orphan gh-pages
```

## 3.2 ****删除不需要的文件****

切换到pages分支后，我们需要将_books目录之外的文件都清理掉：

```bash
git rm --cached -r .
git clean -df
rm -rf *~
```

## 3.3 ****添加忽略文件****

使用文本编辑器，创建名为`.gitignore`的文件，内容如下：

```bash
*~
_book
.DS_Store
```

通过.gitignore文件，本地仓库将忽略临时文件和_book文件夹。

## 3.4 ****复制_book文件夹到分支根目录****

```bash
cp -r _book/* .
```

## 3.5 ****推送****

```bash
git add .
git commit -m '更新说明'
git push -u origin gh-pages
```

master与gh-pages的不同之处：

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/74567cf9-57a3-4f0d-bf09-7607a17ffc39/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5c9a3eb4-07f9-470e-8088-efdf168bf0b2/Untitled.png)

## 3.6 验证

如果没有自定义的域名，你访问的方式地址为：*`http://<github名字>.github.io/git-handbook`*

这里我配置了自己的域名，`ghostwritten*.github.io`* 重定向到了个人站点 [`smoothies.com.cn`](http://smoothies.com.cn/)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/da6d7469-5533-4e04-99af-4439297c551a/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c0b493f0-b35c-43e8-8556-3aa1eae648ac/Untitled.png)

# 4. 推送至gitbook仓库

[注册gitbook](https://www.gitbook.com/)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/8a8d3986-397f-4994-85f6-1966fb76cac4/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7e0c6659-b34f-4105-9d50-daa086d748e3/Untitled.png)

与仓库同名

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/cffa9135-6856-4f83-84b3-e66c4fc4b8ce/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2c5605fe-cb67-43a6-aa44-4d3a89f17ea3/Untitled.png)
