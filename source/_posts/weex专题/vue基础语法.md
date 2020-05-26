---
title: vue基础语法
date: 2020-05-26 10:55:48
categories:
- weex专题
---

理解：VUE是个面向对象的语言，将数据和行为封装在一起

```html
<div id="vue_det">
    <h1>site : {{site}}</h1>
    <h1>url : {{url}}</h1>
    <h1>{{details()}}</h1>
</div>
<script type="text/javascript">
    var vm = new Vue({
        el: '#vue_det', 
        data: {
            site: "菜鸟教程",
            url: "www.runoob.com",
            alexa: "10000"
        },
        methods: {
            details: function() {
                return  this.site + " - 学的不仅是技术，更是梦想！";
            }
        }
    })
</script>
```
运行 https://www.runoob.com/try/try.php?filename=vue2-start1
说明：
el 表示 视图id
data 代表 数据资源
methods 代表方法

#####vue模板语法
* 1.插入文本
```html
<div id="app">
  <p>{{ message }}</p>
</div>
```
* 2. 插入html
```
<div id="app">
    <div v-html="message"></div>
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    message: '<h1>菜鸟教程</h1>'
  }
})
</script>
```

3. 属性
v-bind:class ,如果为 true 使用 class1 类的样式，否则不使用该类：
```
<div v-bind:class="{'class1': use}">v-bind:class 指令
  </div>
```
v-开头 是vue定制的方法
```

v-bind:href="url"  href赋值
v-on:click="doSomething" 监听
```

修饰符"."
.prevent 修饰符告诉 v-on 指令对于触发的事件调用 event.preventDefault()：
<form v-on:submit.prevent="onSubmit"></form>

v-model 数据双向绑定
```
<div id="app">
    <p>{{ message }}</p>
    <input v-model="message">
</div>
```
过滤器
"|"管道符
```html
<div id="app">
  {{ message | capitalize }}
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    message: 'runoob'
  },
  filters: {
    capitalize: function (value) {
      if (!value) return ''
      value = value.toString()
      return value.charAt(0).toUpperCase() + value.slice(1)
    }
  }
})
</script>
```

* 缩写
v-bind缩写
```
<!-- 完整语法 -->
<a v-bind:href="url"></a>
<!-- 缩写 -->
<a :href="url"></a>
```
v-on缩写
```
<!-- 完整语法 -->
<a v-on:click="doSomething"></a>
<!-- 缩写 -->
<a @click="doSomething"></a>
```
