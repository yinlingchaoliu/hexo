---
title: 层叠样式表（CSS）讲义（精）
date: 2020-05-26 10:55:48
categories:
- weex专题
---
##### 1、概念
层叠样式表（CSS）
Cascading Style Sheets 
 [kæˈskeɪdɪŋ] 
语义解释：
1、每个样式有一个或多个属性
2、样式可以级联追加
3、后面相同的属性，覆盖前一个

##### 2、简单语法
新名词
```
声明块{
属性：属性值
...
}
```

```
h1 {
  color: blue;
  background-color: yellow;
  border: 1px solid black;
}
```

导入css
import

适当缩进使 CSS 更具可读性
简写
```css
顺时针🔃
//top、right、bottom、left。 
padding: 10px 15px 15px 5px;
//等同于
padding-top: 10px;
padding-right: 15px;
padding-bottom: 15px;
padding-left: 5px;

background: red url(bg-graphic.png) 10px 10px repeat-x fixed;

background-color: red;
background-image: url(bg-graphic.png);
background-position: 10px 10px;
background-repeat: repeat-x;
background-scroll: fixed;
```
#####3、数值和颜色
像素px 绝对单位
mm, cm, in: 毫米（Millimeters），厘米（centimeters），英寸（inches）
pt, pc: 点（Points (1/72 of an inch)）， 十二点活字（ picas (12 points.)）

相对单位
em  缺点 em单位会继承父元素的字体大小
1em = 16px

rem  旧版ie支持不好。不会继承
百分比：

动画效果
```css
@keyframes rotate {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
  }
}

p {
  color: red;
  width: 100px;
  font-size: 40px;
  transform-origin: center;
}

p:hover {
  animation-name: rotate;
  animation-duration: 0.6s;
  animation-timing-function: linear;
  animation-iteration-count: 5;
}
```

p:nth-child(1) 位置

opacity: 0.5; 不透明度

颜色
16进制：#ff0000
rgb ： rgb(255,0,0)

hsl：hsl(0,100%,50%);//旧版IE不支持
//增加透明度
rgba: rgba(255,0,0,0.5);
hsla: hsla(240,100%,50%,0.5);
```
色调，饱和度，明度
色调：颜色的底色调。这个值在0到360之间，表示色轮的角度。
饱和度：饱和度是多少？这需要一个从0-100%的值，其中0是没有颜色（它将显示为灰色），100%是全彩色饱和度。
明度：颜色有多亮或明亮？这需要一个从0-100%的值，其中0是无光（它会出现全黑的），100%是充满光的（它会出现全白）。
```

```
/* calculate the new position of an element after it has been rotated by 45 degress */
transform: rotate(45deg);
/* calculate the new position of an element after it has been moved across 50px and down 60px */
transform: translate(50px, 60px);
/* calculate the computed value of 90% of the current width minus 15px */
width: calc(90% - 15px);
/* fetch an image from the network to be used as a background image */
background-image: url('myimage.png');
```
#####4、盒模型(Box_model)

![](https://upload-images.jianshu.io/upload_images/5526061-fde4178cf8b7f42f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

width和height:设置内容框宽度和高度
padding:内边距
border: 边界
margin: 外边距

溢流：overflow(溢出)
auto : 隐藏，滚动可见
hiden:隐藏
visible:溢流内容显示边界外（默认）

背景剪裁 background-clip
轮廓 outline

css框类型 <span>
block 块框
inline 行内框
inline-block 行内块状框
 
涉及属性
控制框盒中内容流的属性 
overflow
控制框盒大小的属性
height width
max-height min-height
max-width min-width
控制外边距 Margin 的属性
 margin 
margin-top 
margin-bottom 
margin-left 
margin-right 
margin-trim
控制内边距 Padding 的属性
padding
 padding-top 
padding-bottom 
padding-left 
padding-right 
其他属性
visibility

#####5、FlexBox(弹性盒子)
section {
  display:flex
}

flex模型
![](https://upload-images.jianshu.io/upload_images/5526061-3538dbf9034b051d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

*   **主轴（main axis）**是沿着 flex 元素放置的方向延伸的轴（比如页面上的横向的行、纵向的列）。该轴的开始和结束被称为** main start** 和** main end**。
*   **交叉轴（cross axis）**是垂直于 flex 元素放置方向的轴。该轴的开始和结束被称为 **cross start** 和** cross end**。
*   设置了 `display: flex` 的父元素（在本例中是 [`<section>`](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Element/section "HTML Section 元素 (<section>) 表示文档中的一个区域（或节），比如，内容中的一个专题组，一般来说会有包含一个标题（heading）。一般通过是否包含一个标题 (<h1>-<h6> element) 作为子节点 来 辨识每一个<section>。")）被称之为 **flex 容器（flex container）。**
*   在 flex 容器中表现为柔性的盒子的元素被称之为 **flex 项**（**flex item**）（本例中是 [`<article>`](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Element/article "<article>元素表示文档、页面、应用或网站中的独立结构，其意在成为可独立分配的或可复用的结构，如在发布中，它可能是论坛帖子、杂志或新闻文章、博客、用户提交的评论、交互式组件，或者其他独立的内容项目。") 元素。
flutter 线性布局 采用flexbox
 
flexbox讲义推荐
http://www.ruanyifeng.com/blog/2018/10/flexbox-form.html
