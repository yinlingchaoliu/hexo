---
title: light框架-vue语法惯用法
date: 2020-05-26 10:55:48
categories:
- weex专题
---
#### 思路
好的惯用法，可以让写法更地道
这些好的方法套路中，提供不错的复用方案

###### 1、组件循环，实现从上到下线性布局，提高复用性，items限制
```
<template>
  <div class="flex-1">
    <scroller :style="{height: scrollerHeight + 'px'}">
      <refresher :refreshing.sync="refreshing" :top="200" :showOwnLoading="false"></refresher>
      <component v-bind:is="item.name" :param="item.data" v-for="(item) in items" :key="item.name" :refreshing.sync="refreshing"></component>
      <div class="h300"></div>
    </scroller>
    <bottombar-index :activeIndex="3"></bottombar-index>
  </div>
</template>

<script>
  import navbar from '@/components/ui/navbar';
  import bottombarIndex from '@/components/ui/bottombar-index';
  import sMineheader1 from '@/market/s-mineheader1/s-mineheader1';
  import sMinecenter1 from '@/market/s-minecenter1/s-minecenter1';
  import sMinebottom1 from '@/market/s-minebottom1/s-minebottom1';
export default {
    components: {
      bottombarIndex,
      navbar,
      refresher,
      sMineheader1,
      sMinecenter1,
      sMinebottom1
    },
   data(){
    return {
      items: [
          {
            name: "sMineheader1",  //组件名
            data: {}
          },
          {
            name: "s-minecenter1", //组件网页名
            data: {}
          },
          {
            name: "sMinebottom1",
            data: {}
          }
        ]
    }
  }   
}
</script>
```
* 分析 
无论是何种布局，都可以抽象理解为从上至下排布的线性布局，无非是粒度大小，界面中布局代码被迁移到不同组件中，极大提升复用

######2、组件循环，以components为准
```
<template>
<div class="flex-1">
	  <scroller @scroll="scrollHandler" :style="{height: scrollerHeight + 'px'}" class="flex-1">
	    <refresher :refreshing.sync="refreshing"></refresher>
	    <s-pop-adv :param="popAdvParam" v-if="popAdvParam"></s-pop-adv>
	    <component v-bind:is="item.type" :param="item" v-for="(item, index) in components" :key="index"></component>
	  </scroller>
	  <bottombar-index :activeIndex="0"></bottombar-index>
	</div>
</template>

<script>
export default {
  components: {
    bottombarIndex,
    refresher,
    banner,
    shortcuts,
    cashs,
    themeRecommMatrix,
    themeRecommMatrix2,
    viceBanner,
    recommProds,
    sPopAdv,
    textContents,
    cmsNewsList,
    marqueeView
  }
}
</script>
```
解耦更加直接，以componet为单位，复用性更强

###### 3、导航栏navbar
项目中，不推荐隐式调用形式，只有显示声明才能代码拥有良好可阅读性
```
<navbar title="产品列表" theme="dark" :bottomLineShow="false" :leftBtnShow="false" :statusbar="isApp">
      <div slot="rightBtn1" class="p20 ml30" @click="jump('search')">
        <image class="top-right-img" :src="imageOfTheme('search')"></image>
      </div>
    </navbar>
```
🚫禁止 header中含有navbar，这样写法具有迷惑性
```
components: {
      navbar,
      refresher,
      sMineheader1,          
},
```
