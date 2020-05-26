---
title: Can't-connect-to-SOCKS-proxy-Connection-refused--connect
date: 2020-05-26 10:55:48
categories:
- 日常问题锦集
---
Can't connect to SOCKS proxy:Connection refused: connect

如上报错，原因是AS设置了代理，可找到项目相面的gradle.properties这个文件，恢复成新建项目内容一致即可
删除这个配置
systemProp.http.proxyHost=127.0.0.1systemProp.http.proxyPort=1080
