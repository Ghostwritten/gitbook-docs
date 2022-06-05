# git 回滚

 查看所有commits记录

```bash
$ git log
commit 261bbc7e909c37b877595560bb04613961d8ce81
Author: xxx xxx@.com
Date:   Mon Mar 9 15:15:29 2020 +0800

    update tomcat 7.0.90

commit 292dea9cedcf6f830eb166a3907f75eec6878a45
Author:xxx xxx@.com
Date:   Mon Mar 9 14:08:28 2020 +0800

    update start-managaer.sh and start.sh

```

gitlab回退到某次commit

```bash
$ git reset --hard 292dea9cedcf6f830eb166a3907f75eec6878a45
```
强制重新提交

```bash
$ git push origin master --force 
```
