# Git 如何设置上游分支 upstream？

## 1. 背景
当您想要克隆一个新的存储库或使用各种功能分支时，您需要知道如何使用上游分支以及如何设置它们。本文将告诉您如何设置上游分支，它还会告诉您哪个 git 本地分支正在跟踪哪个上游远程分支。

## 2. 准备
- 在本地计算机上安装并配置 Git。
- 本地存在克隆的 Git 存储库或您自己的 Git 项目

## 3. 什么是 Git 上游分支（upstream）？
当您想从远程存储库（如 GitHub 或 Bitbucket）检出 git 中的分支时，“上游分支”是托管在 Github 或 Bitbucket 上的远程分支。每当您发出基本上没有参数的普通 `git fetch/git pull` 时，它就是您从中获取/拉出的分支。


## 4. 如何在 Git 中设置上游分支
对上游分支使用带有“-u”选项的 Git Push 命令。

## 5. 使用 Git Push 命令设置上游分支
创建一个名为“的新分支并使用`-b`选项切换到当前分支
创建一个名为“的新分支并使用-b选项切换到当前分支

```bash
git checkout -b <分支名称>
```

切换分支确认出现如下：
![](https://img-blog.csdnimg.cn/44f0addd70c344249986a06647a715ca.png)
当当前分支（'new_branch'）没有设置上游分支时，我们尝试运行命令“Git push”。在cmd中运行以下命令后：

![](https://img-blog.csdnimg.cn/7e501d36bee8471fa9089515dd4c5122.png)
现在，您需要使用带有 `-u` 选项的 Git push 命令来设置上游分支。将 `<branch name>` 替换为您的分支名称。

```bash
git push -u origin <分支名>
```

 或者，您也可以使用“`–set-upstream`”命令来设置上游分支

```bash
git push --set-upstream origin <分支名称>
```
![](https://img-blog.csdnimg.cn/eb49e97d4a394129850a53563c207d4f.png)

## 6. 如何在 Git 中更改上游分支
现在，您需要跟踪一个新的上游分支而不是刚刚设置运行的分支：

```bash
git branch -u <远程/分支名称>
```

```bash
git branch main -u <origin/new_branch>
git branch main -u <源/主>
```

终端打印出确认消息：
![](https://img-blog.csdnimg.cn/dd0a8ecc5d8a4f65868e4d8f21a1442a.png)
![](https://img-blog.csdnimg.cn/bd3eb484881942038b88db110919c234.png)
## 7. 如何检查哪些 Git 分支正在跟踪哪些上游分支
现在，您可以使用带有 -vv 选项的“Git 分支”列出所有跟踪上游分支的分支：
![](https://img-blog.csdnimg.cn/45857cda4bac4925839bac58cb293fe8.png)
主分支有一个 `[origin/main]` 的跟踪分支。测试分支有一个跟踪分支`[origin/test]`。`new_branch` 分支有一个跟踪分支`[origin/new_branch]`。


参考：
- [How to Set Upstream Branch on Git?](https://www.geeksforgeeks.org/how-to-set-upstream-branch-on-git/)
