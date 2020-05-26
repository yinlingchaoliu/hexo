---
title: keystore应用签名(md5)
date: 2020-05-26 10:55:48
categories:
- Android相关
---
命令行
```
keytool -v -list  -keystore app/key/demo.jks 
```

 ![md5](https://upload-images.jianshu.io/upload_images/5526061-8d4c60f81a608ae6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

升级jks

```
keytool -importkeystore -srckeystore app/key/hetai.jks -destkeystore app/key/hetai.jks -deststoretype pkcs12
```
