---
title: vue常用命令
date: 2020-05-26 10:55:48
categories:
- weex专题
---
常用命令
```sh
# 查看版本
$ npm -v
2.3.0

#升级 npm
cnpm install npm -g

# 升级或安装 cnpm
npm install cnpm -g
```

在用 Vue.js 构建大型应用时推荐使用 NPM 安装：
```
# 最新稳定版
$ cnpm install vue -g
```

创建项目并运行
```
# 全局安装 vue-cli
$ cnpm install --global vue-cli
# 创建一个基于 webpack 模板的新项目
$ vue init webpack my-project

$ cd my-project
$ cnpm install
$ cnpm run dev
 DONE  Compiled successfully in 2985ms
 I  Your application is running here:http://localhost:8080
```

weex常用命令
```
$ npm install -g weex-toolkit
$ weex -v // 查看当前weex工具版本

weex create awesome-project

cd awesome-app
npm install

npm start

weex platform add ios
weex platform add android

weex run android 
weex run ios
weex run web 

weex debug
```

编译
weex compile src build

预览
 weex src --entry src/foo.vue

代码检查
weex lint 

常用脚本命令
前缀 npm run 
```
    "start": "npm run serve",
    "build": "webpack --env.NODE_ENV=common",
    "build:prod": "webpack --env.NODE_ENV=production",
    "build:prod:web": "webpack --env.NODE_ENV=release",
    "build:plugin": "webpack --env.NODE_ENV=plugin",
    "clean:web": "rimraf ./release/web",
    "clean:ios": "rimraf ./release/ios",
    "clean:android": "rimraf ./release/android",
    "dev": "webpack --env.NODE_ENV=common --progress --watch",
    "unit": "karma start test/unit/karma.conf.js --single-run",
    "test": "npm run unit",
    "lint": "eslint --ext .js,.vue src  test/unit --fix",
    "serve": "webpack-dev-server --env.NODE_ENV=development --progress",
    "ios": "weex run ios",
    "web": "npm run serve",
    "android": "weex run android",
    "pack:ios": "npm run clean:ios && weex build ios",
    "pack:android": "npm run clean:android && weex build android",
    "pack:web": "npm run clean:web && npm run build:prod:web",
    "ide:preview" : "npm run dev"
```
