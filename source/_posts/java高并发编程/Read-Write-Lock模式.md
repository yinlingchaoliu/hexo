---
title: Read-Write-Lock模式
date: 2020-05-26 10:55:48
categories:
- java高并发编程
---
读写锁

```
public class Data{
  private String buffer;
  private final ReadWriteLock lock = new ReadWriteLock();

  public String read(){
      lock.readLock();
      try{
            return doRead();
      }finally{
            lock.readUnlock();  
      }
  }

public void write(String buffer){
      lock.writeLock();
      try{
            return doWrite();
      }finally{
            lock.writeUnlock();  
      }
  }

}
```

ReentrantReadWriteLock
重入读写锁

```
public class ReentrantData{

  private String buffer;
  
  private final ReadWriteLock lock = new ReentrantReadWriteLock();
  private final readLock = lock.readLock();
  private final writeLock = lock.writeLock();

  public String read(){
      readLock.lock();
      try{
            return doRead();
      }finally{
            readLock.unLock();
      }
  }

public void write(String buffer){
      writeLock.lock();
      try{
            return doWrite();
      }finally{
            writeLock.unLock();  
      }
  }

}
```

锁降级  降级为读锁

获取写入锁
获取读取锁
释放写入锁
