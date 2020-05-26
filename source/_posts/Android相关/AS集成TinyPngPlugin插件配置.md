---
title: AS集成TinyPngPlugin插件配置
date: 2020-05-26 10:55:48
categories:
- Android相关
---
####配置

```
apply plugin: 'com.waynell.tinypng'

buildscript {
    repositories {
        jcenter()
        google()
    }
    dependencies {
        classpath 'com.waynell.tinypng:TinyPngPlugin:1.0.5'
    }
}

//命令：./gradlew tinyPng
tinyInfo {
    resourceDir = [
            // your res dir
            "app/src/main/res",
            "lib/src/main/res"
    ]
    resourcePattern = [
            // your res pattern
            "drawable[a-z-]*",
            "mipmap[a-z-]*"
    ]
    whiteList = [
            // your white list, support Regular Expressions
    ]
    apiKey = 'xxxxxx'

}
```

命令：gradle  tinyPng

https://github.com/yinlingchaoliu/TinyPngPlugin
