---
title: "Chrome 下 ::selection 背景颜色的渲染问题"
---

![Chrome Selection]({{ site.baseurl }}/img/chrome-selection.png)

在 Chrome 里，修改 `::selection` 的 `background-color` 后，某些情况下，仍然会有部分选择区域依然保持着默认的高亮颜色。本篇博客会记录下可能会导致这种情况的多种原因。

* * *

``` html
<inline>
  <block />
</inline>
```

在 inline (`*-level inline`) 元素内部有 block (`block-level *`) 元素的情况下。

* * *

``` html
<inline />
<block />

<inline-block />
<block />
```

在 inline / inline-block (`inline-level *`) 元素与 block (`block-level *`) 元素为同级元素的情况下。

* * *

``` html
[text]
<block />
```

在文本节点与 block (`block-level *`) 元素为同级元素的情况下。

* * *

``` html
<ul>
  <li></li>
</ul>

<ol>
  <li></li>
</ol>
```

`<li>` (`display: list-item;`) 的默认 `::marker` 元素。
