# Gitbook 持续更新 Github Pages


## 1. 新增 md

```bash
$ ls
_book  gitbook  index.html  README.md  search_index.json  SUMMARY.md
$ ls _book/
gitbook  index.html  search_index.json

新增Gihub目录，以及文章
$ ls
_book  gitbook  Github  index.html  README.md  search_index.json  SUMMARY.md

$ ls Github/
1_github_introduce.md  2_github_local_pull_github.md  3_github_action.md  4_github_page.md 
```


## 2. 定制 book.json
或许偶尔你会手动更新book.json,比如：新增插件、分享链接等等。
```bash
$ cat book.json 
{
    "author": "zongxun <me@ghostwritten>",
    "description": "This is a sample book created by gitbook",
    "extension": null,
    "generator": "site",
    "links": {
        "sharing": {
            "all": null,
            "facebook": null,
            "google": null,
            "twitter": null,
            "weibo": null
        },
        "sidebar": {
            "zongxun's Blog": "https://smoothies.com.cn"
        }
    },
    "output": null,
    "pdf": {
        "fontSize": 12,
        "footerTemplate": null,
        "headerTemplate": null,
        "margin": {
            "bottom": 36,
            "left": 62,
            "right": 62,
            "top": 36
        },
        "pageNumbers": false,
        "paperSize": "a4"
    },
    "plugins": [],
    "title": "Git Handbook",
    "variables": {}
}

$ ls
_book  book.json  gitbook  Github  index.html  README.md  search_index.json  SUMMARY.md
```

更多细节请参考[pages定制](https://www.notion.so/gitbook-book-json-4f76e78c59df41ed8d20e3a2cc3ee602)


## 3. 脚本发布
新建 `Person Access Token`
![在这里插入图片描述](https://img-blog.csdnimg.cn/29f21037bfc44e37b55b3ef6e4d76ee7.png)
复制token
```bash
#!/bin/bash

# author: ghostwritten
# date:   01/06 2022
# description: deploy Github Pages

# ##############################################################################
set -o nounset

FILE_NAME="update.sh"
FILE_VERSION="v1.0"
BASE_DIR="$( dirname "$( readlink -f "${0}" )" )"


if [ $# != 1 ] ; then
  echo "USAGE: $0 something "
  echo " e.g.: $0 update github pages"
  exit 1;
fi

update=$1
#token=$2


user='Ghostwritten'
email='1zoxun1@gmail.com'
repo="github.com/${user}/gitbook-docs.git"

book sm
python3 gitbook-auto-summary.py  .

dirs=`grep -E '\- ' SUMMARY-GitBook-auto-summary.md  | awk '{print $2}'`

for dir in $dirs
do
  dir_README=`grep -E "\[${dir}\]" SUMMARY.md | sed 's/^[ \t]*//g'`
  dir_README=${dir_README//\//\\\/}
  dir_README=${dir_README//\[/\\[}
  dir_README=${dir_README//\]/\\]}
  dir_README=${dir_README//\(/\\\(}
  dir_README=${dir_README//\)/\\\)}
  dir_README=${dir_README//\-/\\\-}
  sed -r -i "s#\\- ${dir}\$#$dir_README#g" SUMMARY-GitBook-auto-summary.md
done

cp -r SUMMARY-GitBook-auto-summary.md SUMMARY.md

gitbook build 

git remote add origin https://${repo}
git add .
git commit -m "${update}"
git push origin master

cd _book
git init
git remote add origin https://${repo}
git add . 
git commit -m "${update} For Github Pages"
git branch -M master
git push --force --quiet "https://${TOKEN}@${repo}" master:gh-pages
```
执行：

```bash
$ bash deploy.sh "update <something>"
```
