---
title: 获得T-class
date: 2020-05-26 10:55:48
categories:
- Android相关
---

获得T.class
```
Class < T >  entityClass  =  (Class < T > ) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[ 0 ];
```

获得return T.class
```
private Type getReturnTye(Method method){
     return ((ParameterizedType)(method.getGenericReturnType())).getActualTypeArguments()[0];
}
```
