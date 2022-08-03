# 视频


## 1. local-video 插件
local-video 插件[添加链接描述](https://www.npmjs.com/package/gitbook-plugin-local-video)：使用Video.js 播放本地视频

### 1.1 安装

```bash
npm i gitbook-plugin-local-video
```
### 1.2 配置

```bash
"plugins": [ "local-video" ]
```

使用示例：为了使视频可以自适应，我们指定视频的width为100%，并设置宽高比为16:9，如下面所示

```bash
{% raw %}
<video id="my-video" class="video-js" controls preload="auto" width="100%"
poster="https://zhangjikai.com/resource/poster.jpg" data-setup='{"aspectRatio":"16:9"}'>
  <source src="https://zhangjikai.com/resource/demo.mp4" type='video/mp4' >
  <p class="vjs-no-js">
    To view this video please enable JavaScript, and consider upgrading to a web browser that
    <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
  </p>
</video>
{% endraw %}
```

另外我们还要再配置下css，即在`website.css`中加入

```bash
.video-js {
    width:100%;
    height: 100%;
}
```

##  2. html

```bash
<a href="https://www.youtube.com/watch?v=DV72xnlTLd8" target="_blank"><img src="../images/youtube.png" width="250"
alt="IMAGE ALT TEXT HERE" /></a>
```
<a href="https://www.youtube.com/watch?v=DV72xnlTLd8" target="_blank"><img src="https://www.bizhishe.com/d/file/2019-07-14/1563116650252490.jpg" width="250"
alt="IMAGE ALT TEXT HERE" /></a>


##  3. video-player 插件
github:[operatehappy@gitbook-plugin-videoplayer](https://github.com/operatehappy/gitbook-plugin-videoplayer)
功能尝试中
### 3.1 安装

```bash
gitbook install 
```

### 3.2 配置
```bash
{
    "plugins": ["video-player"]
}
```
首先，通过添加以下内容将所需的脚本和样式表添加到您的页面：

```bash
{% videoplayerscripts %}{% endvideoplayerscripts %}
```
您现在可以使用此标签将 MP4 和 WebM 视频添加到您的图书中：

```bash
{% videoplayer id="myvideo" width="640" height="480" posterExt="png" %}https://s3.amazonaws.com/gitbooks/myvideo{% endvideoplayer %}
```
放器将自动加载myvideo.mp4文件以显示 MP4 编码的视频。同样，它将默认myvideo.webm用于 WebM 编码的视频。


##  4. youtube 插件

[youtube](https://www.npmjs.com/package/gitbook-plugin-youtube) 插件是添加youtube视频。

###  4.1 安装

```bash
gitbook install
```
or

```bash
npm i gitbook-plugin-youtube
```
###  4.2 配置

```bash
{
    "plugins": ["youtube"]
}
```

### 4.3 语法

```bash
{% youtube %}
https://www.youtube.com/watch?v=-MdyiRH6OAc&t
{% endyoutube %}
```
###  4.4 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/3c1bdf9e6d0943b68430834f9f546a4c.png)
### 4.5 评论
完美
综合指数：:star::star::star::star::star:
