#  Github 创建仓库


##  1. 简介
您可以在 GitHub 仓库中存储各种项目，包括开源项目。 通过开源项目，您可以共享代码以开发更好、更可靠的软件。 您可以使用仓库与他人协作并跟踪您的工作。

##  2. 创建仓库
在任何页面的右上角，使用  下拉菜单选择 `New repository`（新建仓库）。
![在这里插入图片描述](https://img-blog.csdnimg.cn/19875878fe714d96986ed7442780e0cb.png)

为仓库键入简短、令人难忘的名称。 例如 "`hello-world`"。
![在这里插入图片描述](https://img-blog.csdnimg.cn/80fbdf68bba14ba4a01b21e2ce760c71.png)
（可选）添加仓库的说明。 例如，“`我在 GitHub 上的第一个仓库`”。
![在这里插入图片描述](https://img-blog.csdnimg.cn/e7437bd4f3614ec6bd7e64b0cfe2a8b3.png)
选择仓库可见性。
![在这里插入图片描述](https://img-blog.csdnimg.cn/687c2417516342ed883eb9ed01ac586e.png)
选择 Initialize this repository with a `README`
![在这里插入图片描述](https://img-blog.csdnimg.cn/8b0d7d66662b4fa9bb25f10387c8429f.png)
单击 Create repository（创建仓库）。
![在这里插入图片描述](https://img-blog.csdnimg.cn/94879bd73e0448e9907f0f6c084d5e66.png)

##  3. 提交您的第一个更改
创建新仓库时，您使用自述文件对其进行了初始化。 自述文件是详细介绍项目的好工具，您也可以添加一些文档，例如介绍如何安装或使用项目的文档。 自述文件的内容自动显示在仓库的首页上。

在仓库的文件列表中，单击 `README.md`。
![在这里插入图片描述](https://img-blog.csdnimg.cn/d4cc10a117c4495c8a96d5f3527dd397.png)
在 Edit file（编辑文件）选项卡上，键入一些关于您自己的信息。
![在这里插入图片描述](https://img-blog.csdnimg.cn/347868a7c90e4774bbde79cbe32a0d91.png)
在新内容上方，单击 `Preview changes`（预览更改）。
![在这里插入图片描述](https://img-blog.csdnimg.cn/19e483a306b847e4bff90656935850eb.png)
查看您对文件所做的更改。 您将看到绿色的新内容。
![在这里插入图片描述](https://img-blog.csdnimg.cn/b9b56a96a7804e079dc277adfc67f51a.png)
在页面底部，输入一条简短、有意义的提交消息，描述您对文件所作的更改。
![在这里插入图片描述](https://img-blog.csdnimg.cn/a693eee6aca74abb9d4a5fd1a508a892.png)
在提交消息字段下面，确定是要将提交添加到当前分支还是新分支。 如果当前分支是默认分支，则应选择为提交创建新分支，然后创建拉取请求。
![在这里插入图片描述](https://img-blog.csdnimg.cn/15428ea7b73c4d84ad28cf17bcb8bbb6.png)
单击 Propose file change（提议文件更改）。
![在这里插入图片描述](https://img-blog.csdnimg.cn/802955de8d054cc5ad995f8c172a4fe1.png)

##  4. fork 仓库
复刻是仓库的副本。 通过复刻仓库，您可以自由地尝试更改而不会影响原始项目。将其他人的项目用作自己创意的起点。

例如，可以使用复刻提出与修复 Bug 相关的更改。 无需为您发现的漏洞创建议题，您可以：

 - fork 仓库
 - 进行修复
 - 向项目所有者提交拉取请求。

![在这里插入图片描述](https://img-blog.csdnimg.cn/cc15129819074038af544817e2a6741c.png)

##  5. clone 仓库
![在这里插入图片描述](https://img-blog.csdnimg.cn/0d573085e23b4be69534028233968202.png)

命令行

 - 要使用 HTTPS 克隆仓库，在“HTTPS”下单击 。
 - 要使用 SSH 密钥克隆仓库，包括组织的 SSH 认证中心颁发的证书，单击 SSH，然后单击 。
 - 要使用 GitHub CLI 克隆存储库，请单击 GitHub CLI，然后单击。

```bash
git clone https://github.com/Ghostwritten/gitbook-demo.git
```
