# gitlab 开始

----------

## 1. 前提
jenkins插件地址： [http://updates.jenkins-ci.org/download/plugins/](http://updates.jenkins-ci.org/download/plugins/)    

 - 192.168.211.90   gitlab、jenkins、Maven
 - 192.168.211.91  git、httpd
 - 192.168.211.92  nexus、sonarqube、docker-ce

192.168.211.93   这个是单独的环境，用于测试jenkins和docker的


```c
关闭防火墙
# systemctl disable  firewalld.service 

关闭NetworkManager
# systemctl stop NetworkManager


关闭selinux
# cat /etc/selinux/config 
	SELINUX=disabled


安装常用命令
# yum install  -y net-tools lrzsz tree screen lsof wget ntpdate

设置时间
# crontab -e 添加
# crontab -l
*/5 * * * * /usr/sbin/ntpdate time1.aliyun.com


更改时区
# ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
```






## 2. 安装gitlab
1.1 gitlab的安装192.168.211.90

GitHub 和  GitLab 都是基于 web 的 Git 仓库

安装依赖：

```c
# yum install curl policycoreutils openssh-server openssh-clients policycoreutils-python -y
```


下载rpm包

```c
# cd /usr/local/src/
#wget https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el7/gitlab-ce-11.9.1-ce.0.el7.x86_64.rpm
# rpm -ivh gitlab-ce-11.9.1-ce.0.el7.x86_64.rpm 
```



## 3. 配置gitlab
gitlab的默认配置文件位于：`vim /etc/gitlab/gitlab.rb`，修改`external_url`为本机的IP地址或者一个可以访问到本机的域名

```bash
external_url 'http://192.168.211.90'
```

修改完主配置文件后，使用`gitlab-ctl reconfigure`重新配置加载gitlab


## 4. 启动gitlab
重新配置执行成功后，就可以重新启动gitlab

```c
# gitlab-ctl restart
ok: run: alertmanager: (pid 5060) 1s
ok: run: gitaly: (pid 5078) 0s
ok: run: gitlab-monitor: (pid 5091) 1s
ok: run: gitlab-workhorse: (pid 5114) 0s
ok: run: logrotate: (pid 5125) 0s
ok: run: nginx: (pid 5132) 1s
ok: run: node-exporter: (pid 5216) 0s
ok: run: postgres-exporter: (pid 5227) 1s
ok: run: postgresql: (pid 5238) 0s
ok: run: prometheus: (pid 5246) 1s
ok: run: redis: (pid 5260) 0s
ok: run: redis-exporter: (pid 5430) 0s
ok: run: sidekiq: (pid 5439) 0s
ok: run: unicorn: (pid 5451) 0s
```


在浏览器里输入：`http://192.168.211.90/`，首次登陆要求重设root密码
更改密码成功后
登陆即可


## 5. GitLab构成
gitlab由以下服务构成，他们共同承担了gitlab的运作需要

 - `Nginx`：静态的web服务器
 - `gitlab-shell`：用于处理git命令和修改authorized keys列表
 - `gitlab-workhorse`：轻量级的反向代理服务器
 - `logrotate`：日志文件管理工具
 - `postgresql`：数据库
 - `redis`：缓存数据库
 - `sidekiq`：用于在后台执行队列任务（异步执行）
 - `unicorn`：An HTTP server for Rack application，gitlab
   `rails`应用是托管在这个服务器上面的

可以使用命令来查看各个服务的状态

```c
# gitlab-ctl status
run: alertmanager: (pid 5060) 53429s; run: log: (pid 4308) 53665s
run: gitaly: (pid 5078) 53428s; run: log: (pid 3570) 53739s
run: gitlab-monitor: (pid 5091) 53428s; run: log: (pid 4171) 53683s
run: gitlab-workhorse: (pid 5114) 53427s; run: log: (pid 3939) 53700s
run: logrotate: (pid 5125) 53427s; run: log: (pid 4017) 53693s
run: nginx: (pid 5132) 53427s; run: log: (pid 3967) 53699s
run: node-exporter: (pid 5216) 53427s; run: log: (pid 4130) 53688s
run: postgres-exporter: (pid 5227) 53427s; run: log: (pid 4356) 53660s
run: postgresql: (pid 5238) 53426s; run: log: (pid 3660) 53735s
run: prometheus: (pid 5246) 53426s; run: log: (pid 4242) 53672s
run: redis: (pid 5260) 53425s; run: log: (pid 3387) 53746s
run: redis-exporter: (pid 5430) 53425s; run: log: (pid 4210) 53678s
run: sidekiq: (pid 5439) 53424s; run: log: (pid 3906) 53705s
run: unicorn: (pid 5451) 53423s; run: log: (pid 3875) 53709s
```

 ![在这里插入图片描述](https://img-blog.csdnimg.cn/8ac14087ba9d4f2fa85d5bc342db48df.png)

### 5.1 gitlab shell 
Gitlab Shell有两个作用：**为Gitlab处理git命令、修改authorized keys列表**。
当通过ssh访问`gitlab server` 时，gitlab shell会：
	

 - 调用`gitlab rails api`检查权限
 - 执行`pre-receive`钩子（在gitlab企业版中叫做git钩子）
 - 执行你请求的动作 处理gitlab的`post-receive`动作
 - 处理自定义的`post-receive`动作

当通过`http\https`访问`gitlab server`时，工作流程取决于你是从git仓库拉取(pull)代码还是向git仓库推送(push)代码
如果你是从git仓库拉取(pull)代码，`gitlab rails`应用会全权负责处理用户鉴权和执行git命令的工作
如果你是从git仓库推送(push)代码，`gitlab rails`应用既不会进行用户鉴权也不会执行git命令，它会把以下工作交由`gitlab shell`进行处理

 - 调用gitlab rails api检查权限
 - 执行pre-receive钩子（在gitlab企业版中叫做git钩子）
 - 执行你请求的动作
 - 处理gitlab的`post-receive`动作
 - 处理自定义的`post-receive`动作

	
	
	
### 5.2 gitlab workhorse 
`gitlab workhorse`是一个敏捷的反向代理，它会处理一些大的http请求，比如文件的上传、文件的下载、`git push/pull`和git包下载。其它的请求会反向代理到`gitlab rails`应用，即反向代理给后端的`unicorn`


## 6. gitlab 命令
启动所有的gitlab组件

```c
# gitlab-ctl start
停止所有gitlab组件
# gitlab-ctl stop
停止postgresql组件
# gitlab-ctl stop postgresql 
停止相关的数据连接服务
# gitlab-ctl stop unicorn 
# gitlab-ctl stop sidekiq 
重启所有gitlab组件
# gitlab-ctl restart
重启gitlab-workhorse组件
# gitlab-ctl restart gitlab-workhorse 
查看服务状态
# gitlab-ctl status
如果更改了配置文件[gitlab.rb 文件]，使配置文件生效，但是会初始化除了gitlab.rb之外的所有文件
# sudo gitlab-ctl reconfigure 
查看日志
# sudo gitlab-ctl tail
检查redis的日志
# sudo gitlab-ctl tail redis
```



## 7. gitlab主要目录

 - `/var/opt/gitlab/git-data/repositories/` ：库默认存储的目录
 - `/opt/gitlab/`  ： 应用代码和相应的依赖程序存放目录
 - `/var/opt/gitlab` ： gitlab-ctl reconfigure命令编译后的应用数据和配置文件，不需要人为修改配置
 - `/etc/gitlab` ： 配置文件目录
 - `/var/log/gitlab/`  : 此目录下存放了各个组件产生的日志
 - `/var/opt/gitlab/backups/` ： 备份文件生成的目录

gitlab关闭用户注册功能
登录web界面后
点击上方导航栏的Admin Area 
点击左边的设置setting

找到`Sign-up restrictions`配置区域，点击扩展
去掉`Sign-up enabled`前面的√

最后点击save保存按钮





## 8. gitlab 仓库管理
gitlab是通过组（group）的概念来统一管理仓库(project)和用户（user），通过创建组、在组下再创建仓库、再将用户加入到组，从而实现用户与仓库的权限管理

 - 创建组 `create group`
 - 在管理员页面顶部的`Admin area`按钮，进入管理员区域
 - 点击`new group`按钮

 ![在这里插入图片描述](https://img-blog.csdnimg.cn/bdddd51971d34943a6cef8be128c989a.png)

填写必要的信息
组名、组路径、组描述
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/94f41a80f0644e8487f3982d6d4e601a.png)


组可见级别

 - `Visibility level` ：选择谁可以访问该组、我们默认选择private即可
 - `Private`：The group and its projects can only be viewed by members.
   只有授权的用户才可以看到
 - `Internal`：The group and any internal projects can be viewed by any
   logged in user. 只要是登录gitlab的用户都可以看到
 - `Public`：The group and any public projects can be viewed without any
   authentication. 只要是可以访问gitlab web页面的人都可以看到

 ![在这里插入图片描述](https://img-blog.csdnimg.cn/f6bb8cdeb78349bdb14236ac861a8595.png)

信息填完、点击创建组
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/15cbffb9682b4a3eafea2434d248462d.png)

进入创建好的组管理界面
可以再找个界面下创建组用户的
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/8170de22e25e4440be0b51539a751374.png)






## 9. 创建用户create user
在管理员页面点击页面顶部的Admin Area按钮，进入管理员区域
点击创建用户
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/ec6657e85ddf4e66b8c29fca55e9ab24.png)

填写必要的信息
用户名昵称、用户名、电子邮箱、选择用户级别
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/3ba4d813fef54d61ad8aecdfc196612b.png)

点击创建用户
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/257b8dd35466460787577a4e6d9a7fe1.png)

进入用户的管理界面
点击页面的右上页的Edit按钮，为用户设置初始密码
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/b8aa3c2af6d94340aad120ac90aa6067.png)
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/8a0ddf8a6265456ca0b8e6ade0d45e43.png)


 
也可以设置用户的其他信息
最后点击save更改
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/1044379514c041d787c0426b9d97e05d.png)



## 10. 用户授权（grant user）

用户创建完成后，我们就需要对用户进行授权，从而使用户可以管理仓库，有两种方式，一 是 将用户加入到组，这样用户可以管理组内的仓库；二是 直接授权用户管理仓库。通常我们采用的方式是将用户加入到相应的组，并赋予不同的角色。Gitlab中用户的角色是系统定义好的，不能更改，这一点可能不符合我们正常的思维习惯。
下面将刚创建好的nqt用户添加到xmlgrg_test组，并赋予developer的权限
在管理员区域、点击创建的组，进入组管理界面
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/73f89c8a2ddb43c69624e0809344112a.png)
![在这里插入图片描述](https://img-blog.csdnimg.cn/2821054f8fe640d1b472a09365cf08c7.png)


 

选择用户、给予权限，点击添加
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/2d60c834093343c8aff185e7d431a18c.png)

添加成功
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/68416b944658426e84699e550b6ad3e4.png)

相应权限的官方文档说明：[https://docs.gitlab.com/ee/user/permissions.html](https://docs.gitlab.com/ee/user/permissions.html)


## 11. 创建仓库create project
在gitlab中，创建project用来存储你的程序代码、作为一个问题的跟踪器、用于代码协作、用于持续集成中的构建、测试和部署等服务。

在管理员区域点击New project
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/f51279ed12a045b78ef771a2db643181.png)

填写新建仓库的信息
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/48f147a3540c42cc916eb90f3f64f40d.png)

创建完成后页面有这2个提示、先不要管
 
仓库的管理页面左侧为仓库操作的相关菜单栏、右侧空仓库下显示如何在命令行连接该仓库、非空时显示仓库内容
![在这里插入图片描述](https://img-blog.csdnimg.cn/80f48a5df36448fbb07793d303469cb3.png)

```c
Command line instructions

Git global setup
# git config --global user.name "Administrator"
# git config --global user.email "admin@example.com"

Create a new repository
# git clone http://192.168.137.100/xmlgrg_test/xm.git
# cd xm
# touch README.md
# git add README.md
# git commit -m "add README"
# git push -u origin master

Existing folder
# cd existing_folder
# git init
# git remote add origin http://192.168.137.100/xmlgrg_test/xm.git
# git add .
# git commit -m "Initial commit"
# git push -u origin master

Existing Git repository
# cd existing_repo
# git remote rename origin old-origin
# git remote add origin http://192.168.137.100/xmlgrg_test/xm.git
# git push -u origin --all
# git push -u origin --tags
```

将仓库加入到组后，组内的成员就可以看到该仓库
使用`nqt`用户登录。可以看到仓库`xm`
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/4a178b4943a848ae85ed0ab3cf1c18f2.png)



## 12. 配置ssh key
仓库是私有的，只有授权的用户才可以访问该仓库，那么只要客户端的用户与我们gitlab的用户绑定，客户端即可访问到gitlab上的仓库，建议使用ssh方式实现客户端与gitlab用户的绑定，具体配置如下：
在客户端生成ssh密钥对(注意 windows客户端下只能使用rsa加密方式)

在192.168.211.90 ，gitlab的服务器上
切换到运行gitlab的用户下，我这里直接使用的是服务器的root用户

```c
# ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): 
Created directory '/root/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:TPquDQ/XGM5zBefa86ZCfKiGLh8aWHWbbVEdV06etUM root@localhost.localdomain
The key's randomart image is:
+---[RSA 2048]----+
|            ...E*|
|           .  o=+|
|      . o o .  +o|
|     . = + =    .|
|    . . S.o.o    |
|   o   + =++.    |
|  . . +.Bo+.o    |
|    .o.Ooo.  o.  |
|    .++o+  ..o.  |
+----[SHA256]-----+
# ll /root/.ssh/
总用量 8
-rw------- 1 root root 1679 5月   2 17:07 id_rsa
-rw-r--r-- 1 root root  408 5月   2 17:07 id_rsa.pub
# cat /root/.ssh/id_rsa.pub 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDC9rQr5/sh7EJGMmScIJnyG+vWaXpjibA4i81ik14pdyeV80CYTmV7h38fYSKbsGI+MeQX8euvsqveGhNqJsNvTSNm/c5aoHudY6vNrvVkP1SM1gIsdgGb8I2uJeQBPi
KftLnWashuO85vKiZ5hmv9THMW/Zn1NhiCuh3Ixj2PqEiUGxLLMb4NltJSoJOrOkKYZKd6FyLqXoLNJ9QN/m8uCHgS2vlTa7wvNIOZwAQnZ3Rx95dSusosUDHzfwBeMkCuNQpcP2kkQ2E6r+oi+zAlW/q6sUhHQzg0t1zat8IgEpJi3cu0TJRrdAnjNLlSL4Ue+RpmRrwoKs/gUgmrdIlZ root@localhost.localdomain
```

将该用户与gitlab的root用户绑定
点击gitlab用户的图标、找到setting
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/5c16a350de7b40dba17f9798a5bea8ad.png)

进入到用户的设置页面、点击左侧菜单栏的ssh keys
这个页面还可以设置用户的其它信息
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/80537455cb7c48faa917f8ad9e2c1577.png)

Ssh的配置页面
此处只能添加公钥，注意、一个公钥在整个gitlab系统中只能添加一次，但是一个gitlab用户可以添加多个公钥
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/aface3c86663476897453d66f51ad40d.png)





## 13. 推送本地客户端仓库到gitlab

```bash
yum install -y git
git --version
```

 

设置本仓库的global级别信息

```c
# git config --global user.name quntao
# git config --global user.email xmlgrg@163.com
# git config --list
user.name=quntao
user.email=xmlgrg@163.com
```

创建一个空仓库

```c
# pwd
/data/git_test
# git init
初始化空的 Git 版本库于 /data/git_test/.git/
# ll -a
总用量 0
drwxr-xr-x 3 root root  18 5月   2 20:09 .
drwxr-xr-x 3 root root  22 5月   2 20:09 ..
drwxr-xr-x 7 root root 119 5月   2 20:09 .git
```

# 


设置过滤文件
有了仓库，我们便可以在git_test文件夹下的工作区做文件的增删修改工作了，但很多时候，我们只在意开发过程中的源文件，并不需要管理自动产生的其它临时文件。这时候便需要一个过滤文件，在这个文件中设置过滤规则，让git能够自动过滤掉那些临时文件，这个文件便是.gitignore文件。
在仓库目录下创建.gitignore文件

```c
# pwd
/data/git_test
# touch .gitignore
# vim .gitignore 
# cat .gitignore 
test.txt
/test/
*.txt
```

 - `test.txt`  //过滤test.txt文件
 - `/test/`    //过滤test目录
 - `*.txt`	   //过滤所有以.txt结尾的文件

常用的通配规则：

 - 以斜杠“`/`”开头表示目录
 - 以星号“`*`”通配说个字符
 - 以问号“`？`”通配单个字符
 - 以方括号”`[]`“包含单个字符的匹配列表
 - 以叹号“`！`”表示不忽略(跟踪)匹配到的文件或目录

```c
# touch a
# touch b
# touch c
# git add a
# git add b
# git add c
# git commit -m "commit a"     //"commit a" 提交版本的描述信息
[master（根提交） 4141cd7] commit a
 3 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a
 create mode 100644 b
 create mode 100644 c
```

推送本地客户端仓库到gitlab中

```c
# pwd
/data/git_test
# git remote add gitlab git@192.168.137.100:xmlgrg_test/xm.git
```

您在 `/var/spool/mail/root` 中有新邮件

```c
# git remote
gitlab
# ll -a
总用量 4
drwxr-xr-x 3 root root  63 5月   2 20:19 .
drwxr-xr-x 3 root root  22 5月   2 20:09 ..
-rw-r--r-- 1 root root   0 5月   2 20:19 a
-rw-r--r-- 1 root root   0 5月   2 20:19 b
-rw-r--r-- 1 root root   0 5月   2 20:19 c
drwxr-xr-x 8 root root 166 5月   2 20:25 .git
-rw-r--r-- 1 root root  22 5月   2 20:14 .gitignore
# git push -u gitlab master
The authenticity of host '192.168.137.100 (192.168.137.100)' can't be established.
ECDSA key fingerprint is SHA256:zUU81Kb1Q5uS1ewufeZ1qLyErPI0uOyIhEmOabssXoE.
ECDSA key fingerprint is MD5:1a:bc:a7:24:e7:f6:ce:4e:d3:df:56:ac:4a:e2:a5:3c.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '192.168.137.100' (ECDSA) to the list of known hosts.
Counting objects: 3, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 203 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To git@192.168.137.100:xmlgrg_test/xm.git
 * [new branch]      master -> master
```

分支 master 设置为跟踪来自 gitlab 的远程分支 master。
提示推送成功，我们在gitlab上的xm仓库上可以看到推送上来的内容
 
![在这里插入图片描述](https://img-blog.csdnimg.cn/0ea7984927a84b96901abbe708ef69a0.png)







## 14. 克隆gitlab仓库到本地客户端
192.168.211.91
在这台服务器上安装git
使用yum默认安装的git版本是1.8，版本较低，我们可以使用源码安装
首先需要安装依赖库：

```bash
# yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker
```

下载最新的源码包

```c
# cd /usr/local/src/
# wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.19.2.tar.xz
# tar xf git-2.19.2.tar.xz
# cd git-2.19.2
# make prefix=/usr/local/git all
# make prefix=/usr/local/git install
# rm -rf /usr/bin/git
# ln -s /usr/local/git/bin/git /usr/bin/git
# git --version
git version 2.19.2


生成ssh key
[root@localhost git-2.19.2]# ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): 
Created directory '/root/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /root/.ssh/id_rsa.
Your public key has been saved in /root/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:deiQnPXeqNII+GsnVedBO0255UWtGto4PEbeEYSBTPo root@localhost.localdomain
The key's randomart image is:
+---[RSA 2048]----+
|       o..o+.  oo|
|       oo+.oo o +|
|      . = o.o= =.|
|     . . +ooBo+ .|
|    . . E=.Bo*.  |
|     . ..oO.=    |
|      ..o.oo     |
|      o...       |
|     ..o         |
+----[SHA256]-----+
[root@localhost git-2.19.2]# ll /root/.ssh/
总用量 8
-rw------- 1 root root 1675 5月   2 20:44 id_rsa
-rw-r--r-- 1 root root  408 5月   2 20:44 id_rsa.pub
[root@localhost git-2.19.2]# cat /root/.ssh/id_rsa.pub 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwUIYoYKPxp23ZH+Q4DmQJtuxv9AWmZUKemTVJ0cBDB03K4AhF64orfODrdGmEr1G0IllPuhMJ7HtbRR7EcsCE8MunxikRyJhb8iOYzTtTkGDy9Q0aZ/BUKx7wAmIj+u
NHe+X8YUYtpMfMngtLl5XL0yHRvMoPVaUPT9FlejfRtrj3Qh8+vKiN4q9c36tC8eoyEnKE656yboTNkYE43Djp6DyynPmNcuB4dOVNz+OA+uR7OIidT6fxw16bxkCXUQeQ/Y6doMCOjBuZEUsD0VaSQ5J16ewd47cBbeEv/fVUIoZFXv5VrtowYWU6WlzMu2AQRiQs+ZeYik0L2UqcOXmP root@localhost.localdomain
```


然后配置192.168.211.91客户端与gitlab上的nqt用户绑定
 
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/168386b85ca14472b354a3667d0c7a5d.png)
![在这里插入图片描述](https://img-blog.csdnimg.cn/13ea1e13e48a4787816359697b7f06d2.png)

使用git clone命令克隆仓库到192.168.211.91服务器本地

```c
[root@localhost data]# mkdir /101
[root@localhost data]# cd /101
[root@localhost 101]# git clone git@192.168.137.100:xmlgrg_test/xm.git
正克隆到 'xm'...
The authenticity of host '192.168.137.100 (192.168.137.100)' can't be established.
ECDSA key fingerprint is SHA256:zUU81Kb1Q5uS1ewufeZ1qLyErPI0uOyIhEmOabssXoE.
ECDSA key fingerprint is MD5:1a:bc:a7:24:e7:f6:ce:4e:d3:df:56:ac:4a:e2:a5:3c.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '192.168.137.100' (ECDSA) to the list of known hosts.
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 0), reused 0 (delta 0)
接收对象中: 100% (3/3), 完成.
[root@localhost 101]# ll -a
总用量 0
drwxr-xr-x   3 root root  16 5月   2 20:49 .
dr-xr-xr-x. 19 root root 247 5月   2 20:49 ..
drwxr-xr-x   3 root root  45 5月   2 20:49 xm
[root@localhost 101]# cd xm
[root@localhost xm]# ll -a
总用量 0
drwxr-xr-x 3 root root  45 5月   2 20:49 .
drwxr-xr-x 3 root root  16 5月   2 20:49 ..
-rw-r--r-- 1 root root   0 5月   2 20:49 a
-rw-r--r-- 1 root root   0 5月   2 20:49 b
-rw-r--r-- 1 root root   0 5月   2 20:49 c
drwxr-xr-x 8 root root 163 5月   2 20:49 .git
[root@localhost xm]# 
[root@localhost xm]# git remote
origin
```

可以看到已经将gitlab上的xm仓库克隆到192.168.137.101本地，同时为本地仓库添加了一个指向gitlab上xm仓库的远程仓库

在192.168.137.101的xm上创建一个dev的分支，并将dev分支，推送到gitlab上

```c
[root@localhost 101]# cd xm
[root@localhost xm]# pwd
/101/xm
[root@localhost xm]# pwd
/101/xm
[root@localhost xm]# git checkout -b dev
切换到一个新分支 'dev'
[root@localhost xm]# git status
位于分支 dev
无文件要提交，干净的工作区
[root@localhost xm]# git push -u origin dev
总共 0 （差异 0），复用 0 （差异 0）
remote: 
remote: To create a merge request for dev, visit:
remote:   http://192.168.137.100/xmlgrg_test/xm/merge_requests/new?merge_request%5Bsource_branch%5D=dev
remote: 
To 192.168.137.100:xmlgrg_test/xm.git
 * [new branch]      dev -> dev
```

分支 'dev' 设置为跟踪来自 'origin' 的远程分支 'dev'。
完成后，在gitlab上可以看到推上来的dev分支
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/3160e5f0763f4fe29c147d761b175a75.png)


## 15. 设置分支保护
在实际使用过程中，通常会保持master分支的稳定，用于生产环境的版本发布，只有授权的用户才可以向master合并代码。要实现此功能，需要将master设置为保护分支，同时授权什么用户可以向master用户推送代码。

使用root用户登录gitlab，点击xm仓库页面左下角的setting
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/c6052fbff4844b52a57011c5778a6cec.png)

进入设置页面，选择设置菜单栏下面的Repository选项
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/46d869dd3f7843ccbb790e85b2192d2d.png)

找到Protected Branches、点击展开
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/6dc2fac086054f939e8cd7f258a32953.png)

展开Protected Branches
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/d1ddf0bff7d54c4586b5976f5bc1c755.png)
![在这里插入图片描述](https://img-blog.csdnimg.cn/cb7854ab0f0b4f9ca7a7434d6016c5b9.png)


 
设置完dev为保护的后，在仓库的分支页面，可看到分支后出现一个绿色的protected
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/f597e25b23d24e24819997220288b7db.png)
默认的情况下，master分支是不允许developer角色向其推送内容的


##  16. Gitlab的备份、恢复、升级
对gitlab进行备份将会创建一个包含所有库和附件的归档文件，对备份的恢复只能恢复到与备份时的gitlab相同的版本。将gitlab迁移到另一台服务器上的最佳方法就是通过备份和还原。Gitlab提供了一个简单的命令行来备份整个gitlab，并且能灵活的满足需求。

备份配置
备份文件将保存在配置文件中定义的backup_path中，文件名为TIMESTAMP_GITLAB_BACKUP.TAR，TIMESTAMP为备份的时间戳。TIMESTAMP的格式为：EPOCH_YYYY_MM_DD_Gitlab-version。
默认的备份文件目录为：/var/opt/gitlab/backups，如果自定义备份目录需要赋予目录git权限，具体操作如下：
配置文件中加入：

```c
#  vim /etc/gitlab/gitlab.rb
### Backup Settings
###! Docs: https://docs.gitlab.com/omnibus/settings/backups.html
#gitlab_rails['manage_backup_path'] = true
gitlab_rails['backup_path'] = "/data/gitlab/backups"  #备份的目录

##!Docs:https://docs.gitlab.com/ce/raketasks/backup_restore.html#backup-archive-permissions
# gitlab_rails['backup_archive_permissions'] = 0644

# gitlab_rails['backup_pg_schema'] = 'public'

###! The duration in seconds to keep backups before they are allowed to be deleted
gitlab_rails['backup_keep_time'] = 604800   #备份保留的时间(以秒为单位，这个是7天默认值)
在命令行执行命令如下
# mkdir -pv /data/gitlab/backups
# chown -R git.git /data/gitlab/backups/
# gitlab-ctl reconfigure
# gitlab-ctl restart
```

### 16.1 手动备份
在命令行执行：

```c
# gitlab-rake gitlab:backup:create
2019-05-18 21:26:25 +0800 -- Dumping database ... 
Dumping PostgreSQL database gitlabhq_production ... [DONE]
2019-05-18 21:26:25 +0800 -- done
2019-05-18 21:26:25 +0800 -- Dumping repositories ...
 * xmlgrg_test/xm ... [DONE]
[SKIPPED] Wiki
2019-05-18 21:26:26 +0800 -- done
2019-05-18 21:26:26 +0800 -- Dumping uploads ... 
2019-05-18 21:26:26 +0800 -- done
2019-05-18 21:26:26 +0800 -- Dumping builds ... 
2019-05-18 21:26:26 +0800 -- done
2019-05-18 21:26:26 +0800 -- Dumping artifacts ... 
2019-05-18 21:26:26 +0800 -- done
2019-05-18 21:26:26 +0800 -- Dumping pages ... 
2019-05-18 21:26:26 +0800 -- done
2019-05-18 21:26:26 +0800 -- Dumping lfs objects ... 
2019-05-18 21:26:26 +0800 -- done
2019-05-18 21:26:26 +0800 -- Dumping container registry images ... 
2019-05-18 21:26:26 +0800 -- [DISABLED]
Creating backup archive: 1558185986_2019_05_18_11.9.1_gitlab_backup.tar ... done
Uploading backup archive to remote storage  ... skipped
Deleting tmp directories ... done
done
done
done
done
done
done
done
Deleting old backups ... done. (0 removed)
# ll /data/gitlab/backups/   在制定的目录下生成对应的备份文件
总用量 112
-rw------- 1 git git 112640 5月  18 21:26 1558185986_2019_05_18_11.9.1_gitlab_backup.tar
```







### 16.2 定时备份
通过在定时任务里添加：
每天凌晨2点进行一次自动备份:通过crontab使用备份命令实现，需重启cron服务
#输入命令crontab -e 

```c
sudo crontab -e 
#输入相应的任务  环境变量CRON=1的作用是如果没有任何错误发生时，抑制备份脚本的所有进度输出
0 2 * * * /opt/gitlab/bin/gitlab-rake gitlab:backup:create CRON=1

# systemctl restart crond 重启服务
```

在crontab文件里面，每一行代表一项任务，每行的每个字段代表一项设置，它的格式共分为六个字段，前五段是时间设定段，第六段是要执行的命令段，每个字段之间用空格分割，没用的段用*代替，格式如下：

```bash
m h dom mon dow user command
```

其中：

 - m： 表示分钟，可以是从0到59之间的任何整数。
 - h：表示小时，可以是从0到23之间的任何整数。
 - dom：表示日期，可以是从1到31之间的任何整数。
 - mon：表示月份，可以是从1到12之间的任何整数。
 - dow：表示星期几，可以是从0到7之间的任何整数，这里的0或7代表星期日。
 - user : 表示执行的用户。
 - command：要执行的命令，可以是系统命令，也可以是自己编写的脚本文件(如shell文件)。

### 16.3 恢复实践
Gitlab的恢复只能还原到与备份文件相同的gitlab版本的系统中，恢复时，停止连接到数据库的进程(也就是停止数据的写入服务)，但是保持gitlab是运行的。

```c
# gitlab-ctl stop unicorn
ok: down: unicorn: 1s, normally up
# gitlab-ctl stop sideki
# gitlab-ctl status
run: alertmanager: (pid 11282) 1356s; run: log: (pid 1872) 5129s
run: gitaly: (pid 11298) 1355s; run: log: (pid 1859) 5129s
run: gitlab-monitor: (pid 11338) 1355s; run: log: (pid 1865) 5129s
run: gitlab-workhorse: (pid 11376) 1354s; run: log: (pid 1861) 5129s
run: logrotate: (pid 11387) 1354s; run: log: (pid 1860) 5129s
run: nginx: (pid 11397) 1353s; run: log: (pid 1852) 5129s
run: node-exporter: (pid 11407) 1353s; run: log: (pid 1862) 5129s
run: postgres-exporter: (pid 11508) 1352s; run: log: (pid 1869) 5129s
run: postgresql: (pid 11524) 1351s; run: log: (pid 1847) 5129s
run: prometheus: (pid 11540) 1350s; run: log: (pid 1877) 5129s
run: redis: (pid 11559) 1349s; run: log: (pid 1875) 5129s
run: redis-exporter: (pid 11598) 1349s; run: log: (pid 1870) 5129s
run: sidekiq: (pid 11609) 1346s; run: log: (pid 1878) 5129s
down: unicorn: 29s, normally up; run: log: (pid 1876) 5129s
# 
```

执行恢复操作

```bash
# gitlab-rake gitlab:backup:restore
```

整个恢复执行过程中，可以看到基本是在删除表，创建表

```c
2处需要输入yes
Before restoring the database, we will remove all existing
tables to avoid future upgrade problems. Be aware that if you have
custom tables in the GitLab database these tables and all data will be
removed.

Do you want to continue (yes/no)? yes

 This task will now rebuild the authorized_keys file.
You will lose any data stored in the authorized_keys file.
Do you want to continue (yes/no)? yes
```








