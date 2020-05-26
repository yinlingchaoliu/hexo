---
title: Android-Studio-解决resolve-dependencies-'classpath'卡住
date: 2020-05-26 10:55:48
categories:
- 日常问题锦集
---
一、代理问题

gradle.properties设置两行

systemProp.http.proxyHost=127.0.0.1
systemProp.http.proxyPort=2273

systemProp.https.proxyHost=127.0.0.1
systemProp.https.proxyPort=2273

二、编译器问题
google官网换最新AndroidStudio
