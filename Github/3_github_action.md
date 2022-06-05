# Github Action 快速入门


---
## 1. 简介
[GitHub Actions](https://docs.github.com/cn/actions/quickstart) 是 GitHub 的持续集成服务，于2018年10月推出。

`GitHub Actions` 帮助您自动完成软件开发周期内的任务。 `GitHub Actions` 是事件驱动的，意味着您可以在指定事件发生后运行一系列命令。

工作流程是您添加到仓库的自动化过程。 工作流程由一项或多项作业组成，可以计划或由事件触发。 工作流程可用于在 GitHub 上构建、测试、打包、发布或部署项目。

[GitHub 官方市场](https://github.com/marketplace?type=actions)，我们除了自己编写`action`，也可以借用别人的。

![在这里插入图片描述](https://img-blog.csdnimg.cn/c9bc0fa4bced46faa7509de9a19cdc51.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)


每个 action 就是一个独立脚本，因此可以做成代码仓库，使用`userName/repoName`的语法引用 `action`。比如，`actions/setup-node`就表示`github.com/actions/setup-node`这个仓库，它代表一个 `action`，作用是安装 `Node.js`。事实上，GitHub 官方的 `actions` 都放在 `github.com/actions` 里面。


actions 也有版本的概念，下面都是合法的 action 引用，用的就是 Git 的指针概念，详见[官方文档](https://docs.github.com/en/actions/creating-actions/about-actions#versioning-your-action)。

```bash
actions/setup-node@74bc508 # 指向一个 commit
actions/setup-node@v1.0    # 指向一个标签
actions/setup-node@master  # 指向一个分支
```

##  2. 基础概念

 1. `workflow` （工作流程）：持续集成一次运行的过程，就是一个 workflow。
 2. `job` （任务）：一个 `workflow` 由一个或多个 `jobs` 构成，含义是一次持续集成的运行，可以完成多个任务；
 3. `step`（步骤）：每个 `job` 由多个 `step` 构成，一步步完成。
 4. `action` （动作）：每个 `step` 可以依次执行一个或多个命令（action）。

`GitHub Ac­tions` 为每个任务 (job) 都提供了一个虚拟机来执行，每台虚拟机都有相同的硬件资源：

 - 2-core CPU
 - 7 GB RAM 内存
 - 14 GB SSD 硬盘空间

使用限制：

 - 每个仓库只能同时支持20个 workflow 并行。
 - 每小时可以调用1000次 GitHub API 。
 - 每个 job 最多可以执行6个小时。
 - 免费版的用户最大支持20个 job 并发执行，macOS 最大只支持5个。
 - 私有仓库每月累计使用时间为2000分钟，超过后$ 0.008/分钟，公共仓库则无限制。

操作系统方面可选择 Win­dows server、Linux、ma­cOS，并预装了大量软件包和工具。
虽然名称叫持续集成，但当所有任务终止和完成时，虚拟环境内的数据会随之清空，并不会持续。即每个新任务都是一个全新的虚拟环境。

##  3. workflow 文件
`GitHub Ac­tions` 的配置文件叫做 `work­flow` 文件（官方中文翻译为 “工作流程文件”），存放在代码仓库的`.github/workflows` 目录中。`work­flow` 文件采用 `YAML` 格式，文件名可以任意取，但是后缀名统一为`.yml`，比如 `p3terx.yml`。一个库可以有多个 `work­flow` 文件，GitHub 只要发现`.github/workflows` 目录里面有`.yml` 文件，就会按照文件中所指定的触发条件在符合条件时自动运行该文件中的工作流程。在 Ac­tions 页面可以看到很多种语言的 `work­flow` 文件的模版，可以用于简单的构建与测试。

![在这里插入图片描述](https://img-blog.csdnimg.cn/8107d2ceb69549dcb37d3052dc404c91.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
workflow 文件的配置字段非常多，详见[官方文档](https://docs.github.com/cn/actions)。下面是一些基本字段。




```bash
#name字段是 workflow 的名称。如果省略该字段，默认为当前 workflow 的文件名。
name: GitHub Actions Demo
```

### 3.1 触发事件

```bash
#push事件触发 workflow。
on: push


#on字段也可以是事件的数组。`push`事件或`pull_request`事件都可以触发 `workflow`。
on: [push, pull_request]
```


```bash
#只有`master`分支发生`push`事件时，才会触发 workflow
on:
  push:
    branches:    
      - master
```

```bash
#push tag 时触发
on:
  push:
    tags:
    - 'v*'

#发布 re­lease 触发
on:
  release:
    types: [published]



定时触发
  on:
  schedule:
    - cron:  '0 * * * *'
```

###  3.2 job任务
`workflow` 文件的主体是`jobs`字段，表示要执行的一项或多项任务。
`jobs`字段里面，需要写出每一项任务的`job_id`，具体名称自定义。`job_id`里面的`name`字段是任务的说明。

```bash
#job_id分别是my_first_job和my_second_job
jobs:
  my_first_job:
    name: My first job
  my_second_job:
    name: My second job
```





```bash
#`needs`字段指定当前任务的依赖关系，即运行顺序。`job1`必须先于job2完成，而job3等待`job1`和`job2`的完成才能运行
#因此，这个 workflow 的运行顺序依次为：`job1、job2、job3`。
jobs:
  job1:
  job2:
    needs: job1
  job3:
    needs: [job1, job2]
```

### 3.3 运行主机环境
`runs-on`字段指定运行所需要的虚拟机环境。它是必填字段。目前可用的虚拟机如下。

```bash
ubuntu-latest，ubuntu-18.04或ubuntu-16.04
windows-latest，windows-2019或windows-2016
macOS-latest或macOS-10.14
```

```bash
runs-on: ubuntu-18.04
```



### 3.4 运行步骤

```bash
#`steps`字段指定每个 `Job` 的运行步骤，可以包含一个或多个步骤。每个步骤都可以指定以下三个字段。
jobs.<job_id>.steps.name：步骤名称。
jobs.<job_id>.steps.run：该步骤运行的命令或者 action。
jobs.<job_id>.steps.env：该步骤所需的环境变量。
```

```bash
steps:
 - uses: actions/setup-node@74bc508 # Reference a specific commit
 - uses: actions/setup-node@v1      # Reference the major version of a release
 - uses: actions/setup-node@v1.2    # Reference a minor version of a release
 - uses: actions/setup-node@master  # Reference a branch
```

示例：

```bash
jobs:
    build:
      # Job name is Greeting
      name: Greeting
      # This job runs on Linux
      runs-on: ubuntu-latest
      steps:
        # This step uses GitHub's hello-world-javascript-action: https://github.com/actions/hello-world-javascript-action
        - name: Hello world
          uses: actions/hello-world-javascript-action@v1
          with:
            who-to-greet: 'Mona the Octocat'
          id: hello
        # This step prints an output (time) from the previous step's action.
        - name: Echo the greeting's time
          run: echo 'The time was ${{ steps.hello.outputs.time }}.'
```

### 3.5 引用action

```bash
#public repo
{owner}/{repo}@{ref} or {owner}/{repo}/{path}@{ref}. 


#same repo
  {owner}/{repo}@{ref} or ./path/to/dir

   |-- hello-world (repository)
   |   |__ .github
   |       └── workflows
   |           └── my-first-workflow.yml
   |       └── actions
   |           |__ hello-world-action
   |               └── action.yml

   jobs:
   build:
    runs-on: ubuntu-latest
    steps:
      # This step checks out a copy of your repository.
      - uses: actions/checkout@v1
      # This step references the directory that contains the action.
      - uses: ../github/actions/hello-world-action


#docker container
docker://{image}:{tag}
示例：
  jobs:
  my_first_job:
    steps:
      - name: My first step
        uses: docker://gcr.io/cloud-builders/gradle
      - name: Install Dependencies
        run: npm install
        shell: bash

```
