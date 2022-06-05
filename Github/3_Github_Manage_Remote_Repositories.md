#  github 管理远程仓库

##  1. 简介
GitHub 的协作开发方法取决于将提交从本地存储库发布到 GitHub 以供其他人查看、获取和更新

您只能推送到两种类型的 URL 地址：

 - HTTPS URL，如https://github.com/user/repo.git
 - SSH URL，例如git@github.com:user/repo.git

Git 将远程 URL 与名称相关联，您的默认远程通常称为`origin`.

##  2. 添加远程仓库

```bash
$ git remote add origin https://github.com/user/repo.git
# Set a new remote

$ git remote -v
# Verify new remote
> origin  https://github.com/user/repo.git (fetch)
> origin  https://github.com/user/repo.git (push)
```
##  3. 更改远程仓库的 URL
将远程 URL 从 SSH 切换到 HTTPS

```bash
$ git remote -v
> origin  git@github.com:USERNAME/REPOSITORY.git (fetch)
> origin  git@github.com:USERNAME/REPOSITORY.git (push)

#使用 git remote set-url 命令将远程的 URL 从 SSH 更改为 HTTPS。
$ git remote set-url origin https://github.com/USERNAME/REPOSITORY.git

$ git remote -v
# Verify new remote URL
> origin  https://github.com/USERNAME/REPOSITORY.git (fetch)
> origin  https://github.com/USERNAME/REPOSITORY.git (push)
```
将远程 URL 从 HTTPS 切换到 SSH

```bash
$ git remote -v
> origin  https://github.com/USERNAME/REPOSITORY.git (fetch)
> origin  https://github.com/USERNAME/REPOSITORY.git (push)

$ git remote set-url origin git@github.com:USERNAME/REPOSITORY.git


$ git remote -v
# Verify new remote URL
> origin  git@github.com:USERNAME/REPOSITORY.git (fetch)
> origin  git@github.com:USERNAME/REPOSITORY.git (push)
```
##  4. 重命名远程仓库

```bash
$ git remote -v
# 查看现有远程
> origin  https://github.com/OWNER/REPOSITORY.git (fetch)
> origin  https://github.com/OWNER/REPOSITORY.git (push)

$ git remote rename origin destination
# 将远程名称从 'origin' 更改为 'destination'

$ git remote -v
# 验证远程的新名称
> destination  https://github.com/OWNER/REPOSITORY.git (fetch)
> destination  https://github.com/OWNER/REPOSITORY.git (push)
```
##  5. 删除远程仓库

```bash
$ git remote -v
# 查看当前远程
> origin  https://github.com/OWNER/REPOSITORY.git (fetch)
> origin  https://github.com/OWNER/REPOSITORY.git (push)
> destination  https://github.com/FORKER/REPOSITORY.git (fetch)
> destination  https://github.com/FORKER/REPOSITORY.git (push)

$ git remote rm destination
# 删除远程
$ git remote -v
# 验证其已删除

> origin  https://github.com/OWNER/REPOSITORY.git (fetch)
> origin  https://github.com/OWNER/REPOSITORY.git (push)
```
> 注意：`git remote rm` 不会从服务器中删除远程存储库。 它只是从本地仓库中删除远程及其引用。
