---
title: RESTMock
date: 2020-05-26 10:55:48
categories:
- 框架编写分析
---
```
    testImplementation 'com.github.andrzejchm.RESTMock:android:0.3.1'

    allprojects {
	    repositories {
		maven { url "https://jitpack.io" }
	}
    }
```
####use
```
RESTMockServer.whenGET(pathContains("users/andrzejchm"))
            .thenReturnFile(200, "users/andrzejchm.json");
```
url
https://github.com/andrzejchm/RESTMock
