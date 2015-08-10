---
title: "Web: ligatures & kerning"
---

> Web Design is 95% Typography.

* * *

``` css
text-rendering: optimizeLegibility;
```

上面这段样式可以开启浏览器对 ligatures (连字) 与 kerning 的支持，而且也算是比较常见的 <sup>[来源请求]</sup>。但是这个属性并不属于任何 CSS 标准，而是属于 SVG 规范的一部分。其实在 CSS 标准中，定义了其它属性来支持它们。

``` css
font-variant-ligatures: common-ligatures;
font-kerning: normal;
```

就是这两个属性了。第一行的作用是启用 ligatures 支持，第二行是启用 kerning。但是这两个属性的兼容性很差，[第一个](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-ligatures#Browser_Compatibility) 属性基本需要各个浏览器的最新版本才能支持，而 [第二个](https://developer.mozilla.org/en-US/docs/Web/CSS/font-kerning#Browser_Compatibility)，甚至尚无浏览器支持。

``` css
font-feature-settings: "liga" on, "kern" on;
```

继续翻下去，我们还能找到一个名叫 `font-feature-settings` 的属性，并且这个属性的 [兼容性](https://developer.mozilla.org/en-US/docs/Web/CSS/font-feature-settings#Browser_compatibility) 要比上面两个要好一些。这是一个比较底层的属性，它允许我们直接控制 OpenType 的各种高级特性。上面代码中的 `"liga"` 指的是「Standard Ligatures」，`"kern"` 指的是「Kerning」。

然而上面哪组属性兼容性都不是很好，所以在实际使用时需要组合使用，比如下面这个例子：

``` css
text-rendering: optimizeLegibility;
-webkit-font-feature-settings: "liga" on, "kern" on;
-moz-font-feature-settings: "liga" on, "kern" on;
font-feature-settings: "liga" on, "kern" on;
```

上面这段代码可以兼容绝大多数浏览器，并且在我自己写的 [Read.css](http://www.intptr.im/read.css/) 中，就是这么实现的。

最后放一个例子用来测试效果吧~

> ff fi ffi fl ffl
> AV VA
{:style="font-size: 1.5em; line-height: 1.5;"}

* * *

#### 参考文章

- [Web Design is 95% Typography \| Information Architects](https://ia.net/blog/the-web-is-all-about-typography-period/)
- [Typotheque: OpenType features in web browsers — Tests by Gustavo Ferreira](https://www.typotheque.com/articles/opentype_features_in_web_browsers_-_tests)
