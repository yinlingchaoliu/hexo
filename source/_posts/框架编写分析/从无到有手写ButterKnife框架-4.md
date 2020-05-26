---
title: 从无到有手写ButterKnife框架-4
date: 2020-05-26 10:55:48
categories:
- 框架编写分析
---
#####导航
一、[代码的演进](https://www.jianshu.com/p/a96de1aa4e29)
二、[butterKnife反射调用](https://www.jianshu.com/p/f8856e913224)
三、[javapoet自动生成模板代码](https://www.jianshu.com/p/cdf417e52cab)
四、[apt与注解](https://www.jianshu.com/p/43eb69b2beeb)
五、[注解支持多层继承](https://www.jianshu.com/p/a91cbfb8b1a1)
六、[apt调试](https://www.jianshu.com/p/8418ef144b29)
七、[javapoet语法](https://www.jianshu.com/p/2da1ca9d8ffa)

#####1、注解支持多层继承，并且支持field相同去重

继承是树形结构
例如javapoetdemo中的示例![](https://upload-images.jianshu.io/upload_images/5526061-8be1ed95da628def.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
public class BaseActivity extends AppCompatActivity {
    @ViewId(R.id.helloTv)
    TextView helloTv;
}
```

```
public class MainActivity extends BaseActivity {
    @ViewId( R.id.register )
    Button register;
    @ViewId( R.id.login )
    Button login;
}
```

```
public class TestActivity extends MainActivity {
    @ViewId( R.id.guess )
    Button guess;
    @ViewId( R.id.login )
    Button helloTv;
}
```

上面的代码是常见情况
1、支持注解是继承关系
2、支持子类父类field相同，采用子类注解

```
public class ElementTree {
    public ElementTree parentNode = null;
    public List<ElementTree> childNodeList = new ArrayList<>(  );
    public TypeElement typeElement;
    public List<Element> elementList;
    public Set<String> fieldNameSets;
    public String typeName;
    public  boolean isSorted;
}
```

1、思路我们可以获得Map<TypeElement,List<Element>> 当前类，当前类元素列表转换成List< ElementTree >

2、创建根节点 root

3、按照中序的方式(中左右)创建树形关系

4、遍历list< ElementTree > 每个元素，每个元素判断是否有父节点，按照子父排序方式获得所有元素列表List<List<Element>> ,Set<String>

5、用Set<String> 去重


详见算法
https://github.com/yinlingchaoliu/JavaPoetDemo/blob/master/poet-compiler/src/main/java/com/chaoliu/sort/ElementTree.java
https://github.com/yinlingchaoliu/JavaPoetDemo/blob/master/poet-compiler/src/main/java/com/chaoliu/sort/TreeUtils.java

关键在思路，不多于赘述

#####从无到有手写butterKnife框架
https://github.com/yinlingchaoliu/JavaPoetDemo
