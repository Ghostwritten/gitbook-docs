#  GitHub 远程删除文件夹

## 方法一
这里以删除 .setting 文件夹为案例

```bash
$ git rm -r --cached  .setting #--cached不会把本地的.setting删除
$ git commit -m 'delete .setting dir'
$ git push -u origin master
```

## 方法二
如果误提交的文件夹比较多，方法一也较繁琐

直接修改.gitignore文件,将不需要的文件过滤掉，然后执行命令

```bash
$ git rm -r --cached .
$ git add .
$ git commit
$ git push  -u origin master
```


