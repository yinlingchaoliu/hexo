---
title: Java-得到泛型中得到T-class
date: 2020-05-26 10:55:48
categories:
- Java核心基础
---
Class <T> entityClass = (Class <T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]; 

转载
https://www.cnblogs.com/onlysun/p/4539472.html
