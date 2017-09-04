---
title: "React 16: fragments"
---

在 React 15 中，一个组件的 `render()` 方法是不能返回一个数组作为多个根元素的，如果有这种需求的话，可能需要在这些元素外额外包裹一层 `<div>`。

这样做不仅会产生多余的 DOM 元素，还可能因为 DOM 结构变化导致 CSS 布局出现问题。

``` javascript
class Select extends React.Component {
  render() {
    return (
      <div>
        <Button />
        <Popover />
      </div>
    );
  }
}
```

在 React 16 中，新增加了一个特性叫 fragments，允许组件的 `render()` 方法返回一个 fragment（数组）来同时渲染多个根元素。

``` javascript
class Select extends React.Component {
  render() {
    return [
      <Button key="button" />,
      <Popover key="popover" />,
    ];
  }
}
```

对于 fragments 这个新特性，讨论比较多的一点是是否支持在使用了 fragment 的组件上调用 `ReactDOM.findDOMNode(...)`。[^1][^2]

目前没有看到任何明确的结论表示支持或者不支持。使用 React 16 最新版（16.0.0-beta.5）测试得到的结果是 `ReactDOM.findDOMNode(...)` 会返回 `render()` 返回的 fragment 中第一个元素对应的 DOM 元素。

在 jsx 这边有一个新的语法提案[^3]，意在简化 fragments 的使用方式[^4]：

``` javascript
class Select extends React.Component {
  render() {
    return (
      <>
        <Button />
        <Popover />
      </>
    );
  }
}
```

[^1]: <https://github.com/yannickcr/eslint-plugin-react/issues/678#issuecomment-232293175>
[^2]: <https://github.com/yannickcr/eslint-plugin-react/issues/678#issuecomment-237675148>
[^3]: <https://github.com/facebook/jsx/issues/84>
[^4]: 不再需要数组内的 `,` 分隔符和数组内每项元素上的 `key="..."` 属性。
