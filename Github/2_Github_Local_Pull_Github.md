
# Github 托管

## 1 安装与配置
1.win下载git工具：git bash 、git gui 、git cmd 
[https://git-scm.com/downloads](https://git-scm.com/downloads)
linux环境下如果yum源有git包，

```bash
yum -y install git-all.noarch
```

若没有还是去官网下载。


2.打开git bash，执行以下命令，配置git的`用户名`与`邮箱`

```bash
$ git config --global user.name "hanyuntao"
$ git config --global user.email "hanyuntaocn@163.com"
$ git config --list
```

3。 设置`SSH key`（git中sshkey有何作用？）

首先检查是否已生成密钥`cd ~/.ssh`，如果返回的ls有3个文件,则密钥已经生成。

```bash
$ ssh-keygen -t rsa -C "hanyuntaocn@163.com"
```
生成密钥
把`id_rsa.pub`的公钥内容复制 ，然后找到github的用户设置的列表中SSH and GPG keys选项，添加 new SSH key，随便起个名字，粘贴复制公钥。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200401103800121.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3hpeGloYWhhbGVsZWhlaGU=,size_16,color_FFFFFF,t_70)

```bash
ssh -T git@github.com   #远程登录git
```
## 2. 界面创建github
![在这里插入图片描述](https://img-blog.csdnimg.cn/d2878a332369473ebfc24e517f6e7763.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_11,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/575eb1a2d61448d9b8a9993854497d03.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)



## 3 创建仓库上传github或gitlab
非常简单，起名字，描述库的作用功能，设置公有，私有。
是否设置创建README，如果之前没有设置它，上传文件就会报错。
否则执行以下命令：

```bash
git init
echo "# github-roam" >> README.md
git add README.md
git commit -m 'first_commit'
git remote add origin https://github.com/findingsea/myRepoForBlog.git
git push origin master
```

## 4. 上传本地项目到github或gitlab


```c
cd d:test   #某一个文件目录
git init     #初始化为库
git add .   #添加上传内容 ,如果报错，尝试git add --all
git commit -m "test four"    #编写描述内容
git remote  #查看远程主机名（一个远程库伪主机的主机名）
git remote add origin https://github.com/Ghostwritten/tutorial.git   添加远程库名
git push origin master  #推送到库
```

## 5. 解决错误
错误1
```bash
1.To https://github.com/Ghostwritten/test.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'https://github.com/Ghostwritten/test.git'
```

```bash
git push origin master --force   #强制推送到库名下
```

错误2
```bash
git remote add origin https://github.com/findingsea/myRepoForBlog.git，出现错误：
　　fatal: remote origin already exists
```
则执行以下语句：

```bash
git remote rm origin
git remote add origin https://github.com/findingsea/myRepoForBlog.git 
```
错误3
```bash
在执行git push origin master时，报错：
error:failed to push som refs to.......
则执行以下语句：
git pull origin master
先把远程服务器github上面的文件拉先来，再push 上去。
```

可以看到我们的本地项目已经上传到了`github`上了。
