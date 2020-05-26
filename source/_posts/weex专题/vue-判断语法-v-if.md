---
title: vue-判断语法-v-if
date: 2020-05-26 10:55:48
categories:
- weex专题
---
```
v-if="seen"  判断 // true 或false 判断js函数
v-else-if
v-else 
v-show  判断是否显示
```

```
<div id="app">
    <div v-if="type === 'A'">
      A
    </div>
    <div v-else-if="type === 'B'">
      B
    </div>
    <div v-else-if="type === 'C'">
      C
    </div>
    <div v-else>
      Not A/B/C
    </div>
    <div v-show="ok">
      v-show
    </div>
</div>
    
<script>
new Vue({
  el: '#app',
  data: {
    type: 'C',
    ok: true
  }
})
</script>
```
