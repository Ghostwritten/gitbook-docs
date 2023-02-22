#  gitbook 插件：音乐

@[toc]

##  1. gitbook-plugin-zymplayer 插件

[gitbook-plugin-zymplayer](https://github.com/T-miracle/gitbook-plugin-zymplayer) 插件 可以播放音乐。

###  1.1 配置

```bash
"plugins": [ "zymplayer" ]

"pluginsConfig": {
   "zymplayer": {
     "element": "body", 
     "width": "350px", 
     "mode": "random", 
     "show": "all", 
     "list": {
         "path": "assets/music/musicList.json",
         "height": 180, 
         "expand": true 
     },
     "position": {
         "pos": "fixed", 
         "right": "0px",
         "bottom": "0px" 
         }
   }
}
```
音乐列表存放`musicList.json`、音乐mp3在目录`song`、音乐图片在目录`img`

```bash
$ ls assets/music/
img  musicList.json  song

$ ls assets/music/img/
Angel_Lover-Prendre_sa_main.png  dylanf_卡农.jpg                                Peter_Jeremias-Dusk.jpg  张宇桦_大自然的空气_钢琴曲.jpg  陈光荣_Tanning_In_Your_Sunray.jpg
Denean-Vow_to_Virtue.jpg         Jocelyn_Pook_Russian_Red-Loving_Strangers.jpg  Vexento_Anesthesia.jpg   群星_森林之歌.jpg

$ ls assets/music/song/
Angel_Lover-Prendre_sa_main.mp3  dylanf_卡农.mp3                                Peter_Jeremias-Dusk.mp3  张宇桦_大自然的空气_钢琴曲.mp3  陈光荣_Tanning_In_Your_Sunray.mp3
Denean-Vow_to_Virtue.mp3         Jocelyn_Pook_Russian_Red-Loving_Strangers.mp3  Vexento_Anesthesia.mp3   群星_森林之歌.mp3
```
`musicList.json`内容如下：

```bash
cat  assets/music/musicList.json 
[
    {
        "name": "Tanning In Your Sunray",
        "artist": "陈光荣",
        "url": "assets/music/song/陈光荣_Tanning_In_Your_Sunray.mp3",
        "cover_art_url": "assets/music/img/陈光荣_Tanning_In_Your_Sunray.jpg",
        "duration": "03:38"
    },
    {
        "name": "Prendre sa main",
        "artist": "Angel Lover",
        "url": "assets/music/song/Angel_Lover-Prendre_sa_main.mp3",
        "cover_art_url": "assets/music/img/Angel_Lover-Prendre_sa_main.jpg",
        "duration": "03:31"
    },
    {
        "name": "Vow to Virtue",
        "artist": "Denean",
        "url": "assets/music/song/Denean-Vow_to_Virtue.mp3",
        "cover_art_url": "assets/music/img/Denean-Vow_to_Virtue.jpg",
        "duration": "03:43"
    },

    {
        "name": "Loving Strangers",
        "artist": "Jocelyn Pook Russian Red",
        "url": "assets/music/song/Jocelyn_Pook_Russian_Red-Loving_Strangers.mp3",
        "cover_art_url": "assets/music/img/Jocelyn_Pook_Russian_Red-Loving_Strangers.jpg",
        "duration": "03:43"
    },
    {
        "name": "Dusk",
        "artist": "Peter Jeremias",
        "url": "assets/music/song/Peter_Jeremias-Dusk.mp3",
        "cover_art_url": "assets/music/img/Peter_Jeremias-Dusk.jpg",
        "duration": "02:05"
    },
    {
        "name": "Anesthesia",
        "artist": "Vexento",
        "url": "assets/music/song/Vexento_Anesthesia.mp3",
        "cover_art_url": "assets/music/img/Vexento_Anesthesia.jpg",
        "duration": "03:41"
    },
    {
        "name": "森林之歌",
        "artist": "群星",
        "url": "assets/music/song/群星_森林之歌.mp3",
        "cover_art_url": "assets/music/img/群星_森林之歌.jpg",
        "duration": "02:04"
    },

    {
        "name": "张宇桦_大自然的空气_钢琴曲",
        "artist": "张宇桦_大自然的空气_钢琴曲",
        "url": "assets/music/song/张宇桦_大自然的空气_钢琴曲.mp3",
        "cover_art_url": "assets/music/img/张宇桦_大自然的空气_钢琴曲.jpg",
        "duration": "02:22"
    },
    {
        "name": "卡农",
        "artist": "dylanf",
        "url": "assets/music/song/dylanf_卡农.mp3",
        "cover_art_url": "assets/music/img/dylanf_卡农.jpg",
        "duration": "05:00"
    }
]

```

###  1.2 安装

```bash
gitbook install 
```
###  1.3 效果
![在这里插入图片描述](https://img-blog.csdnimg.cn/f5d6bc57a2c648979b72ec8f97ff697e.gif#pic_center)
###  1.4 评论
插件效果很好，但存在bug，影响logo暂时，子目录下拉显示等等。
综合指数：:star::star::star:
