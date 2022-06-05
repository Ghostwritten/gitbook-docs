#  Gitlab 创建持续集成 (CI) Pipeline


## 1.简介
![在这里插入图片描述](https://img-blog.csdnimg.cn/cfcc7940ded7470486bee77a1b8a96a8.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/011844e732354657a55b1ae97b463b20.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/bf35723d90c243afa411f19c3cb13242.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/f686fc2df7ec434c909000b5a56363d0.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/9586c66a923d4b399ee4e2240b6d0f21.png?x-oss-process=image/watermark,type_d3F5LXplbmhlaQ,shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
## 2.CI demo
###  2.1 python demo
vscode创建一下目录和文件
![在这里插入图片描述](https://img-blog.csdnimg.cn/b2d247d7452a4735826a7848a7cbe194.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_15,color_FFFFFF,t_70,g_se,x_16)
内容：
test_functions.py

```bash
from app.functions import sum

def test_sum():
    assert add(1, 10) == 11
```
functions.py

```bash
def add(a, b):
    return a + b
```

安装测试工具
```bash
$ pip3 install pipenv
Installing collected packages: virtualenv
  WARNING: Failed to write executable - trying to use .deleteme logic
ERROR: Could not install packages due to an OSError: [WinError 2] 系统找不到指定的文件。: 'C:\\Python310\\Scripts\\virtualenv.exe' -> 'C:\\Python310\\Scripts\\virtualenv.exe.deleteme'

#尝试 
pip3 install pipenv --user
Requirement already satisfied: pipenv in c:\python310\lib\site-packages (2021.11.23)
Requirement already satisfied: setuptools>=36.2.1 in c:\python310\lib\site-packages (from pipenv) (57.4.0)
Requirement already satisfied: pip>=18.0 in c:\users\xh\appdata\roaming\python\python310\site-packages (from pipenv) (21.3.1)
Requirement already satisfied: virtualenv-clone>=0.2.5 in c:\python310\lib\site-packages (from pipenv) (0.5.7)  
Requirement already satisfied: certifi in c:\users\xh\appdata\roaming\python\python310\site-packages (from pipenv) (2021.10.8)
Requirement already satisfied: virtualenv in c:\python310\lib\site-packages (from pipenv) (20.10.0)
Requirement already satisfied: six<2,>=1.9.0 in c:\python310\lib\site-packages (from virtualenv->pipenv) (1.16.0)
Requirement already satisfied: distlib<1,>=0.3.1 in c:\python310\lib\site-packages (from virtualenv->pipenv) (0.3.4)
Requirement already satisfied: backports.entry-points-selectable>=1.0.4 in c:\python310\lib\site-packages (from 
virtualenv->pipenv) (1.1.1)
Requirement already satisfied: filelock<4,>=3.2 in c:\python310\lib\site-packages (from virtualenv->pipenv) (3.4.0)
Requirement already satisfied: platformdirs<3,>=2 in c:\python310\lib\site-packages (from virtualenv->pipenv) (2.4.0)


$ pipenv
bash: pipenv: command not found

#尝试
$ python -m pipenv

#安装pytest
$ python -m pipenv install pytest
Creating a virtualenv for this project...
Pipfile: D:\gitlab\Pipfile
Using C:/Python310/python.exe (3.10.0) to create virtualenv...
[   =] Creating virtual environment...created virtual environment CPython3.10.0.final.0-64 in 6580ms
  creator CPython3Windows(dest=C:\Users\XH\.virtualenvs\gitlab-DBb610So, clear=False, no_vcs_ignore=False, global=False)
  seeder FromAppData(download=False, pip=bundle, setuptools=bundle, wheel=bundle, via=copy, app_data_dir=C:\Users\XH\AppData\Local\pypa\virtualenv)
    added seed packages: pip==21.3.1, setuptools==58.3.0, wheel==0.37.0
  activators BashActivator,BatchActivator,FishActivator,NushellActivator,PowerShellActivator,PythonActivator    

Successfully created virtual environment!
Virtualenv location: C:\Users\XH\.virtualenvs\gitlab-DBb610So
Creating a Pipfile for this project...
Installing pytest...
Adding pytest to Pipfile's [packages]...
Installation Succeeded
Pipfile.lock not found, creating...
Locking [dev-packages] dependencies...
Locking [packages] dependencies...
           Building requirements...
Resolving dependencies...
Success!
Updated Pipfile.lock (99a583)!
Installing dependencies from Pipfile.lock (99a583)...
  ================================ 0/0 - 00:00:00
To activate this project's virtualenv, run pipenv shell.
Alternatively, run a command inside the virtualenv with pipenv run.


$ python -m pipenv shell
Launching subshell in virtual environment...

clear
```
创建结构文件`__init__.py`
![在这里插入图片描述](https://img-blog.csdnimg.cn/9cbd3383ff1b4bafbadce7e0667bfa43.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_15,color_FFFFFF,t_70,g_se,x_16)
测试
```bash
$ python -m pytest
============================================= test session starts =============================================
platform win32 -- Python 3.10.0, pytest-6.2.5, py-1.11.0, pluggy-1.0.0
rootdir: D:\gitlab\gitlab_example_en
collected 0 items / 1 error

=================================================== ERRORS ====================================================
__________________________________ ERROR collecting tests/test_functions.py ___________________________________ 
ImportError while importing test module 'D:\gitlab\gitlab_example_en\tests\test_functions.py'.
Hint: make sure your test modules/packages have valid Python names.
Traceback:
C:\Python310\lib\importlib\__init__.py:126: in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
tests\test_functions.py:1: in <module>
    from app.functions import sum
E   ImportError: cannot import name 'sum' from 'app.functions' (D:\gitlab\gitlab_example_en\app\functions.py)   
=========================================== short test summary info =========================================== 
ERROR tests/test_functions.py
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Interrupted: 1 error during collection !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
============================================== 1 error in 0.14s =============================================== 
```
没通过

修改内容
test_functions.py

```bash
from app.functions import add

def test_add():
    assert add(1, 10) == 11
```
测试

```bash
$ python -m pytest
============================================= test session starts =============================================
platform win32 -- Python 3.10.0, pytest-6.2.5, py-1.11.0, pluggy-1.0.0
rootdir: D:\gitlab\gitlab_example_en
collected 1 item                                                                                                

tests\test_functions.py .                                                                                [100%]

============================================== 1 passed in 0.03s ==============================================
```
测试通过

### 2.2 部署gitlab

 - [docker部署gitlab](https://ghostwritten.blog.csdn.net/article/details/121929582)
 - [配置本地与gitlab互信](https://blog.csdn.net/xixihahalelehehe/article/details/105240194?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522163958422116780271511591%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fblog.%2522%257D&request_id=163958422116780271511591&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~blog~first_rank_v2~rank_v29-2-105240194.pc_v2_rank_blog_default&utm_term=gitlab&spm=1018.2226.3001.4450)

登陆gitlab，创建一个空项目`gitlab-example-demo`
![在这里插入图片描述](https://img-blog.csdnimg.cn/a1489577c38c4195a12f59809370efd1.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)

在vscode中的终端`gitlab-example-en`目录执行：
```bash
$ git config --global user.name "Administrator"
$ git config --global user.email "admin@example.com"
$ ssh-keygen -t rsa -C "admin@example.com"
$ cat /c/Users/XH/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtv5pEPO+Esp14+bztwrq9dM4hD8rUF/Du/1tM6l2fKAgpmFoqM3OhMv9D/x7+94AL2+GUPJ5HPqbCDwzGRfUnLi02RnAHXij3+H/ZRzceCEBlCMvqx//+g/fmtYHdDxKlOcjfxlT4aAytKmRtpYPKIzzHd/lwMWtxpgHvnr+gOM6s67eVabOPlH6iyi7UyIoCy5Xg/wg5IDXFCSGfw3FSZS9EaDdWTTfntwGX7jnX3cEiY/kphKC7dvai3B/YUyx6ioZBgTeBN1aakMkaSiyRMEeQ4HmDI4QogiqHMgTNJCiUq5oiDf0JMwrW/m/IJnZemq4W1cheegaxvJKraJFWoIBp6/AOjisjZrMAbZbrpFDLzvsMJcqDgHSLjQd1hXMaLvR1K9JfYKwsjGzR8XaoKRW1742BbtqLq46qmzqW0pHpShGMmbeALAJMvjRqOG7MuTKcVe2CWyfX7QrIFxVucZ0tijlLMjuqZquUnVjsYm+SUujevm7h+IW09esL7j8= admin@example.com

```
赋值`/c/Users/XH/.ssh/id_rsa.pub`到gitlab的ssh_key,如图
![/c/Users/XH/.ssh/id_rsa.pub](https://img-blog.csdnimg.cn/9aaf21b857a14c0a95a87edd285f7d60.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_11,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/08dcd4b2662c4090b6e32ed783a4f70f.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
### 2.3 项目上传gitlab

初始化本地项目，开始上传gitlab仓库
```bash
$ git init
$ git commit -m "add a new demo"
git remote add origin http://192.168.211.70:8081/root/gitlab-example-demo.git
$ git push -u origin master
Username for 'http://192.168.211.70:8081': root
Password for 'http://root@192.168.211.70:8081': 
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (7/7), 525 bytes | 262.00 KiB/s, done.
Total 7 (delta 0), reused 0 (delta 0)
To http://192.168.211.70:8081/root/gitlab-example-demo.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.
```
上传成功
![在这里插入图片描述](https://img-blog.csdnimg.cn/c9aedb6dd07d4e41b9a4574d6ba456d7.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)

###  2.4 编排.gitlab-ci.yaml
如果在gitlab运行自动化测试，需要用到`.gitlab-ci.yaml`，下面我们开始编写

```bash
$ cat .gitlab-ci.yaml
stages:
  - test

python_tests:
  image: python:3.9
  stage: test
  script:
    - pip3 install pipenv
```

```bash
$ git add .
$ git commit -m "add .gitlab-ci.yaml"
$ git push
```
当我们推送到`gitlab`发现项目无法运行自动测试。我们查明原因
![在这里插入图片描述](https://img-blog.csdnimg.cn/27431d3a8f4a4be6a1211209d32e3738.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/38265afeb1ef4c23961f455543209ae5.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/4148370c9dca4410a966d8601809ac4e.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/aa7640bdf7a4401bac2f91b7293e073a.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)

###  2.5. 部署gitlab-runner
我们原来缺少一个 action runners，也就是`gitlab-runner`
[官方安装gitlab-runner](https://docs.gitlab.com/runner/install/docker.html)

我们可以用一个小的镜像`gitlab/gitlab-runner:alpine-v14.4.2`
```bash
 docker run -d --name gitlab-runner --restart always --net=host \
     -v /srv/gitlab-runner/config:/etc/gitlab-runner \
     -v /var/run/docker.sock:/var/run/docker.sock \
     gitlab/gitlab-runner:alpine-v14.4.2
```

[注册runner](https://docs.gitlab.com/runner/register/index.html#docker)

```bash
$ docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner:alpine-v14.4.2 register
Runtime platform                                    arch=amd64 os=linux pid=7 revision=50fc80a6 version=14.4.2
Running in system-mode.                            
                                                   
Enter the GitLab instance URL (for example, https://gitlab.com/):
http://192.168.211.70:8081
Enter the registration token:
6D5mo8iWCLBaVdqcaqjN
Enter a description for the runner:
[329b671ffa00]: gitlab-example
Enter tags for the runner (comma-separated):

Registering runner... succeeded                     runner=6D5mo8iW
Enter an executor: ssh, virtualbox, docker+machine, shell, docker-ssh+machine, kubernetes, custom, docker, docker-ssh, parallels:
docker
Enter the default Docker image (for example, ruby:2.6):
ubuntu:20.04
Runner registered successfully. Feel free to start it, but if it's running already the config should be automatically reloaded! 
```
注册完成后，gitlab界面检查`gitlab-runner`是否注册成功
![在这里插入图片描述](https://img-blog.csdnimg.cn/50cfdba4a3ba4da2b15979b81ee8de43.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/e0f8e65c7633480faada8f9ab19be308.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
绿色代表成功，回到项目界面，已经开始在跑了。

### 2.6 测试跑起来
![在这里插入图片描述](https://img-blog.csdnimg.cn/4133c9b6a692403fa16977cd891829c6.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/2ba5d5c0cf4641e6b67598fb4880c6d6.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/4c877e2dcf244632b2aca060259b9930.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/e758bd464bb94bb2ac478b29b7ede5c2.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/96c65c75cceb4c768cb2d83d18e6f40e.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)

### 2.7 CI变得更安全

![在这里插入图片描述](https://img-blog.csdnimg.cn/7332937dee8143aab1231d7447adfaa3.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)

创建普通用户

```bash
apt-get update && apt-get upgrade
useradd -m -s /bin/bash youtube
passwd youtube
usermod -aG sudo youtube
```
禁用关于root用户ssh的根访问

```bash
$ su - youtube
$ vim /etc/ssh/sshd_config
PermitRootLogin no


$ systemctl restart ssh
$ ssh root@192.168.211.70（拒绝）
```
安装Docker
```c
ssh-copy-id youtube@server-IP
apt-get install -y docker.io
#当前用户授权
usermod -aG docker $USER
docker ps
docker run hello-world
```
在youtube用户下重新运行部署新的`gitlab-runner`并注册，继续测试。

-----


<font color=	#3CB371 size=4>视频</font>：[https://mp.weixin.qq.com/s/NKgpZ1CCybkrNakZIlN-Ng](https://mp.weixin.qq.com/s/NKgpZ1CCybkrNakZIlN-Ng)

<font color=	#FF4500 size=4>原创</font>：[https://www.youtube.com/watch?v=6QtJDaycUwA](https://www.youtube.com/watch?v=6QtJDaycUwA)

<font color=	#000000 size=4>github</font>：[https://github.com/Ghostwritten/gitlab-example-demo.git](https://github.com/Ghostwritten/gitlab-example-demo.git)

<font color=	#1E90FF size=4>更多阅读</font>：

 - [部署gitlab ](https://ghostwritten.blog.csdn.net/article/details/121929582)
 - [gitlab-runner部署](https://ghostwritten.blog.csdn.net/article/details/107755143)
 - [Gitlab 基础配置](https://ghostwritten.blog.csdn.net/article/details/121962870)
 - [Create a Continuous Integration (CI) Pipeline in Gitlab](https://blog.csdn.net/xixihahalelehehe/article/details/121941628?spm=1001.2014.3001.5501)
 - [git与gitlab快速学习手册](https://ghostwritten.blog.csdn.net/article/details/121107739)
