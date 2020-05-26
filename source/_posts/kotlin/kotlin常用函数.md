---
title: kotlin常用函数
date: 2020-05-26 10:55:48
categories:
- kotlin
---
####repeat

代码块重复执行
```
repeat(3) {
        println("Hello world")
    }
```

####with
对当前类操作，内部操作
```
with(ArrayList<String>()) {
        add("testWith")
        add("testWith")
        add("testWith")
        println("this = " + this)
    }.let{
    println(it)
    }
```

####let
相当于return小函数
```
url?.let{
    println(it)
    return 1
}

相当于
fun test(url :String) :Int{
    var it = url
    println(it)
   return 1
}
```

####apply
fun <T> T.apply(f: T.() -> Unit): T { f(); return this }
返回当前对象

```
ArrayList<String>().apply {
        add("testApply")
        add("testApply")
        add("testApply")
        println("this = " + this)
    }.let { println(it) }
```

####run
返回最后一个函数值
```
    "testRun".run {
        println("this = " + this)
        test()
    }.let { println(it) }

 fun test() = 1
```

####also
执行block 返回this
```
public inline fun <T> T.also(block: (T) -> Unit): T {
    block(this)
    return this
}
```
