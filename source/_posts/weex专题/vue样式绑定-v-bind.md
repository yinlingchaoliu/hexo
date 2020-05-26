---
title: vue样式绑定-v-bind
date: 2020-05-26 10:55:48
categories:
- weex专题
---
```html
//使用属性active
<div v-bind:class="{ active: isActive }"></div>

//active text-danger 属性相互覆盖
<div  v-bind:class="{ active: isActive, 'text-danger': hasError }">
</div>


//引用vue data数据
<div id="app">
  <div v-bind:class="classObject"></div>
</div>
<script>
new Vue({
  el: '#app',
  data: {
    classObject: {
      active: true,
      'text-danger': false
    }
  }
})
</script>

//引用computed
<div id="app">
  <div v-bind:class="classObject"></div>
</div>
<script>
new Vue({
  el: '#app',
  computed: {
    classObject: function () {
      return {
  		 base:true,
        'active': false,
        'text-danger':true,
      }
    }
  }
})
</script>

//数组语法
<div v-bind:class="[activeClass, errorClass]"></div>
<script>
new Vue({
  el: '#app',
  data: {
    activeClass: 'active',
    errorClass: 'text-danger'
  }
})
</script>

//三目运算符
<div id="app">
<div v-bind:class="[isActive ? activeClass : errorClass]"></div>
</div>
<script>
new Vue({
  el: '#app',
  data: {
    isActive: true,
	activeClass: 'active',
    errorClass: 'text-danger'
  }
})
</script>

//v-bind:style 内联样式 不推荐这种写法
<div v-bind:style="{ color: activeColor, fontSize: fontSize + 'px' }">菜鸟教程</div>
<script>
new Vue({
  el: '#app',
  data: {
    activeColor: 'green',
	fontSize: 30
  }
})
</script>

<div v-bind:style="styleObject">菜鸟教程</div>
<script>
new Vue({
  el: '#app',
  data: {
    styleObject: {
      color: 'green',
      fontSize: '30px'
    }
  }
})
</script>

<div v-bind:style="[baseStyles, overridingStyles]">菜鸟教程</div>
<script>
new Vue({
  el: '#app',
  data: {
    baseStyles: {
      color: 'green',
      fontSize: '30px'
    },
	overridingStyles: {
      'font-weight': 'bold'
    }
  }
})
</script>
```

`只建议v-bind:class 写法
style 这种写法 与html耦合在一起，不易读懂`
