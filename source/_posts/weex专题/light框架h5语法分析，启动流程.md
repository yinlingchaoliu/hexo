---
title: light框架h5语法分析，启动流程
date: 2020-05-26 10:55:48
categories:
- weex专题
---
####1、思路
我们对新接手的light框架整体性掌握，快速熟悉对应的配置有利于快速开发
####2、目录分析

![](https://upload-images.jianshu.io/upload_images/5526061-db667a9fa50879a9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

***H5按照顺序加载***
######  project.json  应用配置
```
//原生项目
{    "type": "vue",
    "plugins": [
        "jsnative"
    ],
    "env": {
        "product": {
            "appBaseUrl": "xxxx/appServer/" //默认地址
        }
    }
}
```
网络地址配置
appBaseUrl

####H5启动

###### index.html  应用运行入口
```html
<html>
    <head>
        <title>和信基金</title>
        <style/>
        <link rel="stylesheet" href="./css/web.css">
    </head>
	<body>
		<div class="wxmask"></div>
		<div id="main">
			<view id="index" /> //页面挂载
                       <view id="login" parent="index" async="true" />
                      <view id="home" home="true" parent="index" async="true"/>
                 </div>
                <script src="app.js"></script>
	</body>
<html>
```
代码分析
1、编写一个页面需要在main下注册
      页面卸载view对应目录下
2、全局css  css/web.css
3、app.js 是应用的主入口

###### app.js 应用主入口全局通用逻辑
```
import App from "light"
import service from '@/service/plugin';
App.Vue.use(service);

App.filter("start",function (next) {
    //启动拦截器
    App.log("app started...");
	// 加载配置文件
    service.load('./static/config.json').then(next)
}).filter("route",function (from, to, next) {
    //视图拦截器
    App.log(`view changed:${from.path}--${to.path}`);
    next();
}).start();
```
1、在App启动前拦截操作
start --- load (./static/config.json)  加载数据配置
route --- log(view changed:{from.path}--{to.path}); 打印页面跳转

plugin.load--> config.js/config --> config-generated.js

####config配置加载流程
plugin.load(./static/config.json)

config.js代码
```
import configDynamic from './config-generated';
for (var key in configDynamic) {
  config[key] = configDynamic[key];
}
export default config;
```

plugin.js代码
```
import Light from "light"
import Config from '@/config';

  load (url, timeout = 1000) {
    return new Promise((resolve) => {
      Light.fetch({
        method: 'GET',
        url: url,
        type: 'json',
        timeout: timeout
      }, function (res) {
        let config = res.ok && res.data ? res.data : {};
        // 赋值到原配置文件，相同字段会被覆盖
        for (var key in config) {
          if (config[key]) {
            Config[key] = config[key];
          }
        }
        resolve(config);
        // 加载配置文件失败
      })
    })
  }
```

1、config.js文件加载 config-generated.js文件，扩展参数
`2、json 赋值到原配置文件，相同字段会被覆盖
最终以“./static/config.json”为准`

####java原生代码挂载
GmuManager.getInstance().openGmu(SplashNetActivity.this, "gmu://main", null, null);
GmuManager.getInstance().openGmu(SplashNetActivity.this, "gmu://login", null, null);

######view/index.vue
```
init($);
```
跳转至home页面

####main.gmu
```
"menus":[
        {
            "title":"首页",
            "action":"gmu://jsnative#home"
        },
        {
            "title":"产品",
            "action":"gmu://jsnative#fund-list"
        },
        {
            "title":"资产",
            "action":"gmu://jsnative#public-asset"
        },
        {
            "title":"更多",
            "action":"gmu://jsnative#setting"
        }
    ]
```
