---
title: vue-Ajax网络通讯
date: 2020-05-26 10:55:48
categories:
- weex专题
---
http 网络请求
https://www.runoob.com/vue2/vuejs-ajax.html

// 基于全局Vue对象使用http
Vue.http.get('/someUrl', [options]).then(successCallback, errorCallback);
Vue.http.post('/someUrl', [body], [options]).then(successCallback, errorCallback);

// 在一个Vue实例内使用$http
this.$http.get('/someUrl', [options]).then(successCallback, errorCallback);
this.$http.post('/someUrl', [body], [options]).then(successCallback, errorCallback);
