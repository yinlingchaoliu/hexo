---
title: Single-Threaded-Exectution模式
date: 2020-05-26 10:55:48
categories:
- java高并发编程
---
一次只有一个线程通过

示例：
```
public  class Gate{
  private volatile int count = 0;
  public synchionized void pass(){
    //逻辑
    count++;
  }
}
```

使用场景：
多线程访问非线程安全方法，解决方案：使用单线程执行模式。



线程安全方法：
synchronizedCollection方法
synchronizedList方法
synchronizedMap方法
synchronizedSet方法
synchronizedSortedMap方法
synchronizedSortedSet方法

java.util.concurrent方法(JUC方法)
ConcurrentHashMap分段锁存储key-value

详细介绍
[Java7/8 中的 HashMap 和 ConcurrentHashMap 全解析](http://www.importnew.com/28263.html)

[ConcurrentHashMap总结](http://www.importnew.com/22007.html)
