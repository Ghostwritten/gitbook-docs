#  Git 命令


![在这里插入图片描述](https://img-blog.csdnimg.cn/20200221173806711.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3hpeGloYWhhbGVsZWhlaGU=,size_16,color_FFFFFF,t_70)

## 1. git clone:

```bash
$ git clone https://github.com/jquery/jquery.git
```

git clone支持多种协议，除了HTTP(s)以外，还支持SSH、Git、本地文件协议等，下面是一些例子。

```bash
$ git clone http[s]://example.com/path/to/repo.git/
$ git clone ssh://example.com/path/to/repo.git/
$ git clone git://example.com/path/to/repo.git/
$ git clone /opt/git/project.git 
$ git clone file:///opt/git/project.git
$ git clone ftp[s]://example.com/path/to/repo.git/
$ git clone rsync://example.com/path/to/repo.git/
```

克隆版本库的时候，所使用的远程主机自动被Git命名为origin。如果想用其他的主机名，需要用git clone命令的-o选项指定

```bash
git clone -o jQuery https://github.com/jquery/jquery.git

git clone -b 分支名 仓库地址
```

## 2 git remote

git remote show命令加上主机名，可以查看该主机的详细信息。

```bash
$ git remote show <主机名>
```

git remote add命令用于添加远程主机。

```bash
$ git remote add <主机名> <网址>
```

git remote rm命令用于删除远程主机。

```bash
$ git remote rm <主机名>
```

git remote rename命令用于远程主机的改名。

```bash
$ git remote rename <原主机名> <新主机名>
```

## 3. git fetch
一旦远程主机的版本库有了更新（Git术语叫做commit），需要将这些更新取回本地，这时就要用到git fetch命令。
上面命令将某个远程主机的更新，全部取回本地。
git fetch命令通常用来查看其他人的进程，因为它取回的代码对你本地的开发代码没有影响。
默认情况下，git fetch取回所有分支（branch）的更新。如果只想取回特定分支的更新，可以指定分支名。

```bash
$ git fetch <远程主机名> <分支名>
```

比如，取回origin主机的master分支。

```bash
$ git fetch origin master
```

所取回的更新，在本地主机上要用"远程主机名/分支名"的形式读取。比如origin主机的master，就要用origin/master读取。
## 4. git branch

分支（branch）的基本操作：

```bash
git branch //查看本地所有分支 

git branch -r //查看远程所有分支

git branch -a //查看本地和远程的所有分支

git branch <branchname> //新建分支

git branch -d <branchname> //删除本地分支

git branch -d -r <branchname> //删除远程分支，删除后还需推送到服务器
git push origin:<branchname>  //删除后推送至服务器

git branch -m <oldbranch> <newbranch> //重命名本地分支
```

//git中一些选项解释:

```bash
-d  --delete：删除

-D  --delete --force的快捷键

-f  --force：强制

-m  --move：移动或重命名

-M  --move --force的快捷键

-r  --remote：远程

-a  --all：所有
```
上面命令表示，本地主机的当前分支是master，远程分支是origin/master。
取回远程主机的更新以后，可以在它的基础上，使用git checkout命令创建一个新的分支。

```bash
$ git checkout -b newBrach origin/master
```


创建分支命令：

```bash
git branch (branchname)
```

切换分支命令:

```bash
git checkout (branchname)
```

合并分支命令:

```bash
git merge 
```

列出分支基本命令：

```bash
git branch
git checkout -b (branchname) 命令来创建新分支并立即切换到该分支下
```

删除分支命令：

```bash
git branch -d (branchname)

 git branch
* master
  newtest
$ ls
README       test.txt    test2.txt
git merge newtest
ls
README      test.txt
```

将 newtest 分支合并到主分支去，test2.txt 文件被删除


上面命令表示在当前分支上，合并origin/master。
## 5. git pull 与git push
git pull命令的作用是，取回远程主机某个分支的更新，再与本地的指定分支合并。它的完整格式稍稍有点复杂。

```bash
$ git pull <远程主机名> <远程分支名>:<本地分支名>
```

比如，取回origin主机的next分支，与本地的master分支合并，需要写成下面这样。

```bash
$ git pull origin next:master
```

如果远程分支是与当前分支合并，则冒号后面的部分可以省略。

```bash
$ git pull origin next
```

上面命令表示，取回origin/next分支，再与当前分支合并。实质上，这等同于先做git fetch，再做git merge。

```bash
$ git fetch origin
$ git merge origin/next
```

在某些场合，Git会自动在本地分支与远程分支之间，建立一种追踪关系（tracking）。比如，在git clone的时候，所有本地分支默认与远程主机的同名分支，建立追踪关系，也就是说，本地的master分支自动"追踪"origin/master分支。
Git也允许手动建立追踪关系。

```bash
git branch --set-upstream master origin/next
```

上面命令指定master分支追踪origin/ne使用-u选项指定一个默认主机，这样后面就可以不加任何参数使用git push。


```bash
$ git push origin --tags
```

最后，git push不会推送标签（tag），除非使用--tags选项。
上面命令使用--force选项，结果导致远程主机上更新的版本被覆盖。除非你很确定要这样做，否则应该尽量避免使用--force选项。

```bash
$ git push --force origin 
```

如果远程主机的版本比本地版本更新，推送时Git会报错，要求先在本地做git pull合并差异，然后再推送到远程主机。这时，如果你一定要推送，可以使用--force选项。
上面命令表示，将所有本地分支都推送到origin主机。

```bash
$ git push --all origin
```

还有一种情况，就是不管是否存在对应的远程分支，将本地的所有分支都推送到远程主机，这时需要使用--all选项。

```bash
$ git config --global push.default matching
# 或者
$ git config --global push.default simple
```

不带任何参数的git push，默认只推送当前分支，这叫做simple方式。此外，还有一种matching方式，会推送所有有对应的远程分支的本地分支。Git 2.0版本之前，默认采用matching方法，现在改为默认采用simple方式。如果要修改这个设置，可以采用git config命令。
上面命令将本地的master分支推送到origin主机，同时指定origin为默认主机，后面就可以不加任何参数使用git push了。

```bash
$ git push -u origin master
$ git push
```

如果当前分支只有一个追踪分支，那么主机名都可以省略。
上面命令表示，将当前分支推送到origin主机的对应分支。

```bash
$ git push originxt
```

如果当前分支与远程分支存在追踪关系，git pull就可以省略远程分支名。

```bash
$ git pull origin
```

如果当前分支与多个主机存在追踪关系，则可以

如果当前分支与远程分支之间存在追踪关系，则本地分支和远程分支都可以省略。
上面命令表示删除origin主机的master分支。

```bash
$ git push origin :master
# 等同于
$ git push origin --delete master
```

如果省略本地分支名，则表示删除指定的远程分支，因为这等同于推送一个空的本地分支到远程分支。
上面命令表示，将本地的master分支推送到origin主机的master分支。如果后者不存在，则会被新建。

```bash
$ git push origin master
```

如果省略远程分支名，则表示将本地分支推送与之存在"追踪关系"的远程分支（通常两者同名），如果该远程分支不存在，则会被新建。
注意，分支推送顺序的写法是<来源地>:<目的地>，所以git pull是<远程分支>:<本地分支>，而git push是<本地分支>:<远程分支>。

```bash
$ git push <远程主机名> <本地分支名>:<远程分支名>
```

git push命令用于将本地分支的更新，推送到远程主机。它的格式与git pull命令相仿。

```bash
$ git pull -p
# 等同于下面的命令
$ git fetch --prune origin 
$ git fetch -p
```

但是，你可以改变这个行为，加上参数 -p 就会在本地删除远程已经删除的分支。

```bash
$ git pull --rebase <远程主机名> <远程分支名>:<本地分支名>
```

如果合并需要采用rebase模式，可以使用--rebase选项。
上面命令表示，当前分支自动与唯一一个追踪分支进行合并。

```bash
$ git pull
```

如果当前分支只有一个追踪分支，连远程主机名都可以省略。
上面命令表示，本地的当前分支自动与对应的origin主机"追踪分支"（remote-tracking branch）进行合并。

```bash
$ git pull origin
```

如果当前分支与多个主机存在追踪关系，则可以使用-u选项指定一个默认主机，这样后面就可以不加任何参数使用git push。

## 6. git rev-parse
准备工作
在工作区中建立目录 a/b/c ，进入该目录中。

```bash
cd /path/to/my/workspace/demo/
mkdir -p a/b/c
cd /path/to/my/workspace/demo/a/b/c
```

显示版本库 .git 目录所在的位置。

```bash
$ git rev-parse --git-dir
/path/to/my/workspace/demo/.git
```

显示工作区根目录。

```bash
$ git rev-parse --show-toplevel
/path/to/my/workspace/demo
```

显示相对于工作区根目录的相对目录。

```bash
$ git rev-parse --show-prefix
a/b/c
```

显示从当前目录（cd）后退（up）到工作区的根的深度。

```bash
$ git rev-parse --show-cdup
../../..
```
`git rev-parse HEAD` 获取当前最后一个的 `commit hash`

```bash
$ [master] git rev-parse HEAD
51834cc95f15c81b1d8c6afc2625e50a81aadb23
```
面命令中的HEAD可以替换成branch name，如`git rev-parse dev`获取dev分支的最后一次提交

`git rev-parse --abbrev-ref` HEAD获取当前分支名

```bash
$ [master] git rev-parse --abbrev-ref HEAD
master
```
上面命令都说是获取当前的XX，也就是说你运行命令时所在的 git 目录，如果在任何目录运行可以获取当前的XX，需要明确指出`.git`目录的位置以及git对应的工作目录。

```bash
$ git --git-dir='./maleskine/.git' rev-parse --abbrev-ref HEAD
master
```
通过设置`--git-dir`选项，也可以正确的获取到`maleskine`项目当前的分支名。git还有一个选项`--work-tree`可以指定git的工作目录。

## 7. git reset 

```bash
git reset --hard logid(logid的前几位即可)  --将版本库还原到历史的某个时刻的状态
git reset --hard HEAD^ --将版本库还原到上一次commit之前的状态


#有时候，进行了错误的提交，但是还没有push到远程分支，想要撤销本次提交，可以使用git reset –-soft/hard命令。
git reset –-soft：回退到某个版本，只回退了commit的信息，代码修改过的没变。如果还要提交，直接commit即可；
git reset -–hard：彻底回退到某个版本，本地的源码也会变为上一个版本的内容，撤销的commit中所包含的更改被冲掉，即commit与修改过代码都撤销，变为原来的某个版本；

```


## 8. git config

```bash
git config --global user.name 'username' --添加版本库的用户名到本地配置文件
git config --global user.emal 'emal' --添加版本库的用户邮箱到本地配置文件
```

## 9. git diff
执行 git diff 来查看执行 git status 的结果的详细信息。
git diff 命令显示已写入缓存与已修改但尚未写入缓存的改动的区别
尚未缓存的改动：

```bash
git diff
```

查看已缓存的改动：

```bash
 git diff --cached
```

查看已缓存的与未缓存的所有改动：

```bash
git diff HEAD
```

显示摘要而非整个 diff：

```bash
git diff --stat
```
实例;	
```bash
git status -s
git diff
git add hello.php
git status -s
git diff --cached
```
##  10. git commit 

```bash
git commit -m 'test comment from w3cschool.cn'
git add 提交缓存的流程太过繁琐，Git 也允许你用 -a 选项跳过这一步
git commit -am 'changes to hello file'

git commit --signoff -m 'xxx'    // 表示提交的信息中带有署名信息;
git commit --amend 'xxx'   // 表示对上一次提交的信息,进行修改提交;
```
## 11 git rm

```bash
git rm 将文件从缓存区中移除
git rm hello.php 
git rm file 会将文件从缓存区和你的硬盘中（工作目录）删除。 如果要在工作目录中留着该文件
git rm --cached
```
## 12 git log

```bash
git log 查看提交历史
git log --oneline            --oneline 选项来查看历史记录的简洁的版本
git log --oneline --graph    -graph 选项，查看历史中什么时候出现了分支、合并。
git log --reverse --oneline  '--reverse'参数来逆向显示所有日志
git log --author=Linus --oneline -5   --author , 例如，比方说我们要找 Git 源码中 Linus 提交的部分
git log --oneline --before={3.weeks.ago} --after={2010-04-18} --no-merges
```
## 13 git tag

```bash
git tag  #查看所有标签
```
-a 选项意为"创建一个带注解的标签"。 不用 -a 选项也可以执行的，但它不会记录这标签是啥时候打的，谁打的，也不会让你添加个标签的注解

```bash
git tag -a v1.0
git log --oneline --decorate --graph     --decorate 时，我们可以看到我们的标签
```
追加标签

```bash
git tag -a v0.9 85fc7e7
git log --oneline --decorate --graph
```

指定标签信息命令：

```bash
git tag -a <tagname> -m "w3cschool.cn标签"
```
PGP签名标签命令：

```bash
git tag -s <tagname> -m "w3cschool.cn标签"
```


