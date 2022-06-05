# Gitlab Runner 部署

## 1. 本地安装gitlab-runner

```bash
$ wget -O /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64

$ curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | sudo bash
$ yum install gitlab-runner
$ systemctl status gitlab-runner
$ sudo chown -R gitlab-runner:gitlab-runner /var/run/docker.sock
$ sudo su - gitlab-runner
```
当然，我们可以安装官方的方法安装，从gitlab就可以找到简洁的安装方式：
![在这里插入图片描述](https://img-blog.csdnimg.cn/3902d2228eed4ecdaf460b91f3342e45.png)
![在这里插入图片描述](https://img-blog.csdnimg.cn/4a60626a209743b390999096ea3ceeec.png)


## 2. 项目通过本地命令注册runner
1 输入如下命令

```bash
$ sudo gitlab-runner register
```

2 输入gitlab地址
地址可以从项目中获取到
这个页面会获取到地址和token，下面用到
3 输入token，就是截图里的token
4 输入对Runner的描述，这个在GitLab’s UI可以修改，比如my-runner
5 给Runner打个标签，这个在GitLab’s UI可以修改，比如java
6 是否Runner执行没有标签的构建任务，输入true
7 是否将Runner锁定到当前项目，这个在GitLab’s UI可以修改，输入true
8 输入Runner的执行者，这里我选择shell
这样我们就配置好了Runner
当我们有代码提交的时候，Runner就会执行.gitlab-ci.yml的构建任务

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200803015419937.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3hpeGloYWhhbGVsZWhlaGU=,size_16,color_FFFFFF,t_70)

## 3. docker安装gitlab-runner

```bash
docker run -d --name gitlab-runner --restart always --net=host \
     -v /srv/gitlab-runner/config:/etc/gitlab-runner \
     -v /var/run/docker.sock:/var/run/docker.sock \
     gitlab/gitlab-runner:latest
```
您可以使用配置容器来挂载您的自定义数据卷

```bash
docker volume create gitlab-runner-config
docker run -d --name gitlab-runner --restart always --net=host \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v gitlab-runner-config:/etc/gitlab-runner \
    gitlab/gitlab-runner:latest
```



## 4. 项目通过docker注册runner

```bash
$ docker run --rm --net=host -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner:alpine-v14.4.2 register
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
我们选择的执行器是docker，那么关于这个项目，编写`.gitlab-ci.yml`就要一定docker执行的规则去执行。
注册配置内容我可以在这里看到。并根据需求做一些小的变动。

```bash
$ docker exec -ti gitlab-runner bash
$ cat /etc/gitlab-runner/config.toml 
concurrent = 1
check_interval = 0

[session_server]
  session_timeout = 1800

[[runners]]

[[runners]]
  name = "demo"
  url = "http://gitlab.example.com:8081/"
  token = "PF41kT9ZV_1DoT6VzcCu"    #这里的token，并不是registration token的token。
  executor = "docker"
  [runners.custom_build_dir]
  [runners.cache]
    [runners.cache.s3]
    [runners.cache.gcs]
    [runners.cache.azure]
  [runners.docker]
    extra_hosts = ["gitlab.example.com:192.168.211.70"]
    tls_verify = false
    image = "ubuntu:20.04"
    privileged = false
    disable_entrypoint_overwrite = false
    oom_kill_disable = false
    disable_cache = false
    volumes = ["/cache"]
    shm_size = 0
    dns = ["8.8.8.8", "1.1.1.1"]
```

执行器选择是多种样的，我们当然也可以多个选择。通过多次注册的方式。
我尝试再次注册一次。

```bash
docker run  --net=host --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner:alpine-v14.4.2 register
Runtime platform                                    arch=amd64 os=linux pid=11 revision=50fc80a6 version=14.4.2
Running in system-mode.                            
                                                   
Enter the GitLab instance URL (for example, https://gitlab.com/):
http://gitlab.example.com:8081
Enter the registration token:
6D5mo8iWCLBaVdqcaqjN
Enter a description for the runner:
[yourdomain.com]: gitlab-demo
Enter tags for the runner (comma-separated):
gitlab-demo-shell
Registering runner... succeeded                     runner=6D5mo8iW
Enter an executor: docker, docker-ssh, shell, docker+machine, custom, parallels, ssh, virtualbox, docker-ssh+machine, kubernetes:
shell
Runner registered successfully. Feel free to start it, but if it's running already the config should be automatically reloaded! 
```
这次的执行器是shell。

![在这里插入图片描述](https://img-blog.csdnimg.cn/9756f2cbe01a4007ae0def9ee277d403.png)


登陆gitlab查看runner的列表，多出一个runner
![在这里插入图片描述](https://img-blog.csdnimg.cn/fd208ec809c841aba064067dd9d56057.png)
查看`runner`配置

```bash
$ docker exec -ti gitlab-runner bash
$ cat /etc/gitlab-runner/config.toml 
concurrent = 1
check_interval = 0

[session_server]
  session_timeout = 1800

[[runners]]
  name = ""
  url = ""
  token = ""
  executor = ""

[[runners]]
  name = "demo"
  url = "http://gitlab.example.com:8081/"
  token = "PF41kT9ZV_1DoT6VzcCu"
  executor = "docker"
  [runners.custom_build_dir]
  [runners.cache]
    [runners.cache.s3]
    [runners.cache.gcs]
    [runners.cache.azure]
  [runners.docker]
    tls_verify = false
    image = "ubuntu:20.04"
    dns = ["8.8.8.8", "1.1.1.1"]
    privileged = false
    disable_entrypoint_overwrite = false
    oom_kill_disable = false
    disable_cache = false
    volumes = ["/cache"]
    extra_hosts = ["gitlab.example.com:192.168.211.70"]
    shm_size = 0

[[runners]]
  name = "gitlab-demo"
  url = "http://gitlab.example.com:8081"
  token = "TX1s_ZQ1RnNj5xaVW-y9"
  executor = "shell"
  [runners.custom_build_dir]
  [runners.cache]
    [runners.cache.s3]
    [runners.cache.gcs]
    [runners.cache.azure]
```
关于一个项目我们通过多次注册编排，选择不同执行器编排`.gitlab-ci.yml`,比如，你可能需要这个应用暂时本地运行，后来docker运行，再后来kubernets运行等等。

##  5. 注意
不同的项目向runner注册的token是不一样的。
![在这里插入图片描述](https://img-blog.csdnimg.cn/278c067b20a44a53a6162d3125b74ccd.png)
![在这里插入图片描述](https://img-blog.csdnimg.cn/c6f01e1fbfac4906a8f16681392cb103.png)
我们可以在根据自己的业务应用需求在多个机器运行多个`gitlab-runner`。

