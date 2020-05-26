---
title: GSYGithubAppWeex源代码分析
date: 2020-05-26 10:55:48
categories:
- weex专题
---
https://github.com/CarGuo/GSYGithubAppWeex

思路：
创建一个helloworld 简单weex项目
对比 GSYGithubAppWeex项目，
一样的是框架自有代码，不同的为差异性代码，
针对这一部分进行研究

分析得出
```js
config/config.js   
网络配置 proxyTable
config/webpack.common.conf.js 
weexEntry 网页配置入口点
config/logo.png 更换图标
```

初始化差异代码
config
```js
  routerFilePath: 'router.js', //路由
  storeFilePath: 'store.js', //状态
  entryFilePath: 'entry.js', //入口设置

    //chentong http配置
    proxyTable: {
      '/trend':{
          target: 'https://github.com/trending', // 你接口的域名  http://172.00.61.243:8082
          secure: true,      // 如果是https接口，需要配置这个参数
          changeOrigin: true,     // 如果接口跨域，需要进行这个参数配置
          pathRewrite: {
              '^/trend': ''
          }
      }
    },
```
webpack.common.conf.js
```
const weexEntry = {
  'index': helper.root('entry.js'),
  'RepositoryDetailPage': helper.root('entry/RepositoryDetailPage.js'),
  'UserInfoPage': helper.root('entry/UserInfoPage.js'),
  'CodeDetailPage': helper.root('entry/CodeDetailPage.js'),
  'IssueDetailPage': helper.root('entry/IssueDetailPage.js'),
  'CommonListPage': helper.root('entry/CommonListPage.js'),
  'SearchPage': helper.root('entry/SearchPage.js'),
  'WebPage': helper.root('entry/WebPage.js'),
  'EditIssuePage': helper.root('entry/EditIssuePage.js'),
  'SettingPage': helper.root('entry/SettingPage.js'),
}
```

router 与entry 存在映射关系
