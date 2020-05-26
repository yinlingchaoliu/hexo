---
title: java-io-IOException--Cleartext-HTTP-traffic-to-xxx-xxx-xxx-xxx-not-per
date: 2020-05-26 10:55:48
categories:
- Android相关
---
Android9.0 默认是禁止所有的http请求的，

需要在代码中设置如下代码才可以正常进行网络请求： android:usesCleartextTraffic="true"
```
<application
        android:usesCleartextTraffic="true">
```
更高得编译版本中 ，需要添加配置文件（network_security_config.xml）如下：
```
<application 
android:networkSecurityConfig="@xml/network_security_config">
```
network_security_config文件
```
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <base-config cleartextTrafficPermitted="true"/>
</network-security-config>
```
