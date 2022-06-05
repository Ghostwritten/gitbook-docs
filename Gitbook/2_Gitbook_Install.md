# Gitbook 安装


##  1. node & npm 安装

```bash
cd /usr/local
wget https://nodejs.org/dist/v17.4.0/node-v17.4.0-linux-x64.tar.gz
tar -zxvf node-v17.4.0-linux-x64.tar.gz
ln -s /usr/local/node-v17.4.0-linux-x64/bin/node /usr/local/bin/
ln -s /usr/local/node-v17.4.0-linux-x64/bin/npm /usr/local/bin/
node -v
v17.4.0
npm -v
8.3.1
```

> [nodejs 安装](https://blog.csdn.net/xixihahalelehehe/article/details/122587741?spm=1001.2014.3001.5501) node一定要安装10.X版本，否则报如下错误：

```bash
CLI version: 2.3.2
Installing GitBook 3.2.3
/usr/local/node/lib/node_modules/gitbook-cli/node_modules/npm/node_modules/graceful-fs/polyfills.js:287
      if (cb) cb.apply(this, arguments)
                 ^

TypeError: cb.apply is not a function
    at /usr/local/node/lib/node_modules/gitbook-cli/node_modules/npm/node_modules/graceful-fs/polyfills.js:287:18
    at FSReqCallback.oncomplete (fs.js:193:5)
```


> 系统：ubuntu：18.04

## 2. gitbook 安装

```bash
$ npm install gitbook-cli -g
/usr/local/node/bin/gitbook -> /usr/local/node/lib/node_modules/gitbook-cli/bin/gitbook.js
+ gitbook-cli@2.3.2
added 578 packages from 672 contributors in 191.662s

#找到gitbook命令位置
$ ls /usr/local/node-v10.24.0-linux-x64/bin/
gitbook            node               node_modules/      npm                npx                package-lock.json

#添加软连接
$ ln -s /usr/local/node-v10.24.0-linux-x64/bin/gitbook /usr/local/bin/

$ ln -s /usr/local/node-v10.24.0-linux-x64/bin/book /usr/local/bin/

$ gitbook -V
CLI version: 2.3.2
Installing GitBook 3.2.3
gitbook@3.2.3 ../../../../tmp/tmp-117466TKiRhUq3ov0O/node_modules/gitbook
├── escape-html@1.0.3
├── escape-string-regexp@1.0.5
├── destroy@1.0.4
├── ignore@3.1.2
├── bash-color@0.0.4
├── gitbook-plugin-livereload@0.0.1
├── cp@0.2.0
├── nunjucks-do@1.0.0
├── graceful-fs@4.1.4
├── github-slugid@1.0.1
├── direction@0.1.5
├── q@1.4.1
├── spawn-cmd@0.0.2
├── gitbook-plugin-fontsettings@2.0.0
├── open@0.0.5
├── is@3.3.0
├── object-path@0.9.2
├── extend@3.0.2
├── json-schema-defaults@0.1.1
├── gitbook-plugin-search@2.2.1
├── jsonschema@1.1.0
├── crc@3.4.0
├── urijs@1.18.0
├── semver@5.1.0
├── immutable@3.8.2
├── front-matter@2.3.0
├── npmi@2.0.1 (semver@4.3.6)
├── resolve@1.1.7
├── gitbook-plugin-theme-default@1.0.7
├── moment@2.13.0
├── npm@3.9.2
├── dom-serializer@0.1.0 (domelementtype@1.1.3, entities@1.1.2)
├── tmp@0.0.28 (os-tmpdir@1.0.2)
├── error@7.0.2 (xtend@4.0.2, string-template@0.2.1)
├── omit-keys@0.1.0 (isobject@0.2.0, array-difference@0.0.1)
├── mkdirp@0.5.1 (minimist@0.0.8)
├── js-yaml@3.14.1 (esprima@4.0.1, argparse@1.0.10)
├── gitbook-plugin-lunr@1.2.0 (html-entities@1.2.0, lunr@0.5.12)
├── gitbook-plugin-highlight@2.0.2 (highlight.js@9.2.0)
├── gitbook-plugin-sharing@1.0.2 (lodash@3.10.1)
├── i18n-t@1.0.1 (lodash@4.17.21)
├── gitbook-markdown@1.3.2 (kramed-text-renderer@0.2.1, gitbook-html@1.3.3, kramed@0.5.6, lodash@4.17.21)
├── gitbook-asciidoc@1.2.2 (gitbook-html@1.3.3, asciidoctor.js@1.5.5-1, lodash@4.17.21)
├── send@0.13.2 (fresh@0.3.0, etag@1.7.0, statuses@1.2.1, range-parser@1.0.3, ms@0.7.1, depd@1.1.2, mime@1.3.4, debug@2.2.0, http-errors@1.3.1, on-finished@2.3.0)
├── fresh-require@1.0.3 (is-require@0.0.1, shallow-copy@0.0.1, astw@1.3.0, acorn@0.9.0, sleuth@0.1.1, escodegen@1.14.3, through2@0.6.5)
├── rmdir@1.2.0 (node.flow@1.2.3)
├── request@2.72.0 (tunnel-agent@0.4.3, aws-sign2@0.6.0, forever-agent@0.6.1, oauth-sign@0.8.2, is-typedarray@1.0.0, caseless@0.11.0, stringstream@0.0.6, aws4@1.11.0, isstream@0.1.2, json-stringify-safe@5.0.1, tough-cookie@2.2.2, node-uuid@1.4.8, qs@6.1.2, hawk@3.1.3, combined-stream@1.0.8, mime-types@2.1.34, http-signature@1.1.1, form-data@1.0.1, bl@1.1.2, har-validator@2.0.6)
├── read-installed@4.0.3 (debuglog@1.0.1, util-extend@1.0.3, slide@1.1.6, readdir-scoped-modules@1.1.0, read-package-json@2.1.2)
├── cpr@1.1.1 (rimraf@2.4.5)
├── tiny-lr@0.2.1 (parseurl@1.3.3, livereload-js@2.4.0, qs@5.1.0, debug@2.2.0, faye-websocket@0.10.0, body-parser@1.14.2)
├── cheerio@0.20.0 (entities@1.1.2, lodash@4.17.21, css-select@1.2.0, htmlparser2@3.8.3, jsdom@7.2.2)
├── juice@2.0.0 (deep-extend@0.4.2, slick@1.12.2, batch@0.5.3, cssom@0.3.1, cross-spawn-async@2.2.5, commander@2.9.0, web-resource-inliner@2.0.0)
├── chokidar@1.5.0 (async-each@1.0.3, path-is-absolute@1.0.1, inherits@2.0.4, glob-parent@2.0.0, is-glob@2.0.1, is-binary-path@1.0.1, anymatch@1.3.2, readdirp@2.2.1)
└── nunjucks@2.5.2 (asap@2.0.6, yargs@3.32.0, chokidar@1.7.0)
GitBook version: 3.2.3

```

## 3. gitbook 创建

```bash
$ mkdir gitbook-demo
$ cd gitbook-demo

#使用 gitbook init 初始化书籍目录
$ gitbook init 
warn: no summary file in this book 
info: create README.md 
info: create SUMMARY.md 
info: initialization is finished 

$ ls 
README.md  SUMMARY.md
#使用 gitbook build 编译书籍
$ gitbook build
info: 7 plugins are installed 
info: 6 explicitly listed 
info: loading plugin "highlight"... OK 
info: loading plugin "search"... OK 
info: loading plugin "lunr"... OK 
info: loading plugin "sharing"... OK 
info: loading plugin "fontsettings"... OK 
info: loading plugin "theme-default"... OK 
info: found 1 pages 
info: found 0 asset files 
info: >> generation finished with success in 0.4s ! 


$ ls
_book  README.md  SUMMARY.md

$ ls _book/
gitbook  index.html  search_index.json

$ ls _book/gitbook/
fonts  gitbook.js  gitbook-plugin-fontsettings  gitbook-plugin-highlight  gitbook-plugin-lunr  gitbook-plugin-search  gitbook-plugin-sharing  images  style.css  theme.js

#使用 gitbook serve 编译并预览书籍
$ gitbook serve
Live reload server started on port: 35729
Press CTRL+C to quit ...

info: 7 plugins are installed 
info: loading plugin "livereload"... OK 
info: loading plugin "highlight"... OK 
info: loading plugin "search"... OK 
info: loading plugin "lunr"... OK 
info: loading plugin "sharing"... OK 
info: loading plugin "fontsettings"... OK 
info: loading plugin "theme-default"... OK 
info: found 1 pages 
info: found 0 asset files 
info: >> generation finished with success in 0.5s ! 

Starting server ...
Serving book on http://localhost:4000

```
效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/d1f24fa01cac4597b0d0bacfc7595816.png)
图中侧栏`Introduction`的内容正是`README.md`的内容，`SUMMARY.md` 是编写界面侧栏的目录结构。
```bash
$ cat README.md 
# Introduction

$ cat SUMMARY.md 
# Summary

* [Introduction](README.md)
```


