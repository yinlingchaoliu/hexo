---
title: Flutter-md5加密
date: 2020-05-26 10:55:48
categories:
- Android相关
---
```
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

// md5 加密
String generateMd5(String data) {
  var content = new Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  // 这里其实就是 digest.toString()
  return hex.encode(digest.bytes);
}
```
