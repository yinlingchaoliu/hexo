---
title: Future模式
date: 2020-05-26 10:55:48
categories:
- java高并发编程
---
提货单模式

异步返回

```
//接口
public interface Data{
  String getContent();
}

//FutureData提货单
public class FutureData implement Data{

private volatile ready = false;
private Data realData ;

public synchrionized void setRealData(Data data){
  this.realData = data;
  this.ready = true;  
  notifyAll();
}

public String getContent(){
  while(!ready){
    wait();
  }
  return realData.getContent();
}

}

//RealData 耗时交易

public class RealData implement Data{
  private String content;

  public void execute(){
    sleep(10);
    content = "耗时交易10s";
  }

  public String getContent(){
    return content;
  }
}

```

调用
```
main(){

  FutureData futureData = new FutureData();
  new Thread(){
  
  public void run(){
    RealData  realData = new RealData();
    //耗时交易
    realData.execute();
    futureData.setRealData(realData);
  }  

  }

  printf("打印"+ futureData.getContent());

}

```

juc

Callable接口
Runable有返回值

Future
FutureTask
