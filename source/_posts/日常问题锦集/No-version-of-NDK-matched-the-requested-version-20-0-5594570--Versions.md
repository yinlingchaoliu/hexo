---
title: No-version-of-NDK-matched-the-requested-version-20-0-5594570--Versions
date: 2020-05-26 10:55:48
categories:
- 日常问题锦集
---
android studio更新到3.6，构建NDK项目的时候NDK版本引起的同步报错

```
android {
    ndkVersion "major.minor.build"
}
```

修改后配置
```
android {
ndkVersion '21.0.6113669'
}
```
