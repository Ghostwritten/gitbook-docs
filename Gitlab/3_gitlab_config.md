# gitlab 配置

----
相关阅读：

 - [部署gitlab](https://ghostwritten.blog.csdn.net/article/details/121929582)
 - [gitlab-runner部署](https://ghostwritten.blog.csdn.net/article/details/107755143)
 - [Gitlab 基础配置](https://ghostwritten.blog.csdn.net/article/details/121962870)
 - [Create a Continuous Integration (CI) Pipeline in Gitlab](https://blog.csdn.net/xixihahalelehehe/article/details/121941628?spm=1001.2014.3001.5501)
 - [git与gitlab快速学习手册](https://ghostwritten.blog.csdn.net/article/details/121107739)


----
## 1. 邮箱发送短信

```bash
$ docker exec -ti gitlab bash
$ vi /etc/gitlab/gitlab.rb
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp-mail.outlook.com"
gitlab_rails['smtp_port'] = 25
gitlab_rails['smtp_user_name'] = "<xxxx>@outlook.com"
gitlab_rails['smtp_password'] = "<xxxxx>"
gitlab_rails['smtp_domain'] = "outlook.com"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = false

gitlab_rails['gitlab_email_enabled'] = true
gitlab_rails['gitlab_email_from'] = '<xxxx>@outlook.com'
gitlab_rails['gitlab_email_display_name'] = 'Gitlab'

```
保存退出修改，执行命令`gitlab-ctl reconfigure`重新配置gitlab

```bash
$ gitlab-ctl reconfigure
```

执行命令`gitlab-ctl console`测试发邮件，进入控制台之后执行命令


```bash
Notify.test_email('<xxxxxx>@139.com', '邮件标题', '邮件正文').deliver_now
```

```bash
irb(main):001:0> Notify.test_email('<xxxxxx>@139.com', '邮件标题', '邮件正文').deliver_now
Delivered mail 61b9f42db6726_4fc5a503772f@gitlab.example.com.mail (3732.4ms)
=> #<Mail::Message:154720, Multipart: false, Headers: <Date: Wed, 15 Dec 2021 13:57:01 +0000>, <From: Gitlab <zoxun@outlook.com>>, <Reply-To: Gitlab <noreply@gitlab.example.com>>, <To: 13522947651@139.com>, <Message-ID: <61b9f42db6726_4fc5a503772f@gitlab.example.com.mail>>, <Subject: 邮件标题>, <Mime-Version: 1.0>, <Content-Type: text/html; charset=UTF-8>, <Content-Transfer-Encoding: 7bit>, <Auto-Submitted: auto-generated>, <X-Auto-Response-Suppress: All>>
```
![在这里插入图片描述](https://img-blog.csdnimg.cn/288f517f0c6b4393b4d4b353c65aaaf0.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)

## 2. 注册账号
![在这里插入图片描述](https://img-blog.csdnimg.cn/ccaeed5c003545e1b539b9f89c7f657d.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
填写自己的名字、邮箱、密码
![在这里插入图片描述](https://img-blog.csdnimg.cn/8f8fa5815ea34119b08387594974b24f.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
注册后等待管理员验证通过。
![在这里插入图片描述](https://img-blog.csdnimg.cn/78c98781a31e448e9b02589dedb268e1.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)

登陆管理员，找到Admin
![在这里插入图片描述](https://img-blog.csdnimg.cn/276c4667c5ab43e08d9a0fd9c140193e.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
找到管理user的界面
![在这里插入图片描述](https://img-blog.csdnimg.cn/07fbabc1bb984c7496b0310d1af64ba5.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
发现新注册的用户
![在这里插入图片描述](https://img-blog.csdnimg.cn/92df83142e144999b278959ae4d38ed2.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
点击通过或拒绝。
![在这里插入图片描述](https://img-blog.csdnimg.cn/63c8ff4f60bd44cd8bbe2fa25f7e7dcb.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
通过后，你也可以对此用户进行限制访问或删除。
![在这里插入图片描述](https://img-blog.csdnimg.cn/5a3ca6751b854940b3f8f14b3b64280a.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
通过后，租户登陆，选择用户角色
![在这里插入图片描述](https://img-blog.csdnimg.cn/09563114b10d4eba9208539e56b5bdc0.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
创建项目或寻找项目
![在这里插入图片描述](https://img-blog.csdnimg.cn/dc5cab76de1a4cc8ae8a68e8166ec15d.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
与管理员界面的区别缺少admin的权限
![在这里插入图片描述](https://img-blog.csdnimg.cn/6e9038ff546a443c80256216fb60873a.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
回到管理员的user用户管理界面，发现xiaoming已经被激活。
![在这里插入图片描述](https://img-blog.csdnimg.cn/69b226d0be6a441593652b8b0b840f68.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
##  3. 创建项目
第一种
![在这里插入图片描述](https://img-blog.csdnimg.cn/0692fd9ac32849c7b054731a37422a96.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
第二种
![在这里插入图片描述](https://img-blog.csdnimg.cn/580b03edcb1b4d93821bf9681b0cbb41.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
第三种
![在这里插入图片描述](https://img-blog.csdnimg.cn/79cfbf7b845542648e9989788d8b17a3.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
三类项目
空白项目，导入项目，模板项目
###  3.1 创建空白项目
![在这里插入图片描述](https://img-blog.csdnimg.cn/acad65c7524e4bd49656179514bc149d.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/4565ba323ecb42edb21fb64e4354f28e.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/90635ac72d4e411f99b407e74c840da1.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
当我们在点击创建之前，如果点击了“`README`”，如下
![在这里插入图片描述](https://img-blog.csdnimg.cn/5828df8b774c4277872d4f0822a314c1.png)
那创建出来的项目是这样的。
![在这里插入图片描述](https://img-blog.csdnimg.cn/09af3543a76e4f378036bdabf34290ff.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)

### 3.2 创建模板项目
当我们选择模板项目时，会有需要各类开发的模板项目供我们选择。
![在这里插入图片描述](https://img-blog.csdnimg.cn/1c2790ce659249ec85607472672b21f0.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/82fc47f09ecc441f9b1d178fb904e233.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
这个关于`kubernets`的`gitbook`项目
![在这里插入图片描述](https://img-blog.csdnimg.cn/9e9539a19d4c42368130dcc7838e2444.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
我们可以编写自己的`gitbook`了。
###  3.3 导入项目
导入项目，适合以下场景：

 - 项目迁移
 - 借用开源项目定制开发

![在这里插入图片描述](https://img-blog.csdnimg.cn/b5d49c11494c44a78c2e4a4539f353a1.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
我们需要一个`token`,这个`token`来自于你选择的平台，而不是来自自己的`gitlab`平台，我这选择了`github`平台。
![在这里插入图片描述](https://img-blog.csdnimg.cn/092bd971997b4cb5af395b72f714fd2d.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
我们现在去创建`token`，我们 登陆`github`，选择设置“`setting`”
![在这里插入图片描述](https://img-blog.csdnimg.cn/d3e14ade82d44cdea6364da48357e39e.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_9,color_FFFFFF,t_70,g_se,x_16)
找到“`developer settings`”
![在这里插入图片描述](https://img-blog.csdnimg.cn/3f0e2e15a36b4d69a68065c05e0bcf70.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/33d36221db9d43d28c9950bb7875dab8.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
根据兴趣随便取
![在这里插入图片描述](https://img-blog.csdnimg.cn/ac9399914a314e258eb6604d4965eb24.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
我们创建出来了
![在这里插入图片描述](https://img-blog.csdnimg.cn/6a1a76b8a743468184c45d6f350a7f48.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)

复制到gitlab的这里
![在这里插入图片描述](https://img-blog.csdnimg.cn/4e4784c44ad94b188a38c23163f6b86a.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)

获取到我的`github`账号下的项目列表，选择其中一个

![在这里插入图片描述](https://img-blog.csdnimg.cn/74398520eaf24cc19fa17dfc93be4931.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/837d1c769a1b4e649954686a39740f34.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/e4b737b6568b426587b3b5ffd7977000.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
开始导入
![在这里插入图片描述](https://img-blog.csdnimg.cn/34b28a1c4900406c935315fa0b6017c6.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
导入完成。
![在这里插入图片描述](https://img-blog.csdnimg.cn/d5ecb043be344ed78db2ee7c8216564c.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
查看gitlab导入的项目
![在这里插入图片描述](https://img-blog.csdnimg.cn/df340e68606a40439c1963a78ac0841c.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
查看项目内容，然后根据自己的需求开发属于你自己的项目吧。
![在这里插入图片描述](https://img-blog.csdnimg.cn/f44cdc2fb13e4378aeb082d6166372a5.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)

## 4. 删除项目
我们要删除这个项目
![在这里插入图片描述](https://img-blog.csdnimg.cn/ecfe9eef03424ab5945e01c833eea543.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/fd802237fc8a41d3b6fdccf6ea496b84.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
![在这里插入图片描述](https://img-blog.csdnimg.cn/214ab14b5a2546a7ad7f1eab1a875411.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
再次确认
![在这里插入图片描述](https://img-blog.csdnimg.cn/4b9c8eac29d54e0fba30d9ca259e3583.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
我们找不到了`gitlab-example-demo`了
![在这里插入图片描述](https://img-blog.csdnimg.cn/29bbdae0f3124ee48a20b0d89fb601f1.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)
##  5. gitlab项目上传github
github创建一个空项目
![在这里插入图片描述](https://img-blog.csdnimg.cn/b9fac4e6d6124b909e8af1ca4eba54cd.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)

```bash
$ git clone http://gitlab.example.com:8081/root/gitlab-example-demo.git
$ cd gitlab-example-demo
$ git remote -v
origin	http://gitlab.example.com:8081/root/gitlab-example-demo.git (fetch)
origin	http://gitlab.example.com:8081/root/gitlab-example-demo.git (push)
$ git remote add hello https://github.com/Ghostwritten/gitlab-example-demo.git
root@yourdomain:/data/gitlab/projects/gitlab-example-demo# git remote -v
hello	https://github.com/Ghostwritten/gitlab-example-demo.git (fetch)
hello	https://github.com/Ghostwritten/gitlab-example-demo.git (push)
origin	http://gitlab.example.com:8081/root/gitlab-example-demo.git (fetch)
origin	http://gitlab.example.com:8081/root/gitlab-example-demo.git (push)

$ git push -u hello
Username for 'https://github.com': ghostwritten
Password for 'https://ghostwritten@github.com': <access token>
Counting objects: 24, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (22/22), done.
Writing objects: 100% (24/24), 2.36 KiB | 201.00 KiB/s, done.
Total 24 (delta 3), reused 0 (delta 0)
remote: Resolving deltas: 100% (3/3), done.
To https://github.com/Ghostwritten/gitlab-example-demo.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'hello'.

```
![在这里插入图片描述](https://img-blog.csdnimg.cn/efc138591b7948eba18273c9de981fea.png?shadow_50,text_Q1NETiBAZ2hvc3R3cml0dGVu,size_20,color_FFFFFF,t_70,g_se,x_16)

