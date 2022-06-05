# 文章名字自动生成 SUMMARY.md


Gitbook 插件：自动生成 `summary.md` 文件内容，如果有很多md文件，这个插件可以帮助你生成初始版本。



```c
$ npm init
This utility will walk you through creating a package.json file.
It only covers the most common items, and tries to guess sensible defaults.

See `npm help init` for definitive documentation on these fields
and exactly what they do.

Use `npm install <pkg>` afterwards to install a package and
save it as a dependency in the package.json file.

Press ^C at any time to quit.
package name: (git-in-action) 
version: (1.0.0) 
description: This is a book about git、github、gitlab and gitbook.
entry point: (index.js) 
test command: 
git repository: 
keywords: 
author: 
license: (ISC) 
About to write to /root/github/git-in-action/package.json:

{
  "name": "git-in-action",
  "version": "1.0.0",
  "description": "This is a book about git、github、gitlab and gitbook.",
  "main": "index.js",
  "dependencies": {
    "gitbook-plugin-summary": "^1.1.0",
    "gitbook-plugin-theme-comscore": "^0.0.3"
  },
  "devDependencies": {},
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}


Is this OK? (yes) yes

```
安装 gitbook-plugin-summary

```c
$ npm install gitbook-plugin-summary
$ npm install -g gitbook-summary
$ book sm
$ cat SUMMARY.md 
# GitBook Handbook

- Git
  * [1 Git Introduce](git/1_git_introduce.md)
  * [2 Git Command](git/2_git_command.md)
  * [3 Git Reset](git/3_git_reset.md)
  * [4 Git Ssh Login Without Secret](git/4_git_ssh_login_without_secret.md)
- Github
  * [1 Github Introduce](github/1_github_introduce.md)
  * [2 Github Local Pull Github](github/2_github_local_pull_github.md)
  * [3 Github Action](github/3_github_action.md)
  * [4 Github Page](github/4_github_page.md)
- Gitlab
  * [1 Gitlab Deploy](gitlab/1_gitlab_deploy.md)
  * [2 Gitlab Runner Deploy](gitlab/2_gitlab_runner_deploy.md)
  * [3 Gitlab Config](gitlab/3_gitlab_config.md)
  * [4 Gitlab Pipline](gitlab/4_gitlab_pipline.md)
  * [5 Gitlab Ci Config](gitlab/5_gitlab_ci_config.md)
* [Information](information.md)

```
> [!NOTE|style:flat|lable:Mylable|iconVisibility:hidden]
> 注意：如果没有命令book，执行: `ln -s /usr/local/node-v10.24.0-linux-x64/bin/book /usr/local/bin/`

