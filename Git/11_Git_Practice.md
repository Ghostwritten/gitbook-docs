# git 实践



## 1. 提交文件

### 1.1 Git 初始化

```bash
$ git init
Initialized empty Git repository in /home/scrapbook/tutorial/.git/
$ pwd
/home/scrapbook/tutorial
```

初始化存储库后，会创建一个名为`.git`的新隐藏子目录。该子目录包含 Git 用于存储其信息的元数据。

### 1.2 Git 状态

当目录是存储库的一部分时，它被称为工作目录。工作目录包含从存储库下载的最新版本以及尚未提交的任何更改。在您处理项目时，所有更改都在此工作目录中进行。

您可以使用命令查看哪些文件在您的工作目录和之前提交到存储库的文件之间发生了变化

```bash
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        hello-world.js

nothing added to commit but untracked files present (use "git add" to track)
```

###  1.3 Git 添加

要将文件保存或提交到 Git 存储库中，您首先需要将它们添加到暂存区。Git 有三个区域，一**个工作目录，一个暂存区和存储库本身**。在将更改提交到存储库之前，用户将更改从工作目录移动到暂存区，也称为提升。

Git 的关键方法之一是提交集中、小而频繁。暂存区允许您一次仅提升某些文件而不是工作目录中的所有更改，从而有助于维护此工作流程。
使用该命令`git add <file|directory>`将`hello-world.js`添加到暂存区。

如果您在将文件添加到暂存区后进行其他更改，则在您再次添加文件之前不会反映更改。

###  1.4 Git 提交

将文件添加到暂存区后，需要将其提交到存储库。该命令`git commit -m "commit message"`将文件从暂存区移动到存储库并记录时间/日期、作者和提交消息，这些消息可用于为更改添加额外的上下文和推理，例如错误报告编号。

只会提交添加到暂存区的更改，不会包含工作目录中尚未暂存的任何文件。
每个提交都分配了一个 `SHA-1` 哈希值，它使您能够在其他命令中引用回提交。

###  1.5 Git 忽略

有时，您永远不想提交特定的文件或目录，例如本地开发配置。要忽略这些文件，请在存储库的根目录中创建一个`.gitignore`文件。

该的`.gitignore`文件允许你定义通配符您希望忽略，例如*的`.tmp`将忽略与扩展名为.tmp的所有文件的文件。

任何与定义的通配符匹配的文件都不会显示在`git status`输出中，并在尝试`git add`命令时被忽略。

```bash
$ echo '*.tmp' > .gitignore
$ git add .gitignore
$ git commit -m "gitignore file"
[master (root-commit) 69e1e5a] gitignore file
 1 file changed, 1 insertion(+)
 create mode 100644 .gitignore
```

##  2. 提交更改

###  2.1 git status

当前状态，我们的工作目录中已对先前提交的文件 `commit.js` 进行了更改，但尚未移动到暂存区。

```bash
$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   committed.js

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        untracked.js

no changes added to commit (use "git add" and/or "git commit -a")
```

###  2.2 git diff

该命令`git diff`使您能够将工作目录中的更改与先前提交的版本进行比较。默认情况下，该命令会比较工作目录和`HEAD`提交。

如果您希望与旧版本进行比较，请提供提交哈希作为参数，例如`git diff <commit>`. 与提交进行比较将输出所有已修改文件的更改。如果要将更改与单个文件进行比较，请提供名称作为参数，例如`git diff committed.js.`

```bash
$ git diff committed.js .
ESC[1mdiff --git a/committed.js b/committed.jsESC[m
ESC[1mindex 12e7e7c..fc77969 100644ESC[m
ESC[1m--- a/committed.jsESC[m
ESC[1m+++ b/committed.jsESC[m
ESC[36m@@ -1 +1 @@ESC[m
ESC[31m-console.log("Committed File")ESC[m
ESC[32m+ESC[mESC[32mconsole.log("Demostrating changing a committed file")
```

默认情况下，输出采用组合差异格式。该命令`git difftool`将加载您选择的外部工具以查看差异
![在这里插入图片描述](https://img-blog.csdnimg.cn/d2865b5c2558486d8993b6139fe13982.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)


###  2.3 git add

与之前的场景一样，为了提交更改，必须首先使用`git add`命令进行暂存。

```bash
$ git add committed.js
```

如果您重命名或删除文件，则需要在添加命令中指定这些文件以进行跟踪。替代品可以使用`git mv`，并`git rm`为混帐要执行的操作，包括更新的临时区域。

###  2.4 git diff --staged

一旦更改进入暂存区，它们将不会显示在`git diff`. 默认情况下，`git diff`将只比较工作目录而不是暂存区。

要将暂存区中的更改与之前的提交进行比较，请提供 staged 参数`git diff --staged`。这使您能够确保正确地暂存所有更改。

```bash
$ git diff --staged
ESC[1mdiff --git a/committed.js b/committed.jsESC[m
ESC[1mindex 12e7e7c..fc77969 100644ESC[m
ESC[1m--- a/committed.jsESC[m
ESC[1m+++ b/committed.jsESC[m
ESC[36m@@ -1 +1 @@ESC[m
ESC[31m-console.log("Committed File")ESC[m
ESC[32m+ESC[mESC[32mconsole.log("Demostrating changing a committed file")
```

###   2.5 git log

```bash
$ git log
ESC[33mcommit ddc05ab990a12a81b59a1ca11d68dda2835707e8ESC[mESC[33m (ESC[m
Author: Katacoda Scenario <scenario@katacoda.com>
Date:   Thu Nov 4 09:14:41 2021 +0000

    Changed the output message in committed.js

ESC[33mcommit cfb187d6ebaa88ea358df23c00ff49f6ac8ca7d2ESC[m
Author: Katacoda Scenario <scenario@katacoda.com>
Date:   Thu Nov 4 08:57:27 2021 +0000

    Initial Commit
```

日志输出的格式非常灵活。例如，要在一行上输出每个提交，命令是

```bash
$ git log --pretty=format:"%h %an %ar - %s"
ddc05ab Katacoda Scenario 3 minutes ago - Changed the output message in com
cfb187d Katacoda Scenario 20 minutes ago - Initial Commit
```

可以在使用访问的 `git log` 手册页中找到更多详细信息`git log --help`

###  2.6 git show

虽然 git log 会告诉您提交作者和消息，但要查看提交中所做的更改，您需要使用该命令

```bash
$ git show
ESC[33mcommit ddc05ab990a12a81b59a1ca11d68dda2835707e8ESC[mESC[33m (ESC[m
Author: Katacoda Scenario <scenario@katacoda.com>
Date:   Thu Nov 4 09:14:41 2021 +0000

    Changed the output message in committed.js

ESC[1mdiff --git a/committed.js b/committed.jsESC[m
ESC[1mindex 12e7e7c..fc77969 100644ESC[m
ESC[1m--- a/committed.jsESC[m
ESC[1m+++ b/committed.jsESC[m
ESC[36m@@ -1 +1 @@ESC[m
ESC[31m-console.log("Committed File")ESC[m
ESC[32m+ESC[mESC[32mconsole.log("Demostrating changing a committed file")
(END)
```

与其他命令一样，默认情况下它将显示 HEAD 提交中的更改。使用`git show <commit-hash>`查看旧的改变。

##  3. 远程工作

###  3.1 git remote

远程存储库允许您共享来自或到您的存储库的更改。远程位置通常是构建服务器、团队成员机器或集中存储，例如 Github.com。使用git remote带有友好名称和远程位置的命令添加远程，通常是 HTTPS URL 或 SSH 连接，例如https://github.com/OcelotUproar/ocelite.git或git@github.com :/OcelotUproar/ocelite。吉特。

友好名称允许您引用其他命令中的位置。您的本地存储库可以根据您的场景引用多个不同的远程存储库。

此环境具有`/s/remote-project/1`的远程存储库位置。使用`git remote`，添加这个名为origin 的远程位置。

```c
$ git remote add origin /s/remote-project/1
```

### 3.2 git push

当你准备好分享你提交你需要推动他们通过远程仓库git push。典型的 Git 工作流程是在您完成任务并在相关点（例如任务完成时）推送到远程时执行多个小提交，以确保团队内的代码同步。

该git push命令后跟两个参数。第一个参数是我们在第一步中定义的远程存储库的友好名称。第二个参数是分支的名称。默认情况下，所有 git 存储库都有一个主分支，用于处理代码。

```bash
$ git push origin master
Counting objects: 3, done.
Writing objects: 100% (3/3), 228 bytes | 228.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To /s/remote-project/1
 * [new branch]      master -> master
```

将 `master` 分支中的提交推送到 `origin` 远程。

###  3.3 git pull

git push允许您将更改推送到远程存储库，git pull以相反的方式工作。`git pull`允许您将远程存储库中的更改同步到本地版本。

```bash
$ git pull origin master
remote: Counting objects: 4, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 4 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (4/4), done.
From /s/remote-project/1
 * branch            master     -> FETCH_HEAD
   6292b4d..5bd531a  master     -> origin/master
Updating 6292b4d..5bd531a
Fast-forward
 new-file.txt | 1 +
 staging.txt  | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 new-file.txt
```

### 3.4 git log

如前一场景所述，您可以使用该`git log`命令查看存储库的历史记录。该`git show`命令将允许您查看在每次提交中所做的更改。

```bash
$ git log
ESC[33mcommit 5bd531a9ec87f1fb7b209548f520259c9ab3f93aESC[mESC[33m (ESC[m
Author: Different User <DifferentUser@JoinScrapbook.com>
Date:   Thu Nov 4 09:36:48 2021 +0000

    Fix for Bug #1234

ESC[33mcommit 6292b4dc07b6f83180b671d867938288e11a23c5ESC[m
Author: Katacoda Scenario <scenario@katacoda.com>
Date:   Thu Nov 4 09:21:22 2021 +0000

    Message



$ git show
ESC[33mcommit 5bd531a9ec87f1fb7b209548f520259c9ab3f93aESC[mESC[33m (ESC[m
Author: Different User <DifferentUser@JoinScrapbook.com>
Date:   Thu Nov 4 09:36:48 2021 +0000

    Fix for Bug #1234

ESC[1mdiff --git a/new-file.txt b/new-file.txtESC[m
ESC[1mnew file mode 100644ESC[m
ESC[1mindex 0000000..96716fbESC[m
ESC[1m--- /dev/nullESC[m
ESC[1m+++ b/new-file.txtESC[m
ESC[36m@@ -0,0 +1 @@ESC[m
ESC[32m+ESC[mESC[32mNewESC[m
ESC[1mdiff --git a/staging.txt b/staging.txtESC[m
ESC[1mindex c4eb839..b0f03f3 100644ESC[m
ESC[1m--- a/staging.txtESC[m
ESC[1m+++ b/staging.txtESC[m
ESC[36m@@ -1 +1,2 @@ESC[m
 Staging AreaESC[m
ESC[32m+ESC[mESC[32mSomething ChangedESC[m
```

在此示例中，输出git log显示了“ DifferentUser@JoinScrapbook.com ”的新提交，并带有消息“修复错误 #1234”。的输出git show以绿色突出显示添加到文件中的新行。

```bash
$ git log --grep="#1234"
ESC[33mcommit 5bd531a9ec87f1fb7b209548f520259c9ab3f93aESC[mESC[33m (ESC[m
Author: Different User <DifferentUser@JoinScrapbook.com>
Date:   Thu Nov 4 09:36:48 2021 +0000

    Fix for Bug #1234
```

###  3.5 git pull

该命令`git pull`是两个不同命令的组合，`git fetch`并且`git merge. Fetch` 将更改从远程存储库下载到名为`remotes/<remote-name>/<remote-branch-name>`的单独分支中。可以使用 访问该分支`git checkout`。

使用`git fetch`是一种在不影响当前分支的情况下查看更改的好方法。分支的命名格式足够灵活，您可以拥有多个同名的远程和分支，并在它们之间轻松切换。

以下命令会将获取的更改合并到 master 中。

```bash
git merge remotes/<remote-name>/<remote-branch-name> master
```

在原始存储库中进行了其他更改。使用`git fetch`下载的更改，然后签出的分支进行查看。您可以使用命令查看所有远程分支的列表 `git branch -r`

```bash
$ git fetch
remote: Counting objects: 2, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 2 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (2/2), done.
From /s/remote-project/1
   5bd531a..7697d4c  master     -> origin/master


$ git checkout remotes/origin/master
Note: checking out 'remotes/origin/master'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at 7697d4c Fix for Bug #42
```

## 4. 撤消更改

###  4.1 git Checkout

使用 Git 时，一个常见的场景是撤消工作目录中的更改。该命令`git checkout`会将工作目录中的所有内容替换为上次提交的版本。

如果要替换所有文件，请使用点 ( . ) 表示当前目录，否则使用空格分隔的目录/文件列表。

使用`git checkout`清除工作目录中的任何改变

```bash
$ git checkout .
```

### 4.2 git reset

如果您正在提交并已将文件添加到暂存区，但后来改变了主意，那么您将需要使用该`git reset`命令。`git reset`将文件从暂存区移回工作目录。如果要重置所有文件，请使用. 表示当前目录，否则列出以空格分隔的文件。这在尝试保持提交小而集中时非常有用，因为如果您添加了太多文件，您可以将文件移回暂存区。

使用以下命令将更改从暂存移回工作目录 `git reset`

```bash
$ git reset HEAD .
Unstaged changes after reset:
M       staging.txt
```

###  4.3 git reset hard

`git reset --hard`将在一个命令中结合 `git reset` 和 `git checkout` 。结果将从暂存区中删除文件，并将工作目录恢复到上次提交的状态。
使用以下命令从暂存区和工作目录中删除更改 `git reset`

```bash
git reset --hard HEAD
```

使用HEAD将清除状态回到上次提交，使用`git reset --hard <commit-hash>`允许您返回到任何提交状态。请记住， `HEAD` 是分支的最后一个提交哈希的别名。

###  4.5 git revert

如果您已经提交了文件但意识到自己犯了一个错误，那么该命令
`git revert`允许您撤消提交。该命令将创建一个新的提交，该提交与被还原的提交具有相反的影响。

如果您尚未推送更改，则`git reset HEAD~1`具有相同的影响，并将删除最后一次提交。

使用`git revert`恢复在最后的更改提交。

注意，这将打开一个 Vim 编辑器会话，为每个提交创建一个提交消息。要保存提交消息并退出 vim，请为每个 Vim 会话键入命令`:wq`。

```bash
$ git revert HEAD --no-edit
[master 18d0da7] Revert "Commit To Revert"
 Date: Thu Nov 4 11:17:26 2021 +0000
 1 file changed, 1 insertion(+), 1 deletion(-)
```

创建新提交背后的动机是在 Git 中重写历史是一种反模式。如果你已经推送了你的提交，那么你应该创建新的提交来撤消更改，因为在此期间其他人可能已经提交了。

要一次还原多个提交，我们使用字符`~`表示减号。例如， `HEAD~2` 是来自头部的两次提交。这可以与字符组合在一起......在两次提交之间说。

使用该命令`git revert HEAD...HEAD~2`恢复 HEAD 和 `HEAD~2` 之间的提交。

```bash
$ git revert HEAD...HEAD~2 --no-edit
[master 7b75286] Revert "Revert "Commit To Revert""
 Date: Thu Nov 4 11:21:30 2021 +0000
 1 file changed, 1 insertion(+), 1 deletion(-)
[master 0aea2ad] Revert "Commit To Revert"
 Date: Thu Nov 4 11:21:30 2021 +0000
 1 file changed, 1 insertion(+), 1 deletion(-)
```

您可以使用该命令`git log --oneline`快速概览提交历史。

```bash
$ git log --oneline
ESC[33m0aea2adESC[mESC[33m (ESC[mESC[1;36mHEAD -> ESC[mESC[1;32mmasterESC[mESC[33m)ESC[m Revert "Commit To Revert"
ESC[33m7b75286ESC[m Revert "Revert "Commit To Revert""
ESC[33m18d0da7ESC[m Revert "Commit To Revert"
ESC[33m9a606a6ESC[m Commit To Revert
ESC[33m37ac4b8ESC[m New File
ESC[33me263619ESC[m Fixing Error
ESC[33md64dc98ESC[m First Commit
```

##  5. 修复合并冲突

###  5.1 git merge（合并）

该`git fetch`命令将更改下载到可以检出和合并的单独分支中。在合并期间，Git 将尝试自动合并提交。

当不存在冲突时，合并将“快进”，您无需执行任何操作。如果确实存在冲突，那么您将检索错误并且存储库将处于合并状态。

在您的环境中，已从远程存储库获取更改。
您现在需要合并来自 `origin/master` 的更改。

```bash
$ git merge remotes/origin/master
fatal: refusing to merge unrelated histories
```

这将导致合并冲突。冲突表明合并失败，因为两个存储库都添加了该文件。我们将在接下来的步骤中解决此问题。

通过保持提交小而集中，您可以减少合并冲突的可能性。

该命令`git pull`是一个组合fetch和merge。

###  5.2 Viewing Conflict （查看冲突）

当发生冲突时，来自本地和远程的更改将以 unix diff 格式出现在同一个文件中。这与`git diff`使用的格式相同。

要读取格式，本地更改将出现在<<<<<<< HEAD和========之间的顶部，而远程更改将出现在=======和>>>>>之间>> 遥控器/原点/主。

为了解决冲突，需要编辑文件以匹配我们想要的最终状态。我们将在下一步中演示这一点。

Git 支持不同的命令行和可视化合并工具，可以更轻松地解决冲突。该命令`git mergetool`将启动一个外部工具

### 5.3 resolving conflict（解决冲突）

解决冲突的最简单方法是使用`git checkout --ours staging.txt`或选择本地或远程版本`git checkout --theirs staging.txt`。如果您需要更多控制，那么您可以像平常一样手动编辑文件。

一旦文件处于所需状态，无论是手动还是使用 `git checkout`，您都需要暂存并提交更改。提交时，将创建默认提交消息，其中包含合并的详细信息和冲突的文件。

通过选择远程更改并使用`git add`后跟完成合并来解决冲突`git commit`。

如果您想在合并过程中恢复并重试，请使用该命令`git reset --hard HEAD`;返回到之前的状态。

使用`git commit --no-edit`时要使用的默认提交信息。

```bash
$ git checkout --theirs staging.txt
$ git add staging.txt
$ git commit --no-edit
On branch master
nothing to commit, working tree clean
```

###  5.4 非快进

为了模拟非快进合并，发生了以下情况。

1) 开发人员 A 从开发人员 B 拉取最新更改。
2) 开发人员 B 将更改提交到其本地存储库。
3) 开发人员 A 向其本地存储库提交无冲突的更改。
4) 开发人员 A 从开发人员 B 那里提取最新的更改。

在这种情况下，Git 无法快进来自开发人员 B 的更改，因为开发人员 A 进行了许多更改。

发生这种情况时，Git 将尝试自动合并更改。如果不存在冲突，则合并将完成，并且将创建一个新的提交以指示在该时间点发生的合并。

合并的默认提交消息是“合并分支”' 的 "。这些提交可用于指示存储库之间的同步点，但也会产生嘈杂的提交日志。在下一步中，我们将研究替代方法。

从远程存储库中提取更改并使用以下命令使用默认提交消息。

```bash
$ git pull --no-edit origin master
remote: Counting objects: 4, done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 4 (delta 1), reused 0 (delta 0)
Unpacking objects: 100% (4/4), done.
From /s/remote-project/1
 * branch            master     -> FETCH_HEAD
   d0ab773..654bdfd  master     -> origin/master
fatal: refusing to merge unrelated histories


$ git log --all --decorate --oneline
ESC[33ma7312c0ESC[mESC[33m (ESC[mESC[1;36mHEAD -> ESC[mESC[1;32mmasterESC[mESC[33m)ESC[m Fix for Bug #55
ESC[33m654bdfdESC[mESC[33m (ESC[mESC[1;31morigin/masterESC[mESC[33m)ESC[m Fix for Bug #58a
ESC[33m3074197ESC[m Fix for Bug #58
ESC[33mdce3e2aESC[m Fixing Error
ESC[33md0ab773ESC[m Fix for Bug #1234
ESC[33mf7126daESC[m First Commit
```

###  5.5 git rebase

合并提交消息可用于指示同步点，但它们也会产生大量垃圾信息。例如，如果您正在针对本地分支工作并且尚未推送，那么对于查看存储库的其他开发人员而言，这些附加信息毫无意义且令人困惑。

要解决此问题，您可以使用`git rebase`代替`git merge`. 变基将取消您所做的更改并重播分支中的更改，应用您的更改，就好像它们都发生在同一个分支上一样。结果是合并的干净历史记录和图表。

重要由于rebase将重播更改而不是合并，每个提交将有一个新的哈希 id。如果您或其他开发人员推/拉了存储库，则更改历史记录可能会导致 git 丢失提交。因此，您不应该对已公开的提交进行 `rebase`，例如推送提交，然后 rebase 来自不同分支的旧提交。结果将是具有不同哈希 ID 的先前公开提交

### 5.6 Rebasing Pull Requests

这种方法在使用远程分支时也适用，并且可以在使用以下方式发出拉取请求时应用：

```bash
git pull --rebase
```

这就像您在每次提交之前完成了拉取请求一样。

##  使用分支

## 6.1 git branch

branch分支是基于另一个分支创建的，通常是 master。该命令`git branch <new branch name> <starting branch>`采用现有分支并创建一个单独的分支来工作。此时两个分支是相同的。

要切换到分支，请使用该`git checkout <new branch name>`命令。

```bash
$ git branch new_branch master
$ git checkout new_branch
Switched to branch 'new_branch'
```

### 6.2 List Branches

```bash
$ git branch
  masterESC[m
* ESC[32mnew_branchESC[m
```

附加参数-a将包括远程分支，而包括-v将包括分支的 HEAD 提交消息

```bash
$ git branch -va
  master    ESC[m b54bcf8 First Commit on master
* ESC[32mnew_branchESC[m a6eb09c Commit on branch
```

###  6.3 Merge To Master（合并到master）

已提交到新分支。要将其合并到`master` 中，您首先需要检出目标分支，在本例中为 master，然后使用 '`git merge`' 命令合并来自分支的提交。

```bash
$ git checkout master
Switched to branch 'master'
$ git merge new_branch
Updating b54bcf8..8eb1a99
Fast-forward
 new-file-6.txt | 1 +
 staging.txt    | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 new-file-6.txt
```

### 6.4 Push Branches（推送分支）

如果你想将一个分支推送到远程，那么使用命令
 `git push <remote_name> <branch_name>`

###  6.5 Clean Up Branches

清理分支对于消除噪音和混乱很重要。要删除您需要提供参数的一个分支-d，例如`git branch -d <branch_name>`

##  7. 查找bug

###  7.1 git diff two Commits

该`git diff`命令是比较提交之间更改的最简单的命令。它将输出两次提交之间的差异。
您可以通过提供两次提交的哈希 ID 或指针（blob）来直观地进行任何两次提交

```bash
$ git diff HEAD~2 HEAD
ESC[1mdiff --git a/list.html b/list.htmlESC[m
ESC[1mindex 96e99d0..9f53aec 100644ESC[m
ESC[1m--- a/list.htmlESC[m
ESC[1m+++ b/list.htmlESC[m
ESC[36m@@ -2,4 +2,6 @@ESC[m
 <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>ESC[m
 <li>Aliquam tincidunt mauris eu risus.</li>ESC[m
 <li>Vestibulum auctor dapibus neque.</li>ESC[m
ESC[32m+ESC[mESC[32m<li>Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a.</li>ESC[m
ESC[32m+ESC[mESC[32m<li>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat
 </ul>ESC[m
```

###  7.2 git log

虽然git log可以帮助您查看提交消息，但默认情况下它不会输出实际更改的内容。值得庆幸的是，该命令非常灵活，附加选项提供了对存储库历史的有用见解。
要在简短的视图中查看提交的概述，请使用命令

```bash
$ git log --oneline
ESC[33mbb37e28ESC[mESC[33m (ESC[mESC[1;36mHEAD -> ESC[mESC[1;32mmasterESC[mESC[33m)ESC[m Final Item
ESC[33md029598ESC[m New Item
ESC[33ma097903ESC[m Initial commit of the list
```

要输出具有更改内容差异的提交信息，您需要包含-p提示，例如

```bash
$ git log -p
ESC[33mcommit bb37e28391de9e741c2852396c5e16ea38bc0d06ESC[mESC[33m (ESC[mESC[1;36mHEAD -> ESC[mESC[1;32mmasterESC[mESC[33m)ESC[
Author: Katacoda Scenario <scenario@katacoda.com>
Date:   Thu Nov 4 11:55:52 2021 +0000

    Final Item

ESC[1mdiff --git a/list.html b/list.htmlESC[m
ESC[1mindex def310d..9f53aec 100644ESC[m
ESC[1m--- a/list.htmlESC[m
ESC[1m+++ b/list.htmlESC[m
ESC[36m@@ -3,4 +3,5 @@ESC[m
 <li>Aliquam tincidunt mauris eu risus.</li>ESC[m
 <li>Vestibulum auctor dapibus neque.</li>ESC[m
 <li>Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a.</li>ESC[m
ESC[32m+ESC[mESC[32m<li>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat
 </ul>ESC[m

ESC[33mcommit d029598d9d0fbd6fcf73133eeee75217d0ecfeebESC[m
Author: Katacoda Scenario <scenario@katacoda.com>
Date:   Thu Nov 4 11:55:52 2021 +0000

    New Item

ESC[1mdiff --git a/list.html b/list.htmlESC[m
ESC[1mindex 96e99d0..def310d 100644ESC[m
ESC[1m--- a/list.htmlESC[m
ESC[1m+++ b/list.htmlESC[m
ESC[36m@@ -2,4 +2,5 @@ESC[m
 <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>ESC[m
 <li>Aliquam tincidunt mauris eu risus.</li>ESC[m
 <li>Vestibulum auctor dapibus neque.</li>ESC[m
ESC[32m+ESC[mESC[32m<li>Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a.</li>ESC[m
 </ul>ESC[m

ESC[33mcommit a097903bb0c59689c6cd853943e073e92e18f1d6ESC[m
Author: Katacoda Scenario <scenario@katacoda.com>
Date:   Thu Nov 4 11:55:52 2021 +0000
```

这将输出整个历史。您可以使用许多不同的选项对其进行过滤。所述`-n <编号>`指定从HEAD提交至显示器的限制。例如
`git log -p -n 2`显示 HEAD 和 HEAD~1。

```bash
$ git log -p -n 2
ESC[33mcommit bb37e28391de9e741c2852396c5e16ea38bc0d06ESC[mESC[33m (ESC[mESC[1;36mHEAD -> ESC[mESC[1;32mmasterESC[mESC[33m)ESC[
Author: Katacoda Scenario <scenario@katacoda.com>
Date:   Thu Nov 4 11:55:52 2021 +0000

    Final Item

ESC[1mdiff --git a/list.html b/list.htmlESC[m
ESC[1mindex def310d..9f53aec 100644ESC[m
ESC[1m--- a/list.htmlESC[m
ESC[1m+++ b/list.htmlESC[m
ESC[36m@@ -3,4 +3,5 @@ESC[m
 <li>Aliquam tincidunt mauris eu risus.</li>ESC[m
 <li>Vestibulum auctor dapibus neque.</li>ESC[m
 <li>Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a.</li>ESC[m
ESC[32m+ESC[mESC[32m<li>Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat
 </ul>ESC[m

ESC[33mcommit d029598d9d0fbd6fcf73133eeee75217d0ecfeebESC[m
Author: Katacoda Scenario <scenario@katacoda.com>
Date:   Thu Nov 4 11:55:52 2021 +0000

    New Item

ESC[1mdiff --git a/list.html b/list.htmlESC[m
ESC[1mindex 96e99d0..def310d 100644ESC[m
ESC[1m--- a/list.htmlESC[m
ESC[1m+++ b/list.htmlESC[m
ESC[36m@@ -2,4 +2,5 @@ESC[m
 <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>ESC[m
 <li>Aliquam tincidunt mauris eu risus.</li>ESC[m
 <li>Vestibulum auctor dapibus neque.</li>ESC[m
ESC[32m+ESC[mESC[32m<li>Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a.</li>ESC[m
 </ul>ESC[m
```

如果您知道时间段，那么您可以使用`--since="2 weeks ago"`和 __`--until="1 day ago"`在特定日期之前的提交之间使用时间段。

使用该命令`git log --grep="Initial"`将输出在其提交消息中包含“Initial”一词的所有提交。如果您使用错误跟踪编号标记提交，这将非常有用。

正如我们在合并场景中所讨论的，由于使用合并通知提交，您的提交历史可能会变得嘈杂。要删除它们，请使用 `git log`提供参数-m。

###  7.3 git bisect

这些`git bisect`命令允许您对存储库进行二进制搜索，以查找哪个提交引入了问题和回归。在这一步中，我们将在 `list.html` 中找到忘记 HTML 标签的提交。

  1. `Git bisect` 需要很多步骤，执行这些步骤才能看到结果。
  2. 要进入二等分模式，请使用命令`git bisect start`。这表明它包含您在引入时要搜索的问题。
  3. 我们已经定义了错误提交发生的位置，现在需要定义上次已知的良好提交何时使用`git bisect good HEAD~5`.在这种情况下，它是五次提交前。
  4. 第 3 步将检出坏提交和好的提交之间的提交。然后，您可以检查提交、运行测试等以查看错误是否存在。在本例中您可以使用cat list.html
  5. 这个提交看起来不错，因为一切都有正确的 HTML 标签。我们告诉 Git 我们很高兴使用`git bisect good`.这将自动检查在最后一次已知的良好提交中间的提交，如步骤 5 和我们的错误提交中所定义。
  6. 正如我们之前所做的那样，我们需要检查提交是好是坏。 cat list.html
  7. 此提交缺少 HTML 标签。usinggit bisect bad将结束搜索并输出相关的提交 ID。

###  7.4 git blame

虽然“责备”文化是不可取的，但了解谁在文件的某些部分工作以帮助将来进行改进可能会很有用。这是git blame可以提供帮助的地方。

`git blame <file>` 显示最后修改文件每一行的修订版和作者。

在文件上运行blame将输出谁最后接触每一行。


```bash
$ git blame list.html
^a097903 (Katacoda Scenario 2021-11-04 11:55:52 +0000 1) <ul>
^a097903 (Katacoda Scenario 2021-11-04 11:55:52 +0000 2) <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
^a097903 (Katacoda Scenario 2021-11-04 11:55:52 +0000 3) <li>Aliquam tincidunt mauris eu risus.</li>
^a097903 (Katacoda Scenario 2021-11-04 11:55:52 +0000 4) <li>Vestibulum auctor dapibus neque.</li>
d029598d (Katacoda Scenario 2021-11-04 11:55:52 +0000 5) <li>Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, eui
bb37e283 (Katacoda Scenario 2021-11-04 11:55:52 +0000 6) <li>Praesent dapibus, neque id cursus faucibus, tortor neque egestas a
1958fba4 (Katacoda Scenario 2021-11-04 12:14:30 +0000 7) Vestibulum auctor dapibus neque
^a097903 (Katacoda Scenario 2021-11-04 11:55:52 +0000 8) </ul>
```

如果我们知道我们关心的行，那么我们可以使用`-L`参数来提供要输出的行范围。

```bash
$ git blame -L 6,8 list.html
bb37e283 (Katacoda Scenario 2021-11-04 11:55:52 +0000 6) <li>Praesent dapibus, neque id cursus faucibus, tortor neque egestas a
1958fba4 (Katacoda Scenario 2021-11-04 12:14:30 +0000 7) Vestibulum auctor dapibus neque
^a097903 (Katacoda Scenario 2021-11-04 11:55:52 +0000 8) </ul>
```

##  7.5 部分提交合并master

小提交的优点之一是您可以挑剔要合并的内容。

这个问题特别涉及长期存在的分支，这些分支已经与主分支过时，导致太多冲突而无法简单地合并。这在非常活跃的开源项目中很常见。

发生这种情况时，您希望能够挑选出单独的提交并将它们合并到主分支中。

该环境已配置了一个存储库，其中包含在单独的分支中开发的 HTML 列表。在这种情况下，我们将从这个分支中选择某些我们想要在 master 中结束的提交。

###  7.6 Cherry Picking

在这种情况下，我们在 _new分支中有许多提交，它创建了两个 html 文件。在这种情况下，我们只关心对其中一个文件的更改，但是如果我们合并了分支，那么我们将合并所有五个提交和不需要的更改。

要合并单个提交，我们使用该`git cherry-pick <hash-id|ref>`命令。这与`merge` 的行为方式类似，如果不存在冲突，则提交将自动合并。

按照以下步骤合并我们感兴趣的三个提交。我们希望按照它们在原始存储库中发生的顺序重放提交。

  1. 选择带有消息“初始提交，无项目”的提交
  2. 用“初始列表”消息挑选提交
  3. 选择带有消息“将最终项目添加到列表中”的提交

我们之前使用过 HEAD 来指示当前分支的尖端。您可以使用语法 _ 跨分支引用~#_。例如，`new_branch~3`**指的是分支中倒数第二个提交**，在这种情况下，它具有提交消息“初始提交，没有项目”

###  7.7 解决 Cherry-pick冲突

以同样的方式，合并会导致冲突，`Cherry Picking`也会导致冲突。您解决以同样的方式冲突与手动或者合并一个分支固定的文件或选择他们或者我们通过`git checkout`。

如果你觉得你犯了一个错误，你可以停止并使用`git cherry-pick --abort`

Cherry-pick第二个列表的创建使用 `git cherry-pick new_branch~1`

这将导致合并冲突。使用`git checkout`并选择选择的提交解决冲突。

准备好后继续，我们将完成cherry pick。

```bash
git cherry-pick new_branch~1

git status

git diff

git checkout --theirs list2.html
```

###  7.8 冲突后继续cherry-pick

解决冲突后，您可以使用命令继续进行`cherry pick git cherry-pick --continue`。

与使用`merge`类似，解决`cherry-pick` 将导致提交。

首先添加先前冲突的项目，然后使用--continue选项来完成樱桃选择。

```bash
$ git add list2.html
$ git cherry-pick --continue
[master d95af12] q :q! q q
 Date: Thu Nov 4 12:40:46 2021 +0000
 1 file changed, 4 insertions(+), 1 deletion(-)
```

此时，默认编辑器（在本例中为 vim）将弹出，允许您编辑精心挑选的提交消息，以包含冲突的详细信息及其解决方式。要保存和退出 vim 类型：wq

##  8. Re-writing History(重写历史)

Git 的一个重要方面是您保持存储库和历史记录的干净程度。一个干净的存储库更容易使用和理解发生了什么。

此场景将介绍如何使用 Rebase 重写 Git 历史记录以重构提交，以确保在推送更改之前它们是可理解的。您应该只重新设置未通过推送与其他人共享的提交。重新提交提交会导致他们的提交 ID 发生变化，这可能会导致丢失未来的提交。

###  8.1 修改提交消息

使用`git rebase -interactive`. 通过将 `rebase` 置于交互模式，您可以更好地控制要进行的更改。启动到交互模式后，您将获得六个命令来执行存储库中的每个提交。通过使用 Vim 默认打开的编辑器，您可以定义要在每次提交时执行的操作。

在这个例子中，我们想要改变提交。要将其置于此状态，我们需要更改提交旁边的单词“pick”以匹配基于 Vim 窗口中显示的列表要执行的操作，在本例中为“reword”。

在本例中，我们要更改提交消息。
首先，我们需要使用以下命令进入 `Interactive Rebase` 模式

```bash
git rebase --interactive --root
```

![在这里插入图片描述](https://img-blog.csdnimg.cn/57802bae4d9d44be9f10013347073aeb.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
开始使用 Vim 可能有点令人困惑，要编辑文本，您首先需要输入i，这将使您进入“插入模式”。

我们想编辑第一条提交消息“列表的初始提交”中的“提交”错字。对于提交，更改单词“pick”以匹配我们要在提交时执行的命令，在本例中为“reword”。

要保存并退出，请按esc键然后:wq。这将打开另一个 Vim 编辑器窗口。
再次使用 Vim，编辑提交消息以将“comit”更改为“commit”。保存并退出 Vim 后，您将看到 Git 更改提交的输出。使用`git log --oneline`以查看更新的提交信息。

该`--root`参数可以让你变基在库中的所有提交，其中包括第一次提交。

更改上次提交消息的更快替代方法是`git commit --amend`使用 Vim 进行更改。

###  8.2 Squash Commits（组合提交）

在您的本地环境中进行了一系列 8 次不同的提交。当时这些提交是有意义的，但现在它们只需要一次提交。衍合使用，我们需要压扁的提交在一起。

使用`git rebase --interactive HEAD~8`，我们有从 HEAD 到最后 0 的提交范围。要压缩我们需要一个基本提交，所有内容都将被压缩到其中。因此，将第一个提交保留为“pick”，但将其余提交更改为“squash”。

保存后，您将有机会进行编辑。默认情况下，Git 提交消息将是先前压缩的提交消息的组合。

当我们进入 `Interactive Rebase` 时，我们可以指定我们要使用以下命令修改前 8 次提交 `git rebase --interactive HEAD~8`

在前一阶段，我们使用了reword。这里我们要使用壁球。我们想将 8 个提交压缩为一个，如果我们将所有提交标记为压缩，那么我们会收到错误“不能在没有先前提交的情况下‘压缩’”，因为没有一个基本提交来压缩所有内容。

为了压缩提交，我们需要将第一个提交作为我们的基础，并用squash标记以下 7 。

在保存和退出 Vim 时，我们会看到一个新的 Vim 窗口，其中列出了 rebase 中 8 条提交消息的组合。

保存提交消息后，历史将被修改。你可以看到这个使用`git log --`在这里插入代码片`oneline`

###  8.3 Re-order Commits（重新排序提交）

我们想重新排序我们的最后两个提交。使用HEAD~2允许我们修改它们。

```bash
git rebase --interactive HEAD~2
```

使用 Vim，只需重新排列行，保存并退出，提交将匹配顺序。

###  8.4 拆分提交

就像压缩提交一样，有时将更改从提交中分离出来是很有用的，以便让它们保持专注并使挑选或恢复更容易。

拆分提交是一个两个阶段的过程。首先，我们需要定义要拆分的提交，然后需要定义新提交的外观。

**1.定义拆分提交**
在这里，我们要拆分之前的提交。我们使用`git rebase --interactive HEAD~1`

与之前的变基一样，我们需要将任务更改为编辑

我们现在处于交互式编辑历史的状态。Git 将记录所有更改，最终结果将应用于存储库。

**2.拆分提交**
在定义我们要编辑提交后，我们现在处于允许我们更改历史记录的状态。

 - 由于我们想要拆分现有提交，因此我们首先需要使用`git reset HEAD^`.
 - 提交已被删除，但文件仍然存在。我们现在可以按照我们以前的意愿执行提交，作为两个单独的操作。

执行命令：

```bash
git add file3.txt
git commit -m "File 3"
git add file4.txt
git commit -m "File 4"
```

一旦对存储库的状态感到满意，我们就会告诉 Git 继续 `rebase` 并使用`--continue`更新存储库。

```bash
git rebase --continue
```

您可以使用以下命令查看输出和两个新提交 `git log --oneline`


官方文档
[https://git-scm.com/book/en/v2/Getting-Started-Installing-Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
