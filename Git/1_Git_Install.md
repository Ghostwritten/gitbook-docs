# Git 安装

## 1. 简介
Git 目前支持 Linux/Unix、Solaris、Mac和 Windows 平台上运行。
下载地址为：[http://git-scm.com/downloads](http://git-scm.com/downloads)

## 2. linux 安装
Linux 平台上安装
Git 的工作需要调用 curl，zlib，openssl，expat，libiconv 等库的代码，所以需要先安装这些依赖工具。
在有 yum 的系统上（比如 Fedora）或者有 apt-get 的系统上（比如 Debian 体系），可以用下面的命令安装：
各 Linux 系统可以使用其安装包管理工具（apt-get、yum 等）进行安装：
### 2.1 Debian/Ubuntu

```bash
$ apt-get install libcurl4-gnutls-dev libexpat1-dev gettext \
  libz-dev libssl-dev

$ apt-get install git

$ git --version
git version 1.8.1.2
```
###  2.2 Centos/RedHat

```bash
$ yum install curl-devel expat-devel gettext-devel \
  openssl-devel zlib-devel

$ yum -y install git-core

$ git --version
git version 1.7.1
```

##  3. 源码安装

```bash
########## Centos/RedHat ##########
$ yum install curl-devel expat-devel gettext-devel \
  openssl-devel zlib-devel

########## Debian/Ubuntu ##########
$ apt-get install libcurl4-gnutls-dev libexpat1-dev gettext \
  libz-dev libssl-dev

$ tar -zxf git-1.7.2.2.tar.gz
$ cd git-1.7.2.2
$ make prefix=/usr/local all
$ sudo make prefix=/usr/local install
```

##  4. Windows 安装
安装包下载地址：[https://gitforwindows.org/](https://gitforwindows.org/)
官网慢，可以用国内的镜像：[https://npm.taobao.org/mirrors/git-for-windows/](https://npm.taobao.org/mirrors/git-for-windows/)。
完成安装之后，就可以使用命令行的 git 工具（已经自带了 ssh 客户端）了，另外还有一个图形界面的 Git 项目管理工具。
在开始菜单里找到"Git"->"Git Bash"，会弹出 Git 命令窗口，你可以在该窗口进行 Git 操作。


##  5. Mac 安装
在 Mac 平台上安装 Git 最容易的当属使用图形化的 Git 安装工具，下载地址为：

[http://sourceforge.net/projects/git-osx-installer/](http://sourceforge.net/projects/git-osx-installer/)

安装界面如下所示：
![在这里插入图片描述](https://img-blog.csdnimg.cn/48583b7722194580a2a8d44a1fcd3b6d.png)

##  6. Git 配置
Git 提供了一个叫做 `git config` 的工具，专门用来配置或读取相应的工作环境变量。

这些环境变量，决定了 Git 在各个环节的具体工作方式和行为。这些变量可以存放在以下三个不同的地方：

 - `/etc/gitconfig` 文件：系统中对所有用户都普遍适用的配置。若使用 `git config` 时用 `--system`
   选项，读写的就是这个文件。
 - `~/.gitconfig` 文件：用户目录下的配置文件只适用于该用户。若使用 `git config` 时用 `--global`
   选项，读写的就是这个文件。

当前项目的 Git 目录中的配置文件（也就是工作目录中的 `.git/config` 文件）：这里的配置仅仅针对当前项目有效。每一个级别的配置都会覆盖上层的相同配置，所以 `.git/config` 里的配置会覆盖 /etc/gitconfig 中的同名变量。
在 Windows 系统上，Git 会找寻用户主目录下的 .gitconfig 文件。主目录即 $HOME 变量指定的目录，一般都是 `C:\Documents and Settings\$USER`。

此外，Git 还会尝试找寻 `/etc/gitconfig` 文件，只不过看当初 Git 装在什么目录，就以此作为根目录来定位。

###  6.1 用户信息
配置个人的用户名称和电子邮件地址：

```bash
$ git config --global user.name "ghostWritten"
$ git config --global user.email 1zoxun1@gmail.com
```
###  6.2 查看配置

```bash
$ git config --list
http.postbuffer=2M
user.name=ghostWritten
user.email=1zoxun1@gmail.com

$ git config user.name
runoob
```
这些配置我们也可以在 `~/.gitconfig` 或 `/etc/gitconfig` 看到，如下所示：

```bash
$ vim ~/.gitconfig 
[http]
    postBuffer = 2M
[user]
    name = ghostWritten
    email = 1zoxun1@gmail.com
```

---

![在这里插入图片描述](https://img-blog.csdnimg.cn/409e253d36e74a148d8c3b46ff1d0d1e.gif#pic_center)
