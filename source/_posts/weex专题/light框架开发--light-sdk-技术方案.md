---
title: light框架开发--light-sdk-技术方案
date: 2020-05-26 10:55:48
categories:
- weex专题
---
#### 1、快速搭建light并运行demo
按照命令顺序执行
```bash
##不容许中文路径
#1 、安装light
$ npm install -gd lighting  #安装light
$ light -h #查看版本

#2、创建项目APP （注意此处操作!!!）
$ light create -t app <folder>  # app类型项目
$ cd <folder>
 
#3、安装light-sdk
$ cd lib
$ npm install -d –save light-sdk

对 lib 目录下的 package.json 文件进行设置，引入依赖：
{
  "dependencies": {
    "light-sdk": "*"
  }
}
然后在 lib 目录下执行 npm install 完成安装。
npm install

# 4、本地运行基础模板
$ light release -wb
#自动唤起http://172.20.16.111:3000/#/index/home

# 5、安装imagemagick
brew install ghostscript
sudo chown -R `whoami`:admin /usr/local/share
brew link --overwrite ghostscript
监测安装
gs -v

brew install imagemagick
brew link libpng

#打包部署发布
light release -p 

将生成的压缩包 解压改名为www，拷贝到项目中asset中
```

客户端工具
win64
[LightViewPC-beta3-win32-x64](https://res.lightyy.com/lightview-pc/lightview-win32-x64.zip)
mac
[LightViewPC-beta3-MAC](https://res.lightyy.com/lightview-pc/lightview-darwin-x64.zip)

设备助手LightView

lightView是一个APP，支持开发者在不需要证书、不需要安装的前提下，使用设备进行APP测试、问题反馈。

下载地址
*   IOS系统：App Store直接搜索“lightView”下载
*   [安卓系统点击打开链接扫码下载](https://app.lightyy.com/appDist/ShowSoloApp?appName=com.hundsun.light.lightIn.appstore)

####2、操作过程具体细节
* 安装恒生lighting
```
npm install -gd lighting
# OR 
npm install -gd lighting --registry=https://registry.npm.taobao.org
```
* 查看 当前工具版本
```
$ light -h
```

```

    
     _  _         _      _    _               
    | |(_)       | |    | |  (_)              
    | | _   __ _ | |__  | |_  _  _ __    __ _ 
    | || | / _` || '_ \ | __|| || '_ \  / _` |
    | || || (_| || | | || |_ | || | | || (_| |
    |_||_| \__, ||_| |_| \__||_||_| |_| \__, |
            __/ |                        __/ |
           |___/                        |___/      CLI 1.15.5


    
    Usage: 

    $ light <command> [options]  [-h]

        create...........................生成工程的基本目录结构和模板文件
        gen..............................代码生成
        install..........................安装项目依赖和插件       
        release..........................代码的集成打包
        server...........................内置HTTP服务器
        plugin...........................插件的安装卸载更新
        login............................登录账户链接light平台的账户系统以进行应用管理

    Project Commands:
        
        You are not in a project directory
	
```

客户端工具
win64
[LightViewPC-beta3-win32-x64](https://res.lightyy.com/lightview-pc/lightview-win32-x64.zip)
mac
[LightViewPC-beta3-MAC](https://res.lightyy.com/lightview-pc/lightview-darwin-x64.zip)

常用命令
```
light release -wb //编译并开启浏览器预览，监听变化
 
light release -ucsp //打包，压缩混淆代码，添加反缓存后缀，合并请求

light server --debug //开启调试模式
```

* web 项目创建（此处是web项目创建）

```
//创建H5项目
$ light create <folder>
$ cd <folder>
```

生成项目
```
.
├── app.js
├── app.less
├── css
│   ├── reset.css
│   └── style.less
├── images
│   ├── about-active.png
│   ├── about.png
│   ├── contact-active.png
│   ├── contact.png
│   ├── home-active.png
│   ├── home.png
│   ├── more.png
│   └── scan.png
├── index.html
├── lib
│   ├── package.json
│   └── px2rem.js
├── project.json
├── ui
│   └── ui.vue
└── view
    ├── index
    │   ├── about.vue
    │   ├── contact.vue
    │   └── home.vue
    └── index.vue
```

运行基础模板
light release -wb

自动唤起`http://172.20.16.111:3000/#/index/home`

```
启动不同环境
light release -wb --env product 
或者 
light release -wb --env uat
```

打包部署
```
light release -p --product
```

目录规范
![](https://upload-images.jianshu.io/upload_images/5526061-898002df25e347bf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

project.json
```
{
  "project":"lightProject",
  "version":"0.0.1",
  "desc":"Just For Fun",
  "type":"vue",
  "link_id":"",
  "plugins":[],
  "pluginConfig":{
    "proxy":{},
    "native":{},
  },
  "env":{
    "default":{
      "log_level":"debug"
    },
    "product":{
      "log_level":"error"
    }
  }
}
```

工程类型 project.json
APP配置
```
project.json
{
  "type":"vue",
  "plugins":["native"],
}
```
JSNative工程
```
project.json
{
  "type":"vue",
  "plugins":["jsnative"],
}
```
H5模块
```
{
  "type":"vue",
  "plugins":[],
}
```

Light生命周期
![light生命周期](https://upload-images.jianshu.io/upload_images/5526061-442086b9518e39b3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![light视图生命周期](https://upload-images.jianshu.io/upload_images/5526061-d6f4fc884f147d90.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


应用启动入口 app.js 注册全局监听、事件、拦截器
```
import App from "light"

App.filter("start",function (next) {
    //启动拦截器
    App.log("app started...");
    next();
}).filter("route",function (from, to, next) {
    //视图拦截器
    App.log(`view changed:${from.path}--${to.path}`);
    next()
}).start();
```

逻辑模块化
声明
```
// common.js
function sayHello(name) {
  console.log(`Hello ${name} !`)
}
function sayGoodbye(name) {
  console.log(`Goodbye ${name} !`)
}

module.exports.sayHello = sayHello
exports.sayGoodbye = sayGoodbye
```
引入
```
const common = require('common.js')
common.sayHello('MINA')
```
宿主环境
![](https://upload-images.jianshu.io/upload_images/5526061-8c3d7ea3c2dcfc35.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

LightAPP开发
配置native/config.js 

First 
安装 imagemagick
```Mac
brew install ghostscript
sudo chown -R `whoami`:admin /usr/local/share
brew link --overwrite ghostscript
监测安装
gs -v

brew install imagemagick
brew link libpng
测试
convert -density 72 a.pdf a.png

```

***特别注意：ImageMagick不能安装到中文路径下***

###第一步：创建做包工程

使用指令`light create -t app`创建做包工程。

###第二步：编辑菜单及配置文件

编辑`native`目录下的资源文件，如`native/config.js`定义整包配置项目。

### 第三步：打包及上传

使用`light release -p`指令做打包操作，将打包zip包上传到平台对应应用的条目内。

###第四步：在平台集成出安装包

使用平台的`在线构建编译`能力输出可安装的安装包。


#### 编写简单测试demo

* 1、light平台注册账号
* 2、快速引导
```
//创建demo程序
light create -t app  demo
//本地调试运行
light release -wb
//发布zip包
light release -p
```

#### 参考链接
npm下载地址
https://www.npmjs.com/package/light-sdk

恒生light框架
http://document.lightyy.com/zh-cn/docs

恒生npm开发者主页
https://www.npmjs.com/~hslight
