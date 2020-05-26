---
title: 使用maven-{-url-"https---jitpack-io"-}-时Failed-to-resolve-
date: 2020-05-26 10:55:48
categories:
- 日常问题锦集
---
一定要放到allproject下,这点要特别注意
而不是buildscript
```
allprojects {
		repositories {
			maven { url 'https://www.jitpack.io' }
		}
	}
```


转载
https://www.jianshu.com/p/cdb36b91b205
