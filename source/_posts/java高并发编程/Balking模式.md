---
title: Balking模式
date: 2020-05-26 10:55:48
categories:
- java高并发编程
---
通过标志位，停止返回线程当前操作

```
public class Balking{
    private volatile boolean initFlag=false;

    public synchronized void init(){
      if(initFlag){
        return;
      }

      doSomething();
      initFlag=true;
    }

}
```
