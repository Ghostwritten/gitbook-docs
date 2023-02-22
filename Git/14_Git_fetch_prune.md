# Git remote prune、Git prune 和 Git fetch –prune 的区别


## 1. 背景
Git 的一大优点是它*在删除数据时非常小心*。这使得 Git 中的提交或其他有价值的数据很难丢失！这样做的一个小缺点是您有时可能 会看到实际上不再需要的陈旧数据。最好的例子之一是对已删除的远程分支的引用：假设您的一位队友删除了共享远程存储库中的一个分支；该分支仍会为您显示，除非您明确指示 Git 进行清理。


## 2. 方法
在远程存储库上使用“prune”：
“prune”可作为 `git fetch` 和 `git remote` 命令的选项使用。（`git prune` 命令——在垃圾收集期间使用。）。使用 prune 的最简 单方法是在获取时将其作为选项提供：

```bash
git fetch --prune origin
```
如果您只想`*`执行prune而不`*`获取远程数据，您可以将它与 `git remote` 一起使用：

```bash
git remote prune origin
```
两种情况下的结果是相同的：对指定远程存储库中不再存在的远程分支的陈旧引用将被删除。顺便说一句：你永远不必担心你当地的分支机构，因为修剪永远不会影响那些。

克隆同一个 repo 两次，以便您正确理解 `git prune` 的工作原理。

```bash
git clone repolink
```
![](https://img-blog.csdnimg.cn/69207dae53ea4315b5c30dce420b52bf.png)
- 在一个回购上创建一个分支并在其副本上获取它
- 从一个回购中删除该分支
- 当您在另一个仓库中列出分支时，它不会得到更新。

```bash
git branch
git push origin HEAD
git branch -r
```
![](https://img-blog.csdnimg.cn/3f336eb1ebb446f88d13cb18a8294edb.png)
使用 `git fetch –prune`：

如果我们使用 prune 命令删除，该分支将在 2nd repo 中自动更新

```bash
git fetch --prune
```
![](https://img-blog.csdnimg.cn/7b5af25b6f1f42c09a6f74e0bd6b1c69.png)
假设在某些情况下您希望`*`只*执行prune并且不获取远程数据

```bash
git remote prune origin
```
如果你想自动prune自己

```bash
git config —global fetch.prune true
```

参考：
- [Difference Between Git remote prune, Git prune and Git fetch –prune](https://www.geeksforgeeks.org/difference-between-git-remote-prune-git-prune-and-git-fetch-prune/?ref=rp)

