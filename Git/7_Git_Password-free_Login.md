# Git 免密登录

许多Git服务器都支持使用SSH公钥进行认证，当然也包括github。
首先你需要确认一下自己是否已经拥有密钥了，默认情况下，用户的 SSH 密钥存储在其 `~/.ssh` 目录下。进入该目录并列出其中内容，你便可以快速确认自己是否已经拥有密钥：

```bash
$ cd ~/.ssh
$ ls
authorized_keys2  id_rsa       known_hosts
config            id_rsa.pub
```

我们需要寻找一对 `id_rsa` 或 `id_dsa` 命名的文件，其中一个带 .pub 扩展名。 `'.pub'`文件是你的公钥，另一个则是私钥。如果没有找不到这样的文件（或者根本就没有.ssh目录），我们可以通过 `ssh-keygen` 程序来创建它们。
#邮箱可以随便填

```bash
$ ssh-keygen -t rsa -C "xx@xx.com"
```

首先 ssh-keygen 会确认密钥的存储位置和文件名（默认是 .ssh/id_rsa）,然后他会要求你输入两次密钥口令，留空即可。所以一般选用默认，全部回车即可。
接下来我们登陆到GitHub上，右上角小头像`->Setting->SSH and GPG keys`中，点击new SSH key。
Title：可以随便填写，但最好起的名字能让自己知道这个公钥是哪个设备的。
Key：将上面生成的.pub文件中的所有内容复制到这里。
点击下面的Add SSH key即可。
然后你就会发现可以免密码访问了
Git服务器
如果服务端是自己搭建的git服务器，生成密钥公钥对的步骤是一样的。
然后将生成的 .pub 文件内容，导入到git服务器 /home/git/.ssh/authorized_keys 文件内，一行一个。
然后你就会发现git push 不再需要密码了
搭建git服务器和相关免登陆的详细步骤可参考我的另一篇 手把手教你搭建git服务器
HTTPS通信协议
上面讲了SSH方式的免密码，接下来讲一下越来越常用的HTTPS方式的免密码
新建文件并保存密码

```bash
$ touch ~/.git-credentials
$ vim ~/.git-credentials
https://{username}:{passwd}@github.com
```

添加git配置

```bash
$ git config --global credential.helper store
```

查看`～/.gitconfig`文件变化

```bash
$ cat ～/.gitconfig
[credential]
    helper = store
```

然后在尝试一下`git push`不再在需要密码了


