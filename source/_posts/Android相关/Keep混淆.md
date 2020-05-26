---
title: Keep混淆
date: 2020-05-26 10:55:48
categories:
- Android相关
---
keep注解 支持变量、方法、构造方法、类、注解
```
@Retention(RetentionPolicy.CLASS)
@Target({ElementType.PACKAGE, ElementType.TYPE, ElementType.ANNOTATION_TYPE, ElementType.CONSTRUCTOR, ElementType.METHOD, ElementType.FIELD})
public @interface Keep {
}
```

混淆文件proguard-rules.pro
```
# Understand the @Keep support annotation.
-dontwarn android.support.**
-keep class android.support.annotation.Keep

-keep @android.support.annotation.Keep class * {*;}

-keepclasseswithmembers class * {
    @android.support.annotation.Keep <methods>;
}

-keepclasseswithmembers class * {
    @android.support.annotation.Keep <fields>;
}

-keepclasseswithmembers class * {
    @android.support.annotation.Keep <init>(...);
}
```

android代码，哪些类不需要混淆，就@Keep即可
