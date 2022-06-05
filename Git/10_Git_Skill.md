# Git 技巧

1、git log -p FILE

查看 README.md 的修改历史，例如：

```bash
> git log -p README.md
```

2、git log -S’PATTERN’

例如，搜索修改符合 stupid 的历史：

```bash
> git log -S'stupid'
```

3、git add -p

交互式的保存和取消保存变化，使用：

```bash
> git add -p
```

4、git rm –cached FILE

这个命令只删除远程文件，例如：

```bash
> git rm --cached database.yml
```

删除 database.yml 被保存的记录，但是不影响本地文件。这对删除已经推送过的忽略文件记录而且不影响本地文件是非常的方便的，点击这里送你12个GIT使用技巧。

5、git log ..BRANCH

这个命令返回某个非 HEAD 分支的提交记录。假如你在一个功能分支，输入：

```bash
> git log ..master
```

返回全部 master 分支的历史记录，包括未被合并到当前分支的提交记录。

6、git branch –merged & git branch –no-merged

Git操作常用的命令都在这里了，点击这里查看。这个命令返回已合并分支列表或未合并的分支列表。这个命令对合并前检查非常有用。例如，在一个功能分支，输入

```bash
> git branch --no-merged
```

返回未合并到该分支的分支列表。

7、git branch –contains SHA

返回包含某个指定 sha 的分支列表。例如：

```bash
> git branch --contains 2f8e2b
```

显示全部包含提交 2f832b 的分支。这个命令对于验证 git cherry-pick 完成非常有帮助。

8、git status -s

返回一个简单版的 git status。我设置这个命令为默认 git status 来减少噪音。

```bash
> git status -s
```

9、git reflog

显示你在本地已完成的操作列表。
```bash
> git reflog
```
10、git shortlog -sn

显示提交记录的参与者列表。和GitHub的参与者列表相同。
```bash
> git shortlog -sn
```
11.查看远程仓库

```bash
git remote -v
```

12.从远程获取最新版本到本地

```bash
git fetch origin master:temp
```

13.比较本地的仓库与远程仓库的区别

```bash
git diff temp
```

14.合并temp分支到master分支

```bash
git merge temp
```

如有冲突则需手动解决冲突的文件（git status 能够告诉咱们冲突的文件），而后提交

```bash
 git add .
 git commit -m 'conflict fixed'
```

15.可删除分支

```bash
git branch -d temp
```
