---
title: vue循环语法-v-for
date: 2020-05-26 10:55:48
categories:
- weex专题
---
v-for
v-for 指令需要以 site in sites

各种写法
```
<li v-for="site in sites">
      {{ site.name }}
    </li>

//模板
<template v-for="site in sites">
      <li>{{ site.name }}</li>
      <li>--------------</li>
    </template>

<li v-for="value in object">
    {{ value }}
    </li>

<li v-for="(value, key) in object">
    {{ key }} : {{ value }}
    </li>

<li v-for="(value, key, index) in object">
     {{ index }}. {{ key }} : {{ value }}
    </li>

<li v-for="n in 10">
     {{ n }}
    </li>
```
