# gitbook 插件 pdf


## 1. pdf 插件
### 1.1 安装

```bash
$ npm install gitbook-pdf -g
```

### 1.2 导出 pdf

```bash
$ gitbook pdf ./my_repository
```

##  2. pdf-multi-link 插件
[pdf-multi-link](https://www.npmjs.com/package/gitbook-plugin-pdf-multi-link) 插件在每个页面上添加一个链接以下载 PDF。
###  2.1 安装

```bash
npm i gitbook-plugin-pdf-multi-link
```
###  2.2 配置

```bash
{
  "plugins": ["pdf-multi-link"],
  "pluginsConfig": {
    "download-pdf-link": {
      "base": "https://www.gitbook.com/book/poppy-project/poppy-docs/",
      "label"
      }: {
          "en": "Download PDF",
          "fr": "Télécharger le PDF"
      }
    }
  }
}
```

```bash
{
  "plugins": ["pdf-multi-link"],
  "pluginsConfig": {
    "download-pdf-link": {
      "base": { 
        "en":"https://www.gitbook.com/book/poppy-project/poppy-docs/en.pdf",
        "fr":"https://www.gitbook.com/book/poppy-project/poppy-docs/fr.pdf",
      },
      "label"
      }: {
          "en": "Download PDF",
          "fr": "Télécharger le PDF"
      }
    }
  }
}
```
###  2.3 效果
（略）


##  3. download-pdf-link 插件
[download-pdf-link](https://www.npmjs.com/package/gitbook-plugin-download-pdf-link) 插件在每个页面上添加一个链接以下载 PDF。
###  3.1 安装

```bash
npm i gitbook-plugin-download-pdf-link
```
or
```bash
gitbook install 
```

### 3.2 配置

```bash
{
  "plugins": ["download-pdf-link"],
  "pluginsConfig": {
    "download-pdf-link": {
      "base": "https://www.gitbook.com/book/poppy-project/poppy-docs/",
      "label": {
          "en": "Download PDF",
          "fr": "Télécharger le PDF"
      }
    }
  }
}
```

### 3.3 效果
（略）
