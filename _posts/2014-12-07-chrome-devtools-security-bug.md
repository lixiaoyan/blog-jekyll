---
title: "Chrome 开发者工具安全漏洞"
---

``` javascript
Object.prototype.__defineGetter__ = function() {
  this.copy("Fuck you!");
};
```

也许你觉得上面的代码没什么特殊的，那么来看一下效果吧。用 Chrome 打开[这个]({{ site.baseurl }}/file/chrome-devtools-security-bug.html)页面，然后打开控制台，随便敲一些什么东西，然后再看一下你的剪贴板吧，是不是已经变成「Fuck you!」了？

但是这篇文章不仅仅止于此，我们还可以继续。之前我曾写过一篇[博客](http://segmentfault.com/blog/intptr/1190000000742286)来记录 v8 特有的某个 API。如果把两者用到一起呢？

``` javascript
Object.prototype.__defineGetter__ = function() {
  console.log(trace()[4].getThis());
};
```

然后我们得到了 `InjectedScript` 这个对象。其实可以利用的不仅仅是这一个函数，比如 `Object.getOwnPropertyNames` 都是可以利用的。但是由于水平不足等原因，我没有继续分析下去，于是这篇博客暂时就写到这里了，That's all。

* * *

之后我又尝试了几次，也翻了一下某[源码](https://code.google.com/p/chromium/codesearch#chromium/src/third_party/WebKit/Source/core/inspector/InjectedScriptSource.js)，似乎真的没什么可利用的东西了。唯一有点效果的大概也就一开始说的那个修改剪贴板了。果然 Chrome 上次被发现有漏洞之后对这些东西格外地用心了么……

* * *

#### 参考文章

- [JavaScriptStackTraceApi - v8-wiki](https://code.google.com/p/v8-wiki/wiki/JavaScriptStackTraceApi)
- [Google Chrome 开发者工具漏洞利用 \| WooYun知识库](http://drops.wooyun.org/papers/974)
